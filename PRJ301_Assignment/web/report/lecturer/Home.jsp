<%-- 
    Document   : Home
    Created on : Oct 30, 2022, 11:30:34 PM
    Author     : Mạc Huyền
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <c:if test="${sessionScope.account ne null}">
            Hello ${sessionScope.account.displayName},  click 
            <a href="logout">here</a> 
            to logout.
        </c:if>
        <c:if test="${sessionScope.account eq null}">
            You are not logged in yet!
        </c:if>
    </body>
</html>
