from flask_wtf 	 		import FlaskForm
from wtforms     		import *
from wtforms.validators import InputRequired

class LoginForm(FlaskForm):
	username = TextField('username',validators=[InputRequired()])
	password = PasswordField('password',validators=[InputRequired()])