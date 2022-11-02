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
        <h1>
            <span>FPT University Academic Portal</span>
        </h1>
        <span>
            <a href="Home.jsp" style="text-decoration: none">Home</a> &nbsp;|&nbsp;
            <b>View Schedule</b>
        </span> <br/>
        <div style="text-align: center">
            Lecturer: <input type="text" style="" value="${requestScope.lecturer.lecturerName}"/>
            <form action="ViewSchedule" method="GET">
                <input type="hidden" name="lecturerID" value="${param.lecturerID}"/>
                From: <input type="date" name="from" value="${requestScope.from}"/>
                To: <input type="date" name="to" value="${requestScope.to}"/>
                <input type="submit" value="View"/> 
            </form>
        </div> 
        <br/>

        <div style="text-align: center">
            <table border="1px">
                <tr style="background-color: #7b99da">
                    <td rowspan="2"> </td>
                    <c:forEach items="${requestScope.date}" var="d">
                        <td align="center">${helper.getDayNameofWeek(d)}</td>
                    </c:forEach>
                </tr>
                <tr style="background-color: #7b99da">
                    <c:forEach items="${requestScope.date}" var="d">
                        <td align="center">${d}</td>
                    </c:forEach>
                </tr>
                <c:forEach items="${requestScope.timeSlot}" var="s">
                    <tr>
                        <td>Slot&nbsp;${s.slot}<br/>${s.description}</td>
                            <c:forEach items="${requestScope.date}" var="d">
                            <td>
                                <c:forEach items="${requestScope.session}" var="ss">
                                    <c:if test="${helper.compare(ss.date,d) eq 0 and (ss.timeslot.slot eq s.slot)}">
                                        <a href="takeAttendance?id=${ss.slot}">${ss.group.groupName}-${ss.group.subject.subjectName}</a>
                                        <br/>
                                        at ${ss.room.roomName}<br/>
                                        <c:if test="${ss.isAttend()}">
                                            (<font color="green">attended</font>)
                                        </c:if>
                                        <c:if test="${!ss.isAttend() and ss.isAttend() ne null}">
                                            (<font color="red">absent</font>)
                                        </c:if>
                                        <c:if test="${!ss.isAttend() eq null}">
                                            (<font color="red">Not yet</font>)
                                        </c:if>
                                    </c:if>
                                </c:forEach>
                            </td>
                        </c:forEach>
                    </tr>
                </c:forEach>
            </table>
        </div>
        <p>
                <b>More note / Chú thích thêm</b>:
            </p>
            <div id="ctl00_mainContent_divfoot">
                <ul>
                    <li>
                        (<font color="green">attended</font>): ${requestScope.lecturer.lecturerID} had attended this activity / ${requestScope.lecturer.lecturerName} đã tham gia hoạt động này
                    </li>
                    <li>
                        (<font color="red">absent</font>): ${requestScope.lecturer.lecturerID} had NOT attended this activity / ${requestScope.lecturer.lecturerName} đã vắng mặt buổi này</li>
                    <li>(-): no data was given / chưa có dữ liệu</li> 
                </ul>
            </div>
            <p> </p>
    </body>
</html>
