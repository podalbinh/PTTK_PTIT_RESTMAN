/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

/**
 *
 * @author QUY BINH
 */
import models.MonAn018;

import java.sql.CallableStatement;
import java.sql.SQLException;
public class MonAnDAO018 extends DAO018{


    public MonAnDAO018() {
        super();
    }   

    // Phương thức lưu món ăn vào cơ sở dữ liệu
    public boolean luuMonAn(MonAn018 monan) throws SQLException {
        boolean result = true;
        String sql = "INSERT INTO mon_an018 (Ten, MoTa, Gia, Loai, XuatXu) VALUES (?, ?, ?, ?, ?)";
        try {
            System.out.println(monan.getTen());
            CallableStatement cs = con.prepareCall(sql);
            cs.setString(1, monan.getTen());
            cs.setString(2, monan.getMoTa());
            cs.setDouble(3, monan.getGia());
            cs.setString(4, monan.getLoai());
            cs.setString(5, monan.getXuatXu());
            cs.executeUpdate();
        } catch (SQLException e) {
            result = false;
            e.printStackTrace();
        }
        return result;
    }
}