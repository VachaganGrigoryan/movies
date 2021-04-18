from app import db


class People(db.Model):
    __tablename__ = 'people'

    id = db.Column(db.Integer, primary_key=True)
    full_name = db.Column(db.String(120), nullable=False)
    date_of_birth = db.Column(db.DateTime)
    place_of_birth = db.Column(db.String())
    genres = db.Column(db)
    total_movies = db.Column(db.String(10))


    def __init__(self, full_name, date_of_birth, notify=False):
        self.full_name = full_name
        self.date_of_birth = date_of_birth
        self.notify = notify

    def __repr__(self):
        return '<Birthday %r %r %r>' % (self.name, self.bday, self.notify)
