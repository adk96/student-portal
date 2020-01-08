<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <link href="../css/style.css" rel="stylesheet" type="text/css">
        <style><%@include file="/css/style.css"%></style>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
        
        
       
    </head>
    <body>
        <br> 
        <center>
            <h1 style="color: black">${headerMessage}</h1>

                
                <form:form method="POST" action="${pageContext.request.contextPath}/admin/editStudent" enctype="multipart/form-data">
                    <table>
                        <input type="hidden" value="${student.id}" name="id"/>
                        <tr>
                            
                            <td><label path="Name">Name</label></td>
                            <td bgcolor="#000000"><input type="text" name="name" value="${student.name}"/></td>
                        </tr>
                        <tr>
                            <td><label path="Surname">Surname</label></td>
                            <td bgcolor="#000000"><input name="surname" value="${student.surname}"/></td>
                        </tr>
                        <tr>
                            <td><label path="Avatar">Avatar:</label></td>
                            <td>
                                <img src="${pageContext.request.contextPath}/avatar?avatar=${student.avatar}"
                                     style="max-height: 200px; max-width: 200px;"/>
                            </td>
                            <td>
                                <input type="file" name="avatar"/>
                            </td>
                        </tr>
                        <tr>
                            <td><input class="btn btn-primary" type="submit" value="Save"> </td>
                        </tr>
                    </table>
                </form:form>
        </center>
    </body>
</html>