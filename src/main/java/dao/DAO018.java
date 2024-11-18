/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

/**
 *
 * @author QUY BINH
 */

import java.sql.Connection;
import java.sql.DriverManager;

public class DAO018 {
    public static Connection con;

    public DAO018() {
        if (con == null) {
            String dbClass = "com.mysql.cj.jdbc.Driver";
            try {
                Class.forName(dbClass);
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/nha_hang?useUnicode=true&characterEncoding=UTF-8", "root", "dangbinh1770");
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        System.out.println("Kết nối thành công");
    }
}