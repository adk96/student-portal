<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <link href="../css/style.css" rel="stylesheet" type="text/css">
    
    <style>
        <%@include file="/css/style.css" %>
    </style>
<body onload='document.loginForm.username.focus();'>
    
    <div class="login-form">
    
 <c:if test="${not empty errorMessage}"><div class="text" style="color:red; font-weight: bold; margin: 5px 0px;">${errorMessage}</div></c:if>
    <form  name='login' action="login" method='POST'>
        <table>
            <tr>
                <td bgcolor="#000000"><font color="#green" >Username:</font></td>
                <td><input type='text' name='username' value=''></td>
            </tr>
            <tr>
                <td bgcolor="#000000"><font color="#green">Password:</font></td>
                <td><input type='password' name='password' /></td>
            </tr>
            <tr>
                <td class ="button1" colspan='2'><input name="submit" type="submit" value="submit" /></td>
            </tr>
        </table>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
    </form>
    </div>
</body>
</html>