from app import db


genre_identifier = db.Table('genre_identifier',
    db.Column('movie_id', db.Integer, db.ForeignKey('movie.id')),
    db.Column('genre_id', db.Integer, db.ForeignKey('genre.id'))
)
genre_people_identifier = db.Table('genre_people_identifier',
    db.Column('people_id', db.Integer, db.ForeignKey('people.id')),
    db.Column('genre_id', db.Integer, db.ForeignKey('genre.id'))
)
country_identifier = db.Table('country_identifier',
    db.Column('movie_id', db.Integer, db.ForeignKey('movie.id')),
    db.Column('country_id', db.Integer, db.ForeignKey('country.id'))
)
director_identifier = db.Table('director_identifier',
    db.Column('movie_id', db.Integer, db.ForeignKey('movie.id')),
    db.Column('director_id', db.Integer, db.ForeignKey('people.id'))
)
producer_identifier = db.Table('producer_identifier',
    db.Column('movie_id', db.Integer, db.ForeignKey('movie.id')),
    db.Column('producer_id', db.Integer, db.ForeignKey('people.id'))
)
writer_identifier = db.Table('writer_identifier',
    db.Column('movie_id', db.Integer, db.ForeignKey('movie.id')),
    db.Column('writer_id', db.Integer, db.ForeignKey('people.id'))
)
artist_identifier = db.Table('artist_identifier',
    db.Column('movie_id', db.Integer, db.ForeignKey('movie.id')),
    db.Column('artist_id', db.Integer, db.ForeignKey('people.id'))
)


class Country(db.Model):
    __tablename__ = 'country'

    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(120), nullable=False)


class Genre(db.Model):
    __tablename__ = 'genre'

    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(120), nullable=False)


class People(db.Model):
    __tablename__ = 'people'

    id = db.Column(db.Integer, primary_key=True)
    full_name = db.Column(db.String(120), nullable=False)
    avatar = db.Column(db.String(30), nullable=False, default='default_avatar.jpg')
    date_of_birth = db.Column(db.Date)
    place_of_birth = db.Column(db.String())
    genres = db.relationship(Genre, backref='genre', lazy=True, secondary=genre_people_identifier)
    total_movies = db.Column(db.String(10))

    def __init__(self, full_name, date_of_birth, place_of_birth, genres, total_movies):
        self.full_name = full_name
        self.date_of_birth = date_of_birth
        self.place_of_birth = place_of_birth
        self.genres = genres
        self.total_movies = total_movies

    def __repr__(self):
        return f"<People ('{self.full_name}', '{self.date_of_birth}', '{self.place_of_birth}', '{self.genres}')>"


class Movie(db.Model):
    __tablename__ = 'movie'

    id = db.Column(db.Integer, primary_key=True)
    imdb_id = db.Column(db.String(), unique=True)
    imdb_url = db.Column(db.String(), unique=True)
    title = db.Column(db.String(250), nullable=False)
    description = db.Column(db.String())
    avatar = db.Column(db.String(250), nullable=False, default='default_avatar.jpg')
    banner = db.Column(db.String(250), nullable=True, default='default_banner.jpg')
    trailer = db.Column(db.String(250), nullable=True)
    photos = db.relationship('Photo', backref='photos', lazy=True, uselist=True)
    countries = db.relationship(Country, backref='countries', lazy=True, secondary=country_identifier)
    genres = db.relationship(Genre, backref=db.backref('genres'), lazy=True, secondary=genre_identifier)
    directors = db.relationship(People, backref='directors', lazy=True, secondary=director_identifier)
    producers = db.relationship(People, backref='producers', lazy=True, secondary=producer_identifier)
    writers = db.relationship(People, backref='writers', lazy=True, secondary=writer_identifier)
    artists = db.relationship(People, backref='artists', lazy=True, secondary=artist_identifier)
    year = db.Column(db.String())
    age = db.Column(db.String())
    budget = db.Column(db.String())
    rating = db.Column(db.String())
    runtime = db.Column(db.String())
    original_lang = db.Column(db.String(50))
    production_companies = db.Column(db.String())

    def to_dict(self):
        return self.__dict__

class Photo(db.Model):
    __tablename__ = 'photo'

    id = db.Column(db.Integer, primary_key=True)
    image = db.Column(db.String(120), nullable=False)
    movie_id = db.Column(db.Integer, db.ForeignKey('movie.id'), nullable=False)
