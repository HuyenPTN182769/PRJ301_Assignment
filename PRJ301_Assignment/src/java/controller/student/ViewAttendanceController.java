/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.student;

import dal.AttendanceDBContext;
import dal.SubjectDBContext;
import dal.StudentDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import model.Attendance;
import model.Student;
import model.Subject;

/**
 *
 * @author Mạc Huyền
 */
public class ViewAttendanceController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processRequest(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processRequest(req, resp);
    }

    private void processRequest(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String studentID = req.getParameter("studentID");
        String subjectID = req.getParameter("subjectID");

        if (subjectID != null && subjectID.length() != 0) {
            req.setAttribute("subjectID", subjectID);
        }

        SubjectDBContext subjectDB = new SubjectDBContext();
        ArrayList<Subject> subject = subjectDB.list(studentID);
        req.setAttribute("subject", subject);

        StudentDBContext studentDB = new StudentDBContext();
        Student student = studentDB.get(studentID);
        req.setAttribute("student", student);

        AttendanceDBContext attendDB = new AttendanceDBContext();
        ArrayList<Attendance> attend = attendDB.list(studentID, subjectID);
        req.setAttribute("listAtt", attend);

        req.getRequestDispatcher("/report/student/ViewAttendance.jsp").forward(req, resp);
    }
    
}
