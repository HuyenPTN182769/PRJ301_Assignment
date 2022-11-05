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
import model.TimeSlot;

/**
 *
 * @author Mạc Huyền
 */
public class TimeSlotDBContext extends DBContext<TimeSlot> {

    @Override
    public TimeSlot get(String id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<TimeSlot> list() {
        ArrayList<TimeSlot> timeSlot = new ArrayList<>();
        try {
            String sql = "SELECT Slot, [Description] FROM TimeSlot";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while(rs.next()) {
                TimeSlot slot = new TimeSlot();
                slot.setSlot(rs.getInt("slot"));
                slot.setDescription(rs.getString("description"));
                timeSlot.add(slot);
            }
        } catch (SQLException ex) {
            Logger.getLogger(TimeSlotDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return timeSlot;
    }
}
