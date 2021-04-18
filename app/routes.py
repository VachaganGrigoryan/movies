from flask import flash, jsonify, redirect, render_template, request, make_response

from flask import current_app as app
# from .models import
# from random import sample


# Ensure responses aren't cached
@app.after_request
def after_request(response):
    response.headers["Cache-Control"] = "no-cache, no-store, must-revalidate"
    response.headers["Expires"] = 0
    response.headers["Pragma"] = "no-cache"
    return response


@app.route('/', methods=['GET', 'POST'])
def index():
    return render_template("home.html")
