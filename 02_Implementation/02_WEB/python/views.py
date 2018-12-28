from run 	     import app
from forms 		 import LoginForm
from flask 		 import Flask,redirect,url_for,request,session
from flask		 import render_template 
from flask       import jsonify

import requests
import json

# index.html
@app.route('/')
def index():
	return render_template('index.html')

# Login.html
@app.route('/login',methods=['GET','POST'])
def login():
	form = LoginForm()
	
	if form.validate_on_submit():
	
		url = 'http://127.0.0.1:8010/ada-business-logic/api/login'				 
		headers = {'Content-type': 'application/json'}
		json_login = json.dumps({"nombreUsuario":form.username.data,
								 "claveUsuario" :form.password.data})

		# POST with form-encoded data
		response = requests.post(url, data=json_login, headers=headers)
		
		login_response = json.loads(response.text)
		
		if login_response['codigoRespuestaApi'] == 'OK' :
			session['idUsuario'] = login_response['idUsuario']
			return redirect(url_for('homepage'))
		else:
			return '<script>alert("'+login_response['mensajeRespuestaApi']+'");window.location.href="login";</script>'
						
	return render_template('login.html',form=form)

@app.route('/logout')
def logout():
   # remove the username from the session if it is there
   session.pop('idUsuario', None)
   return redirect(url_for('index'))

@app.route('/homepage')
def homepage():
	return render_template('homepage.html')