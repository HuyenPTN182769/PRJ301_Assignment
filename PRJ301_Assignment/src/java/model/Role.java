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
public class Role {
    private int roleID;
    private String roleName;
    private ArrayList<Account> account = new ArrayList<>();
    private ArrayList<Feature> feature = new ArrayList<>();

    public int getRoleID() {
        return roleID;
    }

    public void setRoleID(int roleID) {
        this.roleID = roleID;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public ArrayList<Account> getAccount() {
        return account;
    }

    public void setAccount(ArrayList<Account> account) {
        this.account = account;
    }

    public ArrayList<Feature> getFeature() {
        return feature;
    }

    public void setFeature(ArrayList<Feature> feature) {
        this.feature = feature;
    }
    
}
