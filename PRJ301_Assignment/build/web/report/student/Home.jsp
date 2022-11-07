<%-- 
    Document   : Home
    Created on : Nov 7, 2022, 7:54:02 PM
    Author     : Mạc Huyền
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%--
        <c:if test="${sessionScope.account ne null}">
            <div class="col-md-8">
                <h1>
                    <span>FPT University Academic Portal</span>
                </h1>
            </div>
            <div style="float: right; margin-right: 16px;">
                <a href="?view=user">
                    <span>${sessionScope.account.displayName}</span>
                </a> 
                | 
                <a href="logout">logout</a> |
                <span>CAMPUS: FPTU-Hòa Lạc</span>
            </div>
            <ol>
                <li>
                    <span><b>&nbsp;</b></span>
                </li>
            </ol>
        </c:if>
        <c:if test="${sessionScope.account eq null}">
            You are not logged in yet!
        </c:if>
        --%>
        
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
