<%@page contentType="text/html" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="style.css" rel="stylesheet">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
        <link href="/css/style.css" rel="stylesheet" type="text/css">
        <style><%@include file="/css/style.css"%></style>
        <title><sitemesh:write property='title'/></title>
    <sitemesh:write property='head'/>
</head>

<body>
<div id="container">
    <div id="header">
        
        
    </div>
    <div id="nav">
        <ul>
            <li><a href="${pageContext.request.contextPath}/"><span>Home</span></a></li>
            
            <li class="dropdown"><a href="${pageContext.request.contextPath}/allStudents"><span>Students</span></a>
               
            </li>
            <li><a><span>About</span></a></li>
            <sec:authorize access="!isAuthenticated()"> 
            <li class="dropdown"><a href="${pageContext.request.contextPath}/login"><span>Log in</span></a>
               </li>
            </sec:authorize>
            <sec:authorize access="isAuthenticated()">
                <li><a href="${pageContext.request.contextPath}/logout"><span>Log out</span></a></li>
            </sec:authorize>
           
    </div>
</div>

<sitemesh:write property='body'/>
<jsp:include page="/WEB-INF/template/menutemplate.jsp"/>  



</body>
</html>