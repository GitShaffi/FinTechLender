<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="images/logo.png">

    <title><spring:message code="product.name"/> - <spring:message code="product.subtitle"/></title>

    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
          integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">

    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css"
          integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">

    <!-- Latest compiled and minified JavaScript -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"
            integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS"
            crossorigin="anonymous"></script>

    <!-- Custom CSS -->
    <link href="css/grayscale.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic" rel="stylesheet"
          type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">

    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body id="page-top" data-spy="scroll" data-target=".navbar-fixed-top">

<!-- Navigation -->
<nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-main-collapse">
                <i class="fa fa-bars"></i>
            </button>
            <a class="navbar-brand page-scroll" href="#page-top">
                <div class="col-xs-12 col-md-6">
                    <div class="col-md-2">
                        <img style='float:left; width:50px ;height:50px; margin-right:10px; margin-top: 5px;'
                             src="img/logo.png">
                    </div>
                    <div class="col-md-6 alignme product-title">
                        <spring:message code="product.name"/>
                    </div>
                </div>
            </a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse navbar-right navbar-main-collapse">
            <ul class="nav navbar-nav">
                <!-- Hidden li included to remove active class from about link when scrolled up past about section -->
                <li class="hidden">
                    <a href="#page-top"></a>
                </li>
                <li>
                    <a class="page-scroll" href="#about">About</a>
                </li>
                <li>
                    <a class="page-scroll" href="#login">
                        <fb:login-button scope="public_profile,email,user_friends" onlogin="checkLoginState();"
                                         data-max-rows="1"
                                         data-size="large" data-show-faces="false" data-auto-logout-link="false">
                        </fb:login-button>
                    </a>

                </li>
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container -->
</nav>


<script>
    // This is called with the results from from FB.getLoginStatus().
    function statusChangeCallback(response) {
        console.log(response);
        if (response.status === 'connected') {
            // Logged into your app and Facebook.
            console.log("connected");
            testAPI(response.authResponse.accessToken);
        } else if (response.status === 'not_authorized') {
            // The person is logged into Facebook, but not your app.
            console.log("Not Authorized");
        } else {
            // The person is not logged into Facebook, so we're not sure if
            // they are logged into this app or not.
            console.log("Not logged in");
        }
    }

    function checkLoginState() {
        console.log("Checking login status")
        FB.getLoginStatus(function (response) {
            statusChangeCallback(response);
        });
    }

    window.fbAsyncInit = function () {
        FB.init({
            appId: '<spring:eval expression="@environment.getProperty('appId')" />',
            cookie: true,
            xfbml: true,
            version: 'v2.5'
        });
    };

    (function (d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) {
            return;
        }
        js = d.createElement(s);
        js.id = id;
        js.src = "//connect.facebook.net/en_US/sdk.js";
        fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));

    function loginFb() {
        FB.login(function (response) {
            checkLoginState();
        }, {scope: 'user_friends'});
    }

    function testAPI(token) {
        FB.api('/me', function (response) {

            $.ajax({
                method: "POST",
                url: "/acceptLoggedinUser",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: JSON.stringify({id: response.id, name: response.name, email: response.email, accessToken: token}),
                success: function (response) {
                    window.location.replace(response.redirect);
                },
                error: function (data) {
                    console.log(data);
                }
            });
        });
    }
</script>


<!-- Intro Header -->
<header class="intro">
    <div class="intro-body">
        <div class="container">
            <div class="row">
                <div class="col-md-8 col-md-offset-2">
                    <h1 class="brand-heading"><spring:message code="product.name"/></h1>
                    <p class="intro-text">A Protal for sharing funds between friends.<br>Trusted Crowdsourcing indeed.
                    </p>
                    <a href="#about" class="btn btn-circle page-scroll">
                        <i class="fa fa-angle-double-down animated"></i>
                    </a>
                </div>
            </div>
        </div>
    </div>
</header>

<!-- About Section -->
<section id="about" class="container content-section text-center">
    <div class="row">
        <div class="col-lg-8 col-lg-offset-2">
            <h2>About <spring:message code="product.name"/></h2>
            <p>A Protal for sharing funds between friends.</p>
            <p>Trusted Crowdsourcing indeed.</p>
        </div>
    </div>
</section>


<!-- Footer -->
<footer>
    <div class="container text-center">
        <p>Copyright &copy; <spring:message code="product.name"/> 2016</p>
    </div>
</footer>

<!-- Custom Theme JavaScript -->
<script src="js/grayscale.js"></script>

</body>

</html>
