#!/bin/bash
# start.sh

export FLASK_APP=wsgi.py
export FLASK_DEBUG=1
export APP_CONFIG_FILE=config.ini
export SQLALCHEMY_DATABASE_URI=sqlite:///movies.db
export SQLALCHEMY_TRACK_MODIFICATIONS=False
flask run