from flask import Flask
from flask_sqlalchemy import SQLAlchemy
# from flask_session import Session
from random import seed

db = SQLAlchemy()


def create_app(config: str):
    """Construct the core application."""
    app = Flask(__name__, instance_relative_config=False)
    # app.register_error_handler(404, page_not_found)
    if config is not None:
        app.config.from_object(config)
        # app.config.from_pyfile(config)
    db.init_app(app)
    seed(1)

    with app.app_context():
        # Imports
        from . import routes

        # Create tables for our models
        db.create_all()

        return app