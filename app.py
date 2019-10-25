from flask import Flask, render_template, request,session,redirect
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime
import json
import os
from werkzeug.utils import secure_filename
from flask_mail import Mail


with open('config.json', 'r') as c:
    params = json.load(c)["params"]
local_server = True
app = Flask(__name__)
app.secret_key = 'secret-key'
app.config['UPLOAD_FOLDER'] = params['upload_location']
app.debug = True



app.config.update(dict(
    DEBUG=True,
    MAIL_SERVER='smtp.gmail.com',
    MAIL_PORT=587,
    MAIL_USE_TLS=True,
    MAIL_USE_SSL=False,
    MAIL_USERNAME=params["mail-username"],
    MAIL_PASSWORD=params["mail-password"],
))

mail = Mail(app)

if (local_server):
    app.config['SQLALCHEMY_DATABASE_URI'] = params['local_uri']
else:
    app.config['SQLALCHEMY_DATABASE_URI'] = params['prod_uri']

db = SQLAlchemy(app)


class Contact(db.Model):
    '''
    sno, name ,phone_number, msg, date, email
    '''
    sno = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80), nullable=False)
    phone_number = db.Column(db.String(12), nullable=False)
    msg = db.Column(db.String(120), nullable=False)
    date = db.Column(db.String(12), nullable=True)
    email = db.Column(db.String(20), nullable=False)

class Post(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(80), nullable=False)
    slug = db.Column(db.String(50), nullable=False)
    content = db.Column(db.String(120), nullable=False)
    date = db.Column(db.String(12), nullable=True)
    img_file = db.Column(db.String(50), nullable=True)



    """ ---*** Routing starts here. ***--- """

@app.route("/")
def home():
    posts = Post.query.filter_by().all()
    return render_template('index.html', params = params, posts=posts)


@app.route("/about")
def about():
    return render_template('about.html', params = params)


@app.route("/contact", methods = ['GET', 'POST'])
def contact():
    if(request.method=='POST'):
        '''Add entry to the database'''
        name = request.form.get('name')
        email = request.form.get('email')
        phone = request.form.get('phone')
        message = request.form.get('message')
        entry = Contact(name=name, phone_number=phone, msg=message, date=datetime.now(), email=email )
        db.session.add(entry)
        db.session.commit()
        mail.send_message("New message from" + name,
                          sender =('email'),
                          recipients=[params["mail-username"]],
                          body=message + '\n' + phone)
    return render_template('contact.html', params=params)


@app.route("/post/<string:post_slug>", methods=['GET'])
def post_rout(post_slug):
    post = Post.query.filter_by(slug=post_slug).first()
    return render_template('post.html', params=params, post=post)


@app.route("/dashboard", methods=["GET", "POST"])
def dashboard():
    if ('user' in session and session['user']==params['admin_user']):
        posts = Post.query.all()
        return render_template('dashboard.html', params = params, posts=posts)

        # Redirect to admin panel dashboard():
    if request.method == "POST":
        username = request.form.get('username')
        password = request.form.get('password')
        if (username == params['admin_user'] and password ==params['admin_password']):
            # set the session variable.
            session['user'] = username
            posts = Post.query.all()
            return render_template('dashboard.html', params=params, posts=posts)


    return render_template('login.html', params=params)


@app.route("/edit/<string:sno>", methods=['GET','POST'])
def edit(sno):
    if ('user' in session and session['user']==params['admin_user']):
        if request.method == "POST":
            box_title = request.form.get('title')
            slug = request.form.get('slug')
            content = request.form.get('content')
            date = datetime.now()
            img_file = request.form.get('img_file')

            if sno == "0":
                post = Post(title=box_title, slug=slug, content=content, date=date, img_file=img_file)
                db.session.add(post)
                db.session.commit()
                return redirect('/edit/' + sno)
            else:
                post=Post.query.filter_by(sno=sno).first()
                post.title = box_title
                post.slug = slug
                post.content = content
                post.img_file = img_file
                post.date = date
                db.session.commit()
                return redirect('/edit/' + sno)

        post = Post.query.filter_by(sno=sno).first()
        return render_template('edit.html',params= params,post = post,sno=sno)

@app.route("/logout")
def logout():
    session.pop('user')
    return redirect('/dashboard')

@app.route("/delete/<string:sno>", methods=["GET", "POST"])
def delete(sno):
    if ('user' in session and session['user'] == params['admin_user']):
        post = Post.query.filter_by(sno=sno).first()
        db.session.delete(post)
        db.session.commit()
    return redirect('/dashboard')

@app.route("/uploader", methods=["GET", "POST"])
def uploader():
    if request.method == "POST":
        f = request.files['file1']
        f.save(os.path.join(app.config['UPLOAD_FOLDER'], secure_filename(f.filename)))
        return 'UPLOAD SUCCESSFULLY'


app.run(debug=True)


