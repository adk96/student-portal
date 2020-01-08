<%-- 
    Document   : allStudentsAdminDecorator
    Created on : 29.07.2019, 16:00:57
    Author     : Adil
--%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  

<style>
html, body {
    background: #fff;
    font: 100% helvetica, arial, sans-serif;
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

#container {            
    margin: 40px auto;
    width: 800px;    
    -webkit-border-radius: 3px;
    -moz-border-radius: 3px;
    border-radius: 3px;
}

#header {
    border-bottom: 1px solid #eee;            
    margin: 0 0 20px;
    overflow: hidden;
    padding: 0 0 10px;
}



a {
    color: #111;
    font-weight: bold;
    text-decoration: none;
    -moz-transition: all 300ms ease-out;
    -webkit-transition: all 300ms ease-out; 
    -ms-transition: all 300ms ease-out; 
    transition: all 300ms ease-out;
}

a:hover {
    color: #555;    
}

/*============================*/
/* Main Navigation
/*============================*/
#nav {            
    height: 50px;
    line-height: 50px;            
    width: 100%;
    text-align: center;
}

#nav ul {
    list-style: none;
    margin: 0;
    padding: 0;
    display: inline-block;
}

#nav li {    
    background: #333;
    background-image: -o-linear-gradient(bottom, #222222 0%, #555555 100%);
    background-image: -moz-linear-gradient(bottom, #222222 0%, #555555 100%);
    background-image: -webkit-linear-gradient(bottom, #222222 0%, #555555 100%);
    background-image: -ms-linear-gradient(bottom, #222222 0%, #555555 100%);    
    background-image: -webkit-gradient(linear,left bottom,left top,color-stop(0, #222222),color-stop(1, #555555));    
    background-image: linear-gradient(bottom, #222222 0%, #555555 100%);
    float: left;
    position: relative;
      
}

#nav li:first-child, #nav li:first-child a { 
    -webkit-border-radius: 3px 0 0 3px; 
    -moz-border-radius: 3px 0 0 3px; 
    border-radius: 3px 0 0 3px; 
}
#nav li:last-child, #nav li:last-child a { 
    -webkit-border-radius: 0 3px 3px 0; 
    -moz-border-radius: 0 3px 3px 0; 
    border-radius: 0 3px 3px 0; 
}

#nav a {                
    border-right: 1px solid #222;
    border-left: 1px solid #555;
    color: #ccc;
    display: block;
    font-size: 14px;
    height: 50px;
    overflow: hidden;
    text-align: center;
    text-shadow: 0 -1px 0 #000;    
    -webkit-box-shadow: inset 0 0 10px transparent;
    -moz-box-shadow: inset 0 0 10px transparent;
    padding: 0 60px;
}

#nav a:after {
    background: rgba(255,255,255,.07);
    content: "";
    height: 25px;
    left: 0;
    position: absolute;
    width: 100%;
}

#nav li:hover > a {
    background: #333;
    border-left-color: #222;
    color: #fff;
    text-shadow: 0 1px 0 #000;
    -webkit-box-shadow: inset 0 0 10px #111;
    -moz-box-shadow: inset 0 0 10px #111;
    box-shadow: inset 0 0 10px #111;
}
#nav span {
    position: relative;    
}

#nav a:active span {
    color: #ffd;
    position: relative;
    top: 1px;
}

#nav li:first-child a {
    border-left: none;    
}

#nav li:last-child a {
    border-right: none;    
}

.dropdown > a span:after {
    border-top: 5px solid transparent;
    border-bottom: 5px solid transparent;
    border-left: 5px solid #ccc;
    content: "";
    right: -13px;
    position: absolute;
    top: 3px;
}

.dropdown:hover > a span:after {
    border-left: 5px solid transparent;
    border-right: 5px solid transparent;
    border-top: 5px solid #fff;
    content: "";
    right: -15px;
    position: absolute;
    top: 6px;
}

/*============================*/
/* Sub Navigation
/*============================*/
#nav ul ul {
    opacity: 0;
    position: absolute;
    top: 50px;
    visibility: hidden;
    width: 0;
    -moz-transition: all 300ms ease-out;
    -webkit-transition: all 300ms ease-out; 
    -ms-transition: all 300ms ease-out; 
    transition: all 300ms ease-out;
    left: 0;
}

#nav ul li:hover ul {
    opacity: 1;
    visibility: visible;
    width: 100%;
}

#nav ul ul li {
    background: #f3f3f3;
    float: none;    
    line-height: 0;
    width: 100%;            
}

#nav ul ul li:nth-child(odd) {
    background: #eee;    
}

#nav ul ul li:first-child, #nav ul ul li:first-child a { 
    -webkit-border-radius: 0; 
    -moz-border-radius: 0; 
    border-radius: 0; 
}
#nav ul ul li:last-child, #nav ul ul li:last-child a { 
    -webkit-border-radius: 0 0 3px 3px; 
    -moz-border-radius: 0 0 3px 3px; 
    border-radius: 0 0 3px 3px; 
}

#nav ul ul li a {
    border-right: none;
    border-left: none;
    border-top: 1px solid #fff;
    color: #555;
    font-size: 12px;
    height: 36px;
    line-height: 36px;
    padding: 0 0 0 15px;
    text-align: left;
    text-shadow: 0 -1px 0 #eee;
}

#nav ul li ul li a:after {
    background: rgba(0,0,0,.02);
    content: "";
    height: 18px;
    left: 0;
    position: absolute;
    top: 19px;
    width: 100%;
}

#nav ul ul li a:hover {
    background: #ffd;
    color: #111;
    text-shadow: 0 1px 0 #fff;
    -webkit-box-shadow: none;
    -moz-box-shadow: none;
    box-shadow: none;
}

#nav ul ul a:active span {
    color: #111;
    position: relative;
    top: 1px;
}

.it{
  width:50%;
  margin:auto;
}


.add{
   width:600px;
  margin: 0 auto;
}

* { box-sizing: border-box; }

       </style>

</head>
<!DOCTYPE html>
<body>
  <div id="container">
    <div id="header">
       
        
    </div>
    <div id="nav">
        <ul>
            <li><a href="${pageContext.request.contextPath}/"><span>Home</span></a></li>
            
            <li class="dropdown"><a href="${pageContext.request.contextPath}/allStudents"><span>Students</span></a>
                <ul>
                    <li><a href="${pageContext.request.contextPath}/allStudents"><span>Student List</span></a></li>
                    <sec:authorize access="hasRole('ADMIN') || hasRole('USER')">
                    <li><a href="${pageContext.request.contextPath}/addStudent"><span>Add Student</span></a></li>
                    </sec:authorize>
                    <sec:authorize access="hasRole('ADMIN')"> 
                    <li><a href="${pageContext.request.contextPath}/admin/addUser"><span>Add New User</span></a></li>
                    <li><a href="${pageContext.request.contextPath}/admin/allUsers"><span>All Users</span></a></li>
                    </sec:authorize>
                </ul>
            </li>
            <li><a><span>About</span></a></li> 
            <sec:authorize access="!isAuthenticated()"> 
            <li><a href="${pageContext.request.contextPath}/logout"><span>Log Out</span></a></li>
             </sec:authorize>
        </ul>
    </div>
</div>
        
        <sitemesh:write property='body'/>
    <jsp:include page="/WEB-INF/template/admintemplate.jsp"/>  
    </body>
</html>
