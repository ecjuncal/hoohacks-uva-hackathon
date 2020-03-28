import os

class Config:
    # General Config
    TESTING = True
    DEBUG = True

    SQLALCHEMY_DATABASE_URI = 'sqlite:///localdb.db'
    SQLALCHEMY_TRACK_MODIFICATIONS = False
