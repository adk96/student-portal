<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
        <title>Home</title>

    </head> 
    
    <body>
        <br>
        <br>
        <br>
        
        <div class="add">
            <br>
            <br>
            <br>

            <br>
            <center>
                <h1>${headerMessage}</h1>

                <form:form method="POST" action="${pageContext.request.contextPath}/user/addStudentUser" enctype="multipart/form-data">
                    <table>

                        <tr>
                            <td><label path="Name">Name</label></td>
                            <td><input type="text" name="name"/></td>
                        </tr>
         
                        <tr>
                            <td><label path="Surname">Surname</label></td>
                            <td><input type="text" name="surname"/></td>
                        </tr>
                        <tr>
                            <td><label path="Avatar">Avatar:</label></td>
                            <td>
                                <input type="file" name="avatar"/>
                            </td>

                        </tr>
                        <tr>
                            <td><input class="btn btn-primary" type="submit" value="Добавить"></td>
                        </tr>
                    </table>
                </form:form>
            </center>
        </div>
    </body>
</html>


