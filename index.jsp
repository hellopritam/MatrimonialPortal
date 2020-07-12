<html>
<head>
<style>
a{

				text-decoration: none;
                background-color:orange;
                font-size:30px;
            }


				#big_box{
				height:310px;
				width:300px;
				padding:2px;
				border:4px solid orange;
				border-radius:15px;
				background-color:#f2f2f2;
        z-index: 10;
        transform: translate(352px,-680px);
        box-shadow: 10px 10px 15px #330026;
				}
				#font{
				font-weight:bold;
				font-family:arial;
				font-size:280%;
				color: #333333;
        transform: translate(350px,-660px);
        text-shadow: 2px 2px 15px white;
        z-index: 20;

				}
				#button{
					height:46px;
					width:210px;
					border-radius: 17px;
					border-width: 0px;
					background-color:#cc6600;
					color: white;
					font-weight: bold;
					font-size:120%;
					margin-top: 65px;

					}
				#button:hover{
					height:46px;
				  width:210px;
				  border-radius: 17px;
				  border-width: 0px;
				  background-color:#ff8000;
				  color: white;
				  font-weight: bold;
				  font-size:120%;
				  margin-top: 65px;
					text-shadow: 2px 2px 4px #4d1f00;
					box-shadow: 2px 2px 9px #662900;
				}
        body {
              margin: 0px;
              margin-top: -27px;
              background-color: #cc6600;
        }
.background{
  padding:40px 0 10px 0;
  background-image: url("images/back2.jpg");
  background-size: 100%;
  height:100%;
  filter:opacity(0.9);
  z-index: 10;
  background-attachment: fixed;

}
#heading{
  margin-top: -350px;
  letter-spacing: 1.6px;
  font-size: 350%;
  font-family: Arial;
  color: #f2f2f2;
  text-shadow: 2px 2px 15px #4d0039;
}
#logo1
{
  background-image: url("images/register.png");
  height:200px;
  width:200px;
  border: 3px solid #330026;
  background-color: white;
  background-size: 50%;
  background-repeat: no-repeat;
  background-position: center;
  border-radius: 50%;
  box-shadow: 10px 10px 15px #331a00;
}
#logo2
{
  background-image: url("images/search.png");
  height:200px;
  width:200px;
  border: 3px solid #330026;
  background-color: white;
  background-size: 50%;
  background-repeat: no-repeat;
  background-position: center;
  border-radius: 50%;
  box-shadow: 10px 10px 15px #331a00;
}

#logo3
{
  background-image: url("images/contact.png");
  height:200px;
  width:200px;
  border: 3px solid #330026;
  background-color: white;
  background-size: 50%;
  background-repeat: no-repeat;
  background-position: center;
  border-radius: 50%;
  box-shadow: 10px 10px 15px #331a00;
}
#logo4
{
  background-image: url("images/meet.png");
  height:200px;
  width:200px;
  border: 3px solid #330026;
  background-color: white;
  background-size: 50%;
  background-repeat: no-repeat;
  background-position: center;
  border-radius: 50%;
  box-shadow: 10px 10px 15px #331a00;
}
#text2{
  font-size: 250%;
  font-family: Arial;
  font-weight: bold;
  color: white;
  margin: 10px;
  text-shadow: 2px 2px 15px #4d0039;
}
#subtext{
  font-size: 140%;
  font-weight: bold;
  font-family: Arial;
  color: #fff2e6;
  text-shadow: 2px 2px 15px #331a00;
}
</style>
</head>
<body>
<div class="background"></div>

<center>
  <br><br>
<h1 id="font">Shaadi.com</h1>
<div id="big_box">
<form action="login.html">
<input type="submit" id="button" value="Login">
</form>
<form action="register.html">
<input type="submit" id="button" value="Register">
</form>
</div>
<h2 id="heading">Find your Life Partner in 4 easy steps!</h2>
<div id="logo1"></div>
<h1 id="text2">Register</h1>
<p id="subtext">Create your free profile</p>
<br>

<div id="logo2"></div>
<h1 id="text2">Search</h1>
<p id="subtext">View profile as per your criteria</p>
<br>
<div id="logo3"></div>
<h1 id="text2">Contact</h1>
<p id="subtext">Get in touch with your interested members</p>
<br>
<div id="logo4"></div>
<h1 id="text2">Meet</h1>
<p id="subtext">Find the One for you</p>
  </div>
</center>
</body></html>
<%
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
response.setHeader("Pragma","no-cache");
response.setHeader("Expire","0");
%>
