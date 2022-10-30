/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package helper;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

/**
 *
 * @author Mạc Huyền
 */
public class DateTimeHelper {
    
    public static Date toDate(String value, String format) throws ParseException {
        return new SimpleDateFormat(format).parse(value);
    }
    
    public static Date removeTime(Date date) {
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        cal.set(Calendar.HOUR_OF_DAY, 0);
         cal.set(Calendar.MINUTE, 0);
        cal.set(Calendar.SECOND, 0);
        cal.set(Calendar.MILLISECOND, 0);
        return cal.getTime();
    }
    
    public static java.util.Date toDateUtil(java.sql.Date d) {
        java.util.Date x = new java.util.Date(d.getTime());
        x = removeTime(x);
        return x;
    }
    
    public static java.sql.Date toDateSql(java.util.Date d) {
        d = removeTime(d);
        return new java.sql.Date(d.getTime());
    }
    
    public static int getDayofWeek(java.util.Date d) {
        Calendar cal = Calendar.getInstance();
        cal.setTime(d);
        int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
        return dayOfWeek;
    }
    
    public static Date addDay(java.util.Date d, int day) {
        Calendar cal = Calendar.getInstance();
        cal.setTime(d);
        cal.add(Calendar.DATE, day);
        return cal.getTime();
    }
    
    public static ArrayList<java.sql.Date> getDateList(java.sql.Date from, java.sql.Date to) {
        ArrayList<java.sql.Date> date = new ArrayList<>();
        int day = 0;
        java.util.Date e_from = toDateUtil(from);
        java.util.Date e_to = toDateUtil(to);
        while(true) {
            java.util.Date d = DateTimeHelper.addDay(e_from, day);
            date.add(toDateSql(d));
            day++;
            if(d.compareTo(e_to) >= 0) {
                break;
            }
        }
        return date;
    }
    
    public static String getDayNameofWeek(java.sql.Date s) {
        java.util.Date d = toDateUtil(s);
        Calendar cal = Calendar.getInstance();
        cal.setTime(d);
        int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
        switch(dayOfWeek) {
            case 1: return "SUN";
            case 2: return "MON";
            case 3: return "TUE";
            case 4: return "WED";
            case 5: return "THU";
            case 6: return "FRI";
            case 7: return "SAT";
        }
        return "ERROR";
    }
    
    public static int compare(java.sql.Date a, java.sql.Date b) {
        Date e_a = toDateUtil(a);
        Date e_b = toDateUtil(b);
        System.out.println(a + " " + b + " " + e_a.compareTo(e_b));
        return e_a.compareTo(e_b);
    }
    
}
