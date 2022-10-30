/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.lecturer;

import dal.LecturerDBContext;
import dal.SessionDBContext;
import dal.TimeSlotDBContext;
import helper.DateTimeHelper;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import model.Lecturer;
import model.Session;
import model.TimeSlot;

/**
 *
 * @author Mạc Huyền
 */
public class ViewScheduleController extends HttpServlet{

    protected void processRequest(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String lid = req.getParameter("lectureID");
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
        ArrayList<TimeSlot> timeSlot = timeSlotDB.schedule();
        req.setAttribute("timeSlot", timeSlot);
        
        SessionDBContext sessionDB = new SessionDBContext();
        ArrayList<Session> session = sessionDB.filter(lid, from, to);
        req.setAttribute("session", session);
        
        LecturerDBContext lecturerDB = new LecturerDBContext();
        Lecturer lecturer = lecturerDB.get(lid);
        req.setAttribute("lecturer", lecturer);
        
        req.getRequestDispatcher("/report/lecturer/ViewSchedule.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processRequest(req, resp); 
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processRequest(req, resp); 
    }
    
}
