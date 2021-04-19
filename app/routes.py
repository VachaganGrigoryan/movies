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
