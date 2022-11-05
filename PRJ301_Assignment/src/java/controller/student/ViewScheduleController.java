/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.student;

import controller.authentication.BaseRoleController;
import dal.SessionDBContext;
import dal.StudentDBContext;
import dal.TimeSlotDBContext;
import helper.DateTimeHelper;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import model.Account;
import model.Student;
import model.Session;
import model.TimeSlot;

/**
 *
 * @author Mạc Huyền
 */
public class ViewScheduleController extends BaseRoleController{

    @Override
    protected void processPost(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
        processRequest(req, resp); 
    }

    @Override
    protected void processGet(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
        processRequest(req, resp); 
    }

    private void processRequest(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String sid = req.getParameter("studentID");
        String raw_from = req.getParameter("from");
        String raw_to = req.getParameter("to");
        java.sql.Date from = null;
        java.sql.Date to = null;
        if(raw_from == null || raw_from.length() == 0) {
            Date today = new Date();
            int todayOfWeek = DateTimeHelper.getDayofWeek(today);
            Date e_from = DateTimeHelper.addDay(today, 2 - todayOfWeek);
            Date e_to = DateTimeHelper.addDay(today, 8-todayOfWeek);
            from = DateTimeHelper.toDateSql(e_from);
            to = DateTimeHelper.toDateSql(e_to);
        }
        else {
            from = java.sql.Date.valueOf(raw_from);
            to = java.sql.Date.valueOf(raw_to);
        }
        
        req.setAttribute("from", from);
        req.setAttribute("to", to);
        req.setAttribute("date", DateTimeHelper.getDateList(from, to));
    
        TimeSlotDBContext timeSlotDB = new TimeSlotDBContext();
        ArrayList<TimeSlot> timeSlot = timeSlotDB.list();
        req.setAttribute("timeSlot", timeSlot);
        
        SessionDBContext sessionDB = new SessionDBContext();
        ArrayList<Session> session = sessionDB.filter(sid, from, to);
        req.setAttribute("session", session);
        
        StudentDBContext studentDB = new StudentDBContext();
        Student student = studentDB.get(sid);
        req.setAttribute("student", student);
        
        req.getRequestDispatcher("/report/student/ViewSchedule.jsp").forward(req, resp);
    }
    
}
