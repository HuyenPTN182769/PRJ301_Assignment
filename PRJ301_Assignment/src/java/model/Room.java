/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;

/**
 *
 * @author Mạc Huyền
 */
public class Room {
    private int roomID;
    private String roomName;
    private ArrayList<Session> session = new ArrayList<>();

    public int getRoomID() {
        return roomID;
    }

    public void setRoomID(int roomID) {
        this.roomID = roomID;
    }

    public String getRoomName() {
        return roomName;
    }

    public void setRoomName(String roomName) {
        this.roomName = roomName;
    }

    public ArrayList<Session> getSession() {
        return session;
    }

    public void setSession(ArrayList<Session> session) {
        this.session = session;
    }
    
}