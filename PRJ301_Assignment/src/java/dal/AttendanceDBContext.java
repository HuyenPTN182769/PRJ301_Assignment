/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Attendance;
import model.Group;
import model.Lecturer;
import model.Room;
import model.Session;
import model.TimeSlot;

/**
 *
 * @author Mạc Huyền
 */
public class AttendanceDBContext extends DBContext<Attendance>{

    @Override
    public Attendance get(String id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Attendance> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
    public ArrayList<Attendance> list(String studentID, String SubjectID) {
        String sql = "Select a.AttendantID, a.Status, a.RecordTime"
                + "s.SessionID,s.[Index],s.Date,"
                + "r.RoomID,r.RoomName,"
                + "ts.SlotID,ts.Description,"
                + "g.GroupID,g.GroupName,g.InstructorCode From Attendant a\n"
                + "INNER JOIN Session s ON a.SessionID = s.SessionID\n"
                + "INNER JOIN [Group] g ON s.GroupID = g.GroupID\n"
                + "INNER JOIN TimeSlot ts ON s.SlotID = ts.SlotID\n"
                + "INNER JOIN Room r ON s.RoomID = r.RoomID\n"
                + "WHERE a.StudentCode = ? AND g.CourseCode = ? ";
        ArrayList<Attendance> attend = new ArrayList<>();
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, studentID);
            stm.setString(2, SubjectID);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Attendance at = new Attendance();
                Session s = new Session();
                Room r = new Room();
                TimeSlot ts = new TimeSlot();
                Group g = new Group();
                Lecturer l = new Lecturer();

                at.setAttendID(rs.getInt("attendID"));
                Boolean status = rs.getBoolean("status");
                if(rs.wasNull()){
                    status = null;
                }
                at.setStatus(status);
                at.setRecordTime(rs.getDate("recordTime"));
                s.setSessionNo(rs.getInt("sessionNo"));
                s.setIndex(rs.getInt("index"));
                s.setDate(rs.getDate("date"));

                r.setRoomID(rs.getInt("roomID"));
                r.setRoomName(rs.getString("roomName"));
                s.setRoom(r);

                ts.setSlot(rs.getInt("slot"));
                ts.setDescription(rs.getString("description"));
                s.setSlot(ts);

                g.setGroupID(rs.getInt("GroupID"));
                g.setGroupName(rs.getString("GroupName"));

                l.setLecturerID(rs.getString("lecturerID"));
                g.setSupervisor(l);
                s.setGroup(g);
                at.setSession(s);

                attend.add(at);
            }
            return attend;
        } catch (SQLException ex) {
            Logger.getLogger(AttendanceDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
