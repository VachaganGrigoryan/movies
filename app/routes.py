import math

from flask import flash, jsonify, redirect, render_template, request, make_response, url_for

from flask import current_app as app

from . import db
# from .forms import MovieSearchForm
from .models import Movie, People, Genre

from random import randrange, choices

def_per_page = app.config.get('PER_PAGE')


# Ensure responses aren't cached
@app.after_request
def after_request(response):
    response.headers["Cache-Control"] = "no-cache, no-store, must-revalidate"
    response.headers["Expires"] = 0
    response.headers["Pragma"] = "no-cache"
    return response


@app.errorhandler(404)
def page_not_found(e):
    return render_template('404.html'), 404


@app.route('/')
def index():
    movies = choices(Movie.query.all(), k=app.config.get('MOVIE_COUNT'))
    return render_template("index.html", title="Home", movies=movies)


@app.route('/movies', endpoint='movies')
@app.route('/movies/<genre>', endpoint='movies_genre')
def movies(genre=None):
    try:
        page, per_page = int(request.args.get('page', 1)), int(request.args.get('per_page', def_per_page))
    except Exception:
        return redirect(url_for('movies'))

    if genre:
        movies = Movie.query.filter(
            Movie.genres.any(Genre.name == genre)
        ).paginate(page, per_page, error_out=False, max_per_page=20)
    else:
        movies = Movie.query.paginate(page, per_page, error_out=False, max_per_page=20)

    genres = Genre.query.all()
    return render_template("movie-category.html", title="All Movies", movies=movies, genres=genres, genre=genre)


@app.route('/movies/<int:movie_id>')
def movies_detail(movie_id):
    movie = Movie.query.filter_by(id=movie_id).first_or_404()
    movies = choices(Movie.query.filter(
        Movie.genres.any(Genre.id.in_(g.id for g in movie.genres)),
        Movie.id != movie.id
    ).all(), k=app.config.get('MOVIE_COUNT'))

    return render_template('movie-details.html', movie=movie, movies=movies)


@app.route('/people/<int:people_id>')
def people_detail(people_id):
    people = People.query.filter_by(id=people_id).first_or_404()
    directed_or_wrote_movies = Movie.query.filter(db.or_(
        Movie.directors.any(People.id == people.id),
        Movie.writers.any(People.id == people.id)
    )).all()
    acted_movies = Movie.query.filter(Movie.artists.any(People.id == people.id)).all()
    movies = {
        'directed_or_wrote_movies': directed_or_wrote_movies,
        'acted': acted_movies,
    }
    return render_template('people-details.html', people=people, movies=movies)


@app.route('/shows')
def shows():
    return render_template("show-category.html", title="All Shows")


@app.route('/about')
def about():
    return render_template("about-us.html", title="About us")
