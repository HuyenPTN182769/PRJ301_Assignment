<%-- 
    Document   : ViewSchedule
    Created on : Oct 30, 2022, 4:50:04 PM
    Author     : Mạc Huyền
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="helper" class="helper.DateTimeHelper"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        Lecturer: <input type="text" value="${requestScope.lecturer.lecturerName}"/>
        <form action="ViewSchedule" method="GET">
            <input type="hidden" name="lecturerID" value="${param.lecturerID}"/>
            From: <input type="date" name="from" value="${requestScope.from}"/>
            To: <input type="date" name="to" value="${requestScope.to}"/>
            <input type="submit" value="View"/> 
        </form>
        <table border="1px">
            <tr>
                <td> </td>
                <c:forEach items="${requestScope.date}" var="d">
                    <td>${d}<br/>${helper.getDayofWeek(d)}</td>
                    </c:forEach>
            </tr>
            <c:forEach items="${requestScope.timeSlot}" var="timeSlot">
                <tr>
                    <td>${slot.description}</td>
                    <c:forEach items="${requestScope.date}" var="d">
                        <td>
                            <c:forEach items="${requestScope.session}" var="ss">
                                <c:if test="${helper.compare(ss.date,d) eq 0 and (ss.timeslot.slot eq slot.slot)}">
                                    <a href="att?id=${ss.slot}">${ss.group.groupName}-${ss.group.subject.subjectName}</a>
                                    <br/>
                                    ${ss.room.roomName}
                                    <c:if test="${ss.attend}">
                                        <img src="../img/male-icon.png" alt=""/>
                                    </c:if>
                                    <c:if test="${!ss.attend}">
                                        <img src="../img/female-icon.png" alt=""/>
                                    </c:if>
                                </c:if>
                            </c:forEach>
                        </td>
                    </c:forEach>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
