from flask_sqlalchemy import SQLAlchemy
from app.models import Movie, People, Genre, JobCategories, Country, Photo

# from sqlalchemy import create_engine
# from sqlalchemy.orm import sessionmaker, Session, declarative_base

# engine = create_engine('postgresql://movies:in!Tpa5s@localhost:5432/movies', echo=True)
# db = declarative_base()


def create_movie(db: SQLAlchemy, data: dict):
    movie = Movie.query.filter_by(imdb_id=data['imdb_id']).first()
    if movie is None:
        movie = Movie(
            imdb_id=data.get('imdb_id', ''),
            imdb_url=data.get('imdb_url', ''),
            title=data.get('title', ''),
            description=data.get('description', ''),
            avatar=data.get('avatar', ''),
            banner=data.get('banner', ''),
            trailer=data.get('trailer', ''),
            year=data.get('year', ''),
            age=data.get('age', ''),
            budget=data.get('budget', ''),
            rating=data.get('rating', ''),
            runtime=data.get('runtime', ''),
            original_lang=data.get('original_lang', ''),
            production_co=data.get('production_co', '')
        )
    else:
        movie.imdb_url = data.get('imdb_url', movie.imdb_url)
        movie.title = data.get('title', movie.title)
        movie.description = data.get('description', movie.description)
        movie.avatar = data.get('avatar', movie.avatar)
        movie.banner = data.get('banner', movie.banner)
        movie.trailer = data.get('trailer', movie.trailer)
        movie.year = data.get('year', movie.year)
        movie.age = data.get('age', movie.age)
        movie.budget = data.get('budget', movie.budget)
        movie.rating = data.get('rating', movie.rating)
        movie.runtime = data.get('runtime', movie.runtime)
        movie.original_lang = data.get('original_lang', movie.original_lang)
        movie.production_co = data.get('production_co', movie.production_co)

    for genre in create_genre(db, data.get('genres', [])):
        movie.genres.append(genre)

    for director in create_people(db, data.get('directors', [])):
        movie.directors.append(director)

    for writer in create_people(db, data.get('writers', [])):
        movie.writers.append(writer)

    for artist in create_people(db, data.get('artists', [])):
        movie.artists.append(artist)

    for country in create_country(db, data.get('countries', [])):
        movie.countries.append(country)

    for photo in create_photo(db, data.get('photos', [])):
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


def create_people(db: SQLAlchemy, data: list):
    for item in data:
        people = People.query.filter_by(imdb_id=item['imdb_id']).first()

        if people is None:
            new_item = item.get('_func')()
            item['job_categories'] = new_item.get('job_categories', [])
            people = People(
                imdb_id=item.get('imdb_id', ''),
                imdb_url=item.get('imdb_url', ''),
                full_name=new_item.get('full_name', ''),
                bio=new_item.get('bio', ''),
                avatar=new_item.get('avatar', ''),
                total_movies=new_item.get('total_movies', ''),
            )
        else:
            people.imdb_url = item.get('imdb_url', people.imdb_url)
            people.full_name = item.get('full_name', people.full_name)
            people.bio = item.get('bio', people.bio)
            people.avatar = item.get('avatar', people.avatar)
            people.total_movies = item.get('total_movies', people.total_movies)

        for job in create_job_categories(db, item.get('job_categories', [])):
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


if __name__ == '__main__':
    pass
    # session = sessionmaker(engine)()

    # session.commit()