/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.lecturer;

import controller.authentication.BaseRoleController;
import dal.SessionDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import model.Account;
import model.Attendance;
import model.Session;
import model.Student;

/**
 *
 * @author Mạc Huyền
 */
public class TakeAttendanceController extends BaseRoleController{

    @Override
    protected void processPost(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
        Session ss = new Session();
        ss.setSessionNo(Integer.parseInt(req.getParameter("ssNo")));
        String[] studentID = req.getParameterValues("studentID");
        for (String stuID : studentID) {
            Attendance a = new Attendance();
            Student s = new Student();
            a.setStudent(s);
            a.setAttend(req.getParameter("attend" + stuID).equals("present"));
            s.setStudentID(stuID);
            ss.getAttendance().add(a);
        }
        SessionDBContext db = new SessionDBContext();
        db.update(ss);
        resp.sendRedirect("takeAttendance?id=" + ss.getSessionID());
    }

    @Override
    protected void processGet(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
        int ssNo = Integer.parseInt(req.getParameter("sessionNo"));
        SessionDBContext ssDB = new SessionDBContext();
        Session ses = ssDB.get(ssNo);
        req.setAttribute("session", ses);
        req.getRequestDispatcher("/report/lecturer/TakeAttandance.jsp").forward(req, resp);
    }
    
}
