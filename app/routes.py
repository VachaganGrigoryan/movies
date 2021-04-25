import math

from flask import flash, jsonify, redirect, render_template, request, make_response, url_for
from flask_paginate import Pagination, get_page_args

from flask import current_app as app
from sqlalchemy import or_

from . import db
# from .forms import MovieSearchForm
from .models import Movie, People, Genre


# from random import sample

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


@app.route('/', methods=['GET', 'POST'])
def index():
    # search_form = MovieSearchForm(request.form)
    # if request.method == 'POST':
    #     return search(search_form)

    movies = Movie.query.all()
    return render_template("index.html", title="All Movies", movies=movies)


@app.route('/movies', methods=['GET', 'POST'])
def movies():
    try:
        page, per_page = int(request.args.get('page', 1)), int(request.args.get('per_page', 10))
    except Exception:
        return redirect(url_for('movies'))

    movies = Movie.query.paginate(page, per_page, error_out=False, max_per_page=20)

    # page, per_page, offset = get_page_args(page_parameter='page',
    #                                        per_page_parameter='per_page')
    # total = len(movies)
    #
    # pagination_movies = movies[offset: offset + per_page]
    #
    # pagination = Pagination(page=page, per_page=per_page, total=total, css_framework='bootstrap4',
    #                         prev_label='❮', next_label='❯')
    print(movies.pages)
    return render_template(
        "movie-category.html",
        title="All Movies",
        movies=movies,
        # page = page,
        # per_page=per_page,
        # pagination=pagination,
    )


@app.route('/movies/<int:movie_id>', methods=['GET', 'POST'])
def movies_detail(movie_id):
    movie = Movie.query.filter_by(id=movie_id).first_or_404()
    movies = Movie.query.filter(Movie.genres.any(Genre.id.in_(g.id for g in movie.genres)), Movie.id != movie.id).all()

    return render_template('movie-details.html', movie=movie, movies=movies)


@app.route('/people/<int:people_id>', methods=['GET', 'POST'])
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


    # movie = Movie(
    #     title='Title',
    #     age='18+'
    # )
    # db.session.add(movie)
    # db.session.commit()

# @app.route('/search')
# def search(search_form):
#
#     print(search_form.search)
#
#     return redirect('movies')


# @app.route('/add_project', methods=["GET", "POST"])
# @login_required
# def add_project():
#     form = AddProjectForm()
#     if form.validate_on_submit():
#         if form.header_image.data:
#             header_image = save_picture(form.header_image.data)
#         project = Project(title=form.title.data, description=form.description.data, header_image=header_image, user_id=current_user.id)
#         if form.project_images.data:
#             for image in form.project_images.data:
#                 image = save_picture(image)
#                 project.project_images.append(ImageSet(image=image))
#                 time.sleep(2)
#         db.session.add(project)
#         db.session.commit()
#         flash('Project Successfully Added', 'succes')
#         return render_template('add_project.html', title='Add Project', form=form)
#     return render_template('add_project.html', title='Add Project', form=form)
