from flask_sqlalchemy import SQLAlchemy
from app.models import Movie, People, Genre, JobCategories, Country, Photo
from scraper.datamodel import MovieData, PeopleData
from typing import List


def create_movie(db: SQLAlchemy, data: MovieData):
    movie = Movie.query.filter_by(imdb_id=data.imdb_id).first()
    if movie is None:
        data.look_up()
        movie = Movie(
            imdb_id=data.imdb_id,
            imdb_url=data.imdb_url,
            title=data.title,
            avatar=data.avatar,
            description=data.description,
            banner=data.banner,
            trailer=data.trailer,
            year=data.year,
            age=data.age,
            budget=data.budget,
            rating=data.rating,
            runtime=data.runtime,
            original_lang=data.original_lang,
            production_co=data.production_co
        )
    else:
        movie.imdb_url = data.imdb_url
        movie.title = data.title
        movie.avatar = data.avatar

    for genre in create_genre(db, data.genres):
        movie.genres.append(genre)

    for director in create_people(db, data.directors):
        movie.directors.append(director)

    for writer in create_people(db, data.writers):
        movie.writers.append(writer)

    for artist in create_people(db, data.artists):
        movie.artists.append(artist)

    for country in create_country(db, data.countries):
        movie.countries.append(country)

    for photo in create_photo(db, data.photos):
        movie.photos.append(photo)

    print(movie.to_dict())
    db.session.add(movie)
    db.session.commit()


def create_genre(db: SQLAlchemy, data: list):
    for name in data:
        genre = Genre.query.filter_by(name=name).first()

        if genre is None:
            genre = Genre(name=name)
            db.session.add(genre)

        yield genre


def create_people(db: SQLAlchemy, data: List[PeopleData]):
    for item in data:
        people = People.query.filter_by(imdb_id=item.imdb_id).first()

        if people is None:
            item.look_up()
            people = People(
                imdb_id=item.imdb_id,
                imdb_url=item.imdb_url,
                full_name=item.full_name,
                bio=item.bio,
                avatar=item.avatar,
                born_info=item.born_info,
                death_info=item.death_info
            )
        else:
            people.imdb_url = item.imdb_url
            people.full_name = item.full_name

        for job in create_job_categories(db, item.job_categories):
            people.job_categories.append(job)

        db.session.add(people)

        yield people


def create_job_categories(db: SQLAlchemy, data: list):
    for name in data:
        job = JobCategories.query.filter_by(name=name).first()

        if job is None:
            job = JobCategories(name=name)
            db.session.add(job)

        yield job


def create_country(db: SQLAlchemy, data: list):
    for name in data:
        country = Country.query.filter_by(name=name).first()

        if country is None:
            country = Country(name=name)
            db.session.add(country)

        yield country


def create_photo(db: SQLAlchemy, data: list):
    for image in data:
        photo = Photo.query.filter_by(image=image).first()

        if photo is None:
            photo = Photo(image=image)
            db.session.add(photo)

        yield photo
