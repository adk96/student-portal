<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<body>
<center>
    <h1>User Edit form</h1>

    <form:form method="POST" action="${pageContext.request.contextPath}/admin/editUser">
        <table>
            <input type="hidden" value="${user.id}" name="id"/>
            <tr>

                <td><label path="Login">Login</label></td>
                <td bgcolor="#000000"><input type="text" name="login" value="${user.login}"/></td>
            </tr>
            <tr>
                <td><label path="Password">Password</label></td>
                <td bgcolor="#000000"><input name="password" type = "password" value="${user.password}"/></td>
            </tr>
            <tr>
                <td><label path="Login">Role</label></td>
                <td>
                <select name="role">
                    <option value='ROLE_ADMIN' <c:if test="${user.role == 'ROLE_ADMIN'}">selected</c:if> >ROLE_ADMIN</option>
		<option value='ROLE_USER'  <c:if test="${user.role == 'ROLE_USER'}" >selected</c:if> >ROLE_USER</option>
                    </td>
   </select>
                
                
            </tr>
            
            <tr>
                <td><input class="btn btn-primary" type="submit" value="Save"/></td>
            </tr>
        </table>
    </form:form>
</center>

</body>
</html>
