<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<body>

<div class="it">

    <h3 style="color:white">Список всех пользователей</h3>
    ${message}

    <br>
    <br>
    <table class="table">
        <thead>
        <tr>
            <th bgcolor="#000000"><font color="f5f5f5" scope="col"># </font></th>
            <th bgcolor="#000000"><font color="f5f5f5" scope="col">Login</font></th>
            <th bgcolor="#000000"><font color="f5f5f5" scope="col">Role</font></th>
            <th bgcolor="#000000"><font color="f5f5f5" scope="col">Edit</font></th>
            <th bgcolor="#000000"><font color="f5f5f5" scope="col">Delete</font></th>
            
            
        </tr>
        </thead>
        <tbody>
        <c:forEach var="user" items="${users}" varStatus="loop">
            <tr>
                <th bgcolor="#000000"><font color="f5f5f5" scope="row">${loop.index+1}</font></th>
                <td bgcolor="#000000"><font color="f5f5f5">${user.login}</font></td>
                <td bgcolor="#000000"><font color="f5f5f5">${user.role}</font></td>
                <td bgcolor="#000000">
                    <a href="${pageContext.request.contextPath}/admin/editUser/${user.id}">
                        <button type="button" class="btn btn-primary">Edit</button>
                    </a>
                </td>
                
                <td bgcolor="#000000">
                    <a href="${pageContext.request.contextPath}/admin/deleteUser/${user.id}">
                        <button type="button" class="btn btn-primary">Delete</button>
                    </a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

</div>


</body>
</html>
