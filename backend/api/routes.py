from flask import Flask, request, jsonify
from flask import current_app as app
from .models import *

# GET Routes
@app.route("/", methods=['GET'])
def index():
    return jsonify({"success": True})

@app.route("/register", methods=['POST'])
def register():
    return request.data
