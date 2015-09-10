require 'rubygems'
require 'sinatra'
require 'pony'

get '/' do
	'<html>
	<body background = "http://7-themes.com/data_images/out/32/6878683-brown-background.jpg">
	<center>
	<img src="https://farm6.staticflickr.com/5799/21293690061_e027e9dffa_b.jpg" width="300" height="300">
	<font color = "#CCE1E8">
	<font face = "Georgia">
	</center>
	<div style="display:inline-block; width: 375; height: 500; text-align:center; font-size: 100%; padding-bottom:0.5em;">
	<img src="https://farm6.staticflickr.com/5673/20852597508_564359f34e_k.jpg" width=450px height=350px;>
	<h>This bench, perfect for sitting and reading in the shade, was constructed using White Birch, Grey Birch and White Oak.</h>
	</div>
	<div style="display:inline-block; width: 375; height: 500; text-align:center; font-size: 100%; padding-bottom:0.5em;">
	<img src="https://farm1.staticflickr.com/778/21014308806_0f38ac452c_k.jpg" width=450px; height=350px;>
	<h>Test</h>
	</div>
	<div style="display:inline-block; width: 375; height: 500; text-align:center; font-size: 100%; padding-bottom:0.5em;">
	<img src="https://farm6.staticflickr.com/5661/21048142661_d27d8351e7_k.jpg" width=450px; height=350px;>
	<h>Test</h>
	</div>
	<center>
	<a href = "/form" style="background-color: #F55D83">Contact Us</a>
	<br><br>
	<a href = "https://twitter.com/CrudePrimitive"><img src="https://g.twimg.com/Twitter_logo_blue.png" width=40px height=40px></h>
	<a href = "https://www.facebook.com/CrudeandPrimitive"><img src="http://screenshots.en.sftcdn.net/en/scrn/87000/87052/facebook-23-535x535.png" width=45px height=45px></h>
	</center>'
	end


	get '/form' do
  		erb :form
	end

	post '/form' do
		Pony.mail :to => 'crudeandprimitive@gmail.com',
			  :from => "#{params[:email_address]}",
			  :subject => 'Crude & Primitive Inquiry',
			  :body => "#{params[:message]}"
	"Thank you for your inquiry, #{params[:first_name]}!<br><br>

	You said: <br><br> '#{params[:message]}'<br><br>

	Your message has been received and we will be back in touch shortly.<br><br>

	-The C&P Team <br>

	<center>
	<a href = '/'> Return to Homepage </a>
	</center>"

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


