from flask_sqlalchemy import SQLAlchemy
from app.models import Movie

# from sqlalchemy import create_engine
# from sqlalchemy.orm import sessionmaker, Session, declarative_base

# engine = create_engine('postgresql://movies:in!Tpa5s@localhost:5432/movies', echo=True)
# db = declarative_base()


def create_movie(db: SQLAlchemy, data: dict):
    movie = Movie.query.filter_by(title=data['title']).first()
    if movie is None:
        movie = Movie(
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
            production_companies=data.get('production_companies', '')
        )
    else:
        movie.title = data.get('title', ''),
        movie.description = data.get('description', ''),
        movie.avatar = data.get('avatar', ''),
        movie.banner = data.get('banner', ''),
        movie.trailer = data.get('trailer', ''),
        movie.year = data.get('year', ''),
        movie.age = data.get('age', ''),
        movie.budget = data.get('budget', ''),
        movie.rating = data.get('rating', ''),
        movie.runtime = data.get('runtime', ''),
        movie.original_lang = data.get('original_lang', ''),
        movie.production_companies = data.get('production_companies', '')

    create_genre(db, data.get('genres', []))
    print(movie.to_dict())
    db.session.add(movie)
    db.session.commit()


def create_genre(db: SQLAlchemy, data: list):
    pass


def create_people(data: dict):
    pass



if __name__ == '__main__':
    pass
    # session = sessionmaker(engine)()

    # session.commit()