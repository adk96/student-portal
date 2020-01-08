<%@page contentType="text/html" pageEncoding="UTF-8" isELIgnored="false"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"

    "http://www.w3.org/TR/html4/loose.dtd">



<html>

    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

        <link href="style.css" rel="stylesheet">

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

        <link href="../css/style.css" rel="stylesheet" type="text/css">



        <style><%@include file="/css/style.css"%></style>

        <style>

            body {

                background: url(/WEB-INF/images/start.jpg) no-repeat;

                -moz-background-size: 100%; 

                -webkit-background-size: 100%; 

               -o-background-size: 100%; 

                background-size: 100%; 

            }

        </style>



        <title>Ошибка</title>





    </head>

    <body>

        <div class="bg">

            <div class ="pokaz">

                Страница не найдена

                <h1>${errorMsg}</h1>

            </div>

        </div>

    </body>

</html>