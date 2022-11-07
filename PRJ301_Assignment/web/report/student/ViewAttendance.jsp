<%-- 
    Document   : ViewAttendance
    Created on : Nov 7, 2022, 8:01:37 PM
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
        <div>
            <h2>View attendance for <span id="ctl00_mainContent_lblStudent">Phạm Thị Ngọc Huyền (HuyenPTNHE160769)</span></h2>
            <font style="font-weight: bold"> </font>
            <div id="ctl00_mainContent_divDetail"> </div><table>
                <tbody>
                    <tr>
                        <td valign="top">
                            <h3>Select a campus/program, term, course ...</h3>
                            <table summary="Select a course">
                                <thead>
                                    <tr>
                                        <th scope="col">Campus/program</th>
                                        <th scope="col">Term</th>
                                        <th scope="col">Course</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td valign="top">
                                            <div id="ctl00_mainContent_divCampus">
                                                <table>
                                                    <tbody>
                                                        <tr>
                                                            <td>
                                                                <b>FU-HL</b>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </td>
                                        <td valign="top">
                                            <div id="ctl00_mainContent_divTerm">
                                                <table>
                                                    <tbody>

                                                    <td valign="top">
                                                        <div id="ctl00_mainContent_divCourse">
                                                            <table>
                                                                <tbody>
                                                                    <tr>
                                                                        <td>
                                                                            <a href="">Statistics and Probability(MAS291)(SE1643,start 05/09/2022)</a>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <a href="?id=HE160769&amp;campus=3&amp;term=37&amp;course=27419">Java Web Application Development(PRJ301)</a>
                                                                            (SE1643,start 05/09/2022)
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <a href="?id=HE160769&amp;campus=3&amp;term=37&amp;course=27521">Elementary Japanese 1-A1.2(JPD123)</a>
                                                                            (SE1643,start 06/09/2022)</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <a href="?id=HE160769&amp;campus=3&amp;term=37&amp;course=27129">OOP with Java Lab(LAB211)</a>
                                                                            (SE1702,start 06/09/2022)</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <a href="?id=HE160769&amp;campus=3&amp;term=37&amp;course=28272">Introduction to Software Engineering(SWE201c)</a>
                                                                            (SE1635,start 17/09/2022)
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <a href="?id=HE160769&amp;campus=3&amp;term=37&amp;course=27700">Internet of Things(IOT102)</a>
                                                                            (SE1643,start 10/10/2022)
                                                                        </td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </td>
                                    <td valign="top">
                                        <h3>
                                            ... then see report<br><br>
                                        </h3>
                                        <c:if test="${requestScope.cCode ne null}">
                                            <table style="margin: 5px">
                                                <thead background-color: blue>
                                                    <tr>
                                                        <th>No</th>
                                                        <th>Date</th>
                                                        <th>Slot</th>
                                                        <th>Room</th>
                                                        <th>Instructor</th>
                                                        <th>Group</th>
                                                        <th>Status</th>
                                                    </tr>
                                                </thead>

                                                <c:forEach items="${requestScope.listAtt}" var="att">
                                                    <tr>
                                                        <td>${att.session.index}</td>
                                                        <td><span class="label label-primary">${att.session.date}</span></td>
                                                        <td><span class="label label-danger">${att.session.timeslot.slotID}_${att.session.timeslot.description}</span></td>
                                                        <td>${att.session.room.roomName}</td>
                                                        <td>${att.session.group.supervisor.instructorCode}</td>
                                                        <td>${att.session.group.groupName}</td>
                                                        <td>
                                                            <c:if test="${att.isStatus()}">
                                                                <br>(<font color="Green">Present</font>)<br>
                                                            </c:if>
                                                            <c:if test="${!att.isStatus() and att.isStatus() ne null}">
                                                                <br>(<font color="red">Absent</font>)<br>
                                                            </c:if>
                                                            <c:if test="${att.isStatus() eq null}">
                                                                <br>Future<br>
                                                            </c:if>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </table>
                                        </c:if>
                                    </td>
                                </tr>       
                            </tbody>
                        </table>
                    </td>
                </tr>
            </tbody>    
        </div>    
    </body>
</html>
