<%-- 
    Document   : TakeAttendance
    Created on : Nov 3, 2022, 12:01:11 AM
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
        <h1>
            <span>FPT University Academic Portal</span>
        </h1>
        <span>
            <a href="Home.jsp" style="text-decoration: none">Home</a> &nbsp;|&nbsp;
            <b>Take Attendance</b>
        </span> <br/>
        <h1>Single activity Attendance</h1>
            <p>Attendance for <span>${requestScope.session.group.subject.subjectID}</span> with lecturer <span>${requestScope.session.group.supervisor.lecturerID}</span> at slot ${requestScope.session.timeslot.slot} on  ${requestScope.session.date}, in room ${requestScope.session.room.roomName} at FU-HL.</p>
        <div>
            <form action="takeAttandance" method="POST">
                <input type="hidden" name="sessionNo" value="${param.sessionNo}"/>
                <table border="1px">
                    <thead style="background-color: #7b99da">
                        <tr>
                            <th>NO</th>
                            <th>GROUP</th>
                            <th>CODE</th>
                            <th>NAME</th>
                            <th>STATUS</th>
                            <th>COMMENT</th>
                            <th>TAKER</th>
                            <th>RECORD TIME</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${requestScope.session.attendance}" var="attend" varStatus="loop">
                            <tr>
                                <td>${loop.index+1}</td>
                                <td>${requestScope.session.group.groupName}</td>
                                <td>${attend.student.studentID}
                                    <input type="hidden" name="studentID" value="${attend.student.studentID}"/>
                                </td>
                                <td>${attend.student.studentName}</td>
                                <td><input type="radio"
                                           <c:if test="${attend.isStatus()}">
                                               checked="checked"
                                           </c:if>
                                           name="status${attend.student.studentID}" value="Present" />
                                    <font color="Green">Present</font>
                                    <input type="radio"
                                           <c:if test="${!attend.isStatus()}">
                                               checked="checked"
                                           </c:if>
                                           name="status${attend.student.studentID}" value="Absent" />
                                    <font color="red">Absent</font>
                                </td>
                                <td>${requestScope.session.group.supervisor.lecturerID}</td>
                                <td>${attend.recordTime}</td>
                            </tr>   
                        </c:forEach>
                    </tbody>
                </table>
                <input type="submit" value="Save"/>
            </form>
        </div> 
        <br/>
    </body>
</html>
