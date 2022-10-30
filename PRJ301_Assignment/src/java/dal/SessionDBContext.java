/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Group;
import model.Lecturer;
import model.Room;
import model.Session;
import model.Subject;
import model.TimeSlot;

/**
 *
 * @author Mạc Huyền
 */
public class SessionDBContext extends dal.DBContext<Session> {

    public ArrayList<Session> filter(String lid, Date from, Date to) {
        ArrayList<Session> session = new ArrayList<>();
        try {
            String sql = "SELECT ss.SessionNo, ss.[Date], ss.[Index], ss.Attend,\n"
                    + "		l.LecturerID, l.LecturerName,\n"
                    + "		g.GroupID, g.GroupName,\n"
                    + "		s.SubjectID, s.SubjectName,\n"
                    + "		r.RoomID, r.RoomName,\n"
                    + "		t.Slot, t.[Description]\n"
                    + "FROM [Session] ss INNER JOIN Lecturer l ON l.LecturerID = ss.LecturerID\n"
                    + "				INNER JOIN [Group] g ON g.GroupID = ss.GroupID\n"
                    + "				INNER JOIN [Subject] s ON s.SubjectID = g.SubjectID\n"
                    + "				INNER JOIN Room r ON r.RoomID = ss.RoomID\n"
                    + "				INNER JOIN TimeSlot t ON t.Slot = ss.Slot\n"
                    + "WHERE l.LecturerID = ?\n"
                    + "AND ss.[Date] >= ?\n"
                    + "AND ss.[Date] <= ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, lid);
            stm.setDate(2, from);
            stm.setDate(3, to);
            ResultSet rs = stm.executeQuery();
            while(rs.next()) {
                Session ss = new Session();
                Lecturer l = new Lecturer();
                Room r = new Room();
                Group g = new Group();
                TimeSlot t = new TimeSlot();
                Subject s = new Subject();
                
                ss.setSessionNo(rs.getInt("sessionNo"));
                ss.setDate(rs.getDate("date"));
                ss.setIndex(rs.getInt("index"));
                ss.setAttend(rs.getBoolean("attend"));
                
                l.setLecturerID(rs.getString("lectureID"));
                l.setLecturerName(rs.getString("lecturerName"));
                ss.setLecturer(l);
                
                g.setGroupID(rs.getInt("groupID"));
                g.setGroupName(rs.getString("groupName"));
                ss.setGroup(g);
                
                s.setSubjectID(rs.getString("subjectID"));
                s.setSubjectName(rs.getString("subjectName"));
                g.setSubject(s);
                
                r.setRoomID(rs.getInt("roomID"));
                r.setRoomName(rs.getString("rroomName"));
                ss.setRoom(r);
                
                t.setSlot(rs.getInt("slot"));
                t.setDescription(rs.getString("description"));
                ss.setSlot(t);
                
                session.add(ss);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return session;
    }

    @Override
    public Session get(String id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Session> schedule() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}
