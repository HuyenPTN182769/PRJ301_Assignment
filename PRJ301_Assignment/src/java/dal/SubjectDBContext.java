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
import model.Subject;

/**
 *
 * @author Mạc Huyền
 */
public class SubjectDBContext extends DBContext<Subject> {

    @Override
    public Subject get(String id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Subject> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
    public ArrayList<Subject> list(String studentID) {
        String sql = "Select c.CourseCode,c.CourseName from [Group] g\n"
                + "INNER JOIN Group_Student gs ON g.GroupID = gs.GroupID\n"
                + "INNER JOIN Course c ON g.CourseCode = c.CourseCode\n"
                + "WHERE gs.StudentCode = ?";
        ArrayList<Subject> subject = new ArrayList<>();
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, studentID);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {                
                Subject s = new Subject();
                s.setSubjectID(rs.getString("subjectID"));
                s.setSubjectName(rs.getString("subjectName"));
                subject.add(s);
            }
            return subject;
        } catch (SQLException ex) {
            Logger.getLogger(SubjectDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
}
