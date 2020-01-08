<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
        <link href="styleadmin.css" rel="stylesheet" type="text/css">
        <style>
   
            </style>
        
    </head>
    <body>
            <br>
            <br>
            <br>
            <br>
            <div class="it">
               
                ${message}
                <br>
                <br>
                <table class="table">
                    <thead>
                        <tr>
                            <th bgcolor="#000000"><font color="#green" scope="col"># </font></th>
                            <th bgcolor="#000000"><font color="#green" scope="col">Name </font></th>

                            <th bgcolor="#000000"><font color="#green" scope="col">Surname </font></th>
                            <th bgcolor="#000000"><font color="#green" scope="col">Avatar </font></th>
                            
                        </tr>
                    </thead>
                    
                    <tbody>
                        <c:forEach var="student" items="${studentList}">
                            <tr>
                                <th bgcolor="#000000"><font color="#fff"  scope="row">1 </font></th>
                                <td bgcolor="#000000"><font color="#fff">${student.name}</font></td>
                                <td bgcolor="#000000"><font color="#fff">${student.surname}</font></td>

                                <td bgcolor="#000000">
                                    <c:if test="${empty student.avatar}">
                                        <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/768px-No_image_available.svg.png"
                                             style="max-height: 200px; max-width: 200px;"/>
                                    </c:if>
                                    <c:if test="${not empty student.avatar}">
                                        <img src="${pageContext.request.contextPath}/avatar?avatar=${student.avatar}"
                                             style="max-height: 200px; max-width: 200px;"/>
                                    </c:if>
                                </td>
                              
                                
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>

            </div>
        
    </body>
</html>