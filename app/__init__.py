from flask import Flask
from flask_sqlalchemy import SQLAlchemy
# from flask_session import Session
from random import seed

db = SQLAlchemy()


def create_app():
    """Construct the core application."""
    app = Flask(__name__, instance_relative_config=False)
    app.config.from_object('config.Config')
    # Session(app)
    db.init_app(app)
    seed(1)

    with app.app_context():
        # Imports
        from . import routes

        # Create tables for our models
        db.create_all()

        return app