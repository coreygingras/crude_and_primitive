require 'rubygems'
require 'sinatra'
require 'pony'

get '/' do
	'<html>
	<body background = "http://7-themes.com/data_images/out/32/6878683-brown-background.jpg">
	<font color = "#CCE1E8">
	<font face = "Georgia">
	<center>
	<h1> Crude & Primitive </h1>
	</center>
	<img src="https://farm6.staticflickr.com/5673/20852597508_564359f34e_k.jpg" width="400" height="300" alt="DSCN0652">
	<img src="https://farm1.staticflickr.com/778/21014308806_0f38ac452c_k.jpg" width="400" height="300" alt="DSCN0663">
	<img src="https://farm6.staticflickr.com/5661/21048142661_d27d8351e7_k.jpg" width="400" height="300" alt="DSCN0659">
	<br>
	<h>This bench, perfect for sitting and reading in the shade, <br>was constructed using White Birch, Grey Birch and <br>White Oak.</h>
	<br>
	<br>
	<center>
	<a href = "http://localhost:9393/form"> Contact Us </a>
	</center>'
	end

	get '/mail' do
	Pony.mail :to => 'gingras.corey@gmail.com',
			  :from => 'messages@cp.com',
			  :subject => 'Crude & Primitive Inquiry',
			  :body => ''
	"Thank you for your inquiry!

	Your message has been received and we will be back in touch shortly.

	-The C&P Team"
	end

	get '/form' do
  		erb :form
	end

	post '/form' do
	"Thank you for your inquiry, #{params[:first_name]}!<br><br>

	You said: <br><br> '#{params[:message]}'<br><br>

	Your message has been received and we will be back in touch shortly.<br><br>

	-The C&P Team"
	end

	get '/form/submitted' do
		"Thank you for your inquiry!

		Your message has been received and we will be back in touch shortly.

		-The C&P Team"
	end


	not_found do
    status 404
    'Page Not Found'
	end


