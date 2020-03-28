from . import db
from . import bcrypt

class User(db.Model):
    __tablename__ = 'users'

    id = db.Column(db.Integer, primary_key=True)
    email = db.Column(db.String(80), index=True, unique=True, nullable=False)
    first_name = db.Column(db.String(50), index=False, unique=True, nullable=False)
    last_name = db.Column(db.String(50), index=False, unique=True, nullable=False)
    password = db.Column(db.String(128), nullable=False)
    created = db.Column(db.DateTime, index=False, unique=False, nullable=False)

    def set_password(self, plaintext_password):
        self.password = bcrypt.generate_password_hash(plaintext_password)

    def is_correct_password(self, plaintext_password):
        return bcrypt.check_password_hash(self.password, plaintext_password)