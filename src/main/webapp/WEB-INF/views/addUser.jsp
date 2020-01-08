<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <title>Home</title>

</head>
<body>

<div class="add">
    <br>
    <br>
    <br>

    <br>
    <center>
        <form:form method="POST" action="${pageContext.request.contextPath}/admin/addUser"
                   enctype="multipart/form-data">
            <table>
                <tr>
                    <td><label path="Login">Login</label></td>
                    <td><input type="text" name="login"/></td>
                </tr>
                <tr>
                    <td><label path="Password">Password</label></td>
                    <td><input type="text" name="password"/></td>
                </tr>
                <tr>
                    <td><label path="Role">Выберите роль</label></td>
                    <td>
                        <select path="role" name="role" required>
                            <option>ROLE_ADMIN</option>
                            <option selected>ROLE_USER</option>
                        </select>
                    </td>


                    <td><input class="btn btn-primary" type="submit" value="Submit"></td>
                </tr>

            </table>
        </form:form>
    </center>
</div>
</body>
</html>



