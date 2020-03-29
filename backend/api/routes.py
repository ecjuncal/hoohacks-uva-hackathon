from flask import Flask, request, jsonify
from flask import current_app as app
from .models import *
from .reponses import *

from datetime import datetime as dt


@app.route("/login", methods=['POST'])
def login():
    data = request.get_json()
    email = data['email']
    password = data['password']

    if email and password:
        user_exists = User.query.filter(User.email == email).first()

        if user_exists and user_exists.is_correct_password(password):
            return jsonify({**{"error": False}, **user_exists.serialize()})

    return jsonify(ErrorResponse("User does not exist or credentials are incorrect.").__dict__)


@app.route("/register", methods=['POST'])
def register():
    data = request.get_json()
    fname = data['fname']
    lname = data['lname']
    email = data['email']
    password = data['password']

    if fname and lname and email and password:
        user_exists = User.query.filter(User.email == email).first()

        if user_exists:
            return jsonify(ErrorResponse("User with that email already exists").__dict__)

        new_user = User(first_name=fname, last_name=lname, email=email, created=dt.now())
        new_user.set_password(password)

        db.session.add(new_user)
        db.session.commit()

        return jsonify(SuccessResponse("User successfully created").__dict__)
    else:
        return jsonify(ErrorResponse("Missing information.").__dict__)


@app.route("/user", methods=['GET'])
def get_user():
    data = request.get_json()
    email = data['email']

    if email:
        user_exists = User.query.filter(User.email == email).first()

        if user_exists:
            return jsonify({**{"error": False}, **user_exists.serialize()})

    return jsonify(ErrorResponse("User does not exist.").__dict__)
