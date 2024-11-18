/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import models.ThongTinDatBan018;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import models.DatBanChiTiet018;

/**
 *
 * @author QUY BINH
 */
public class ThongTinDatBanDAO018 extends DAO018{


    public ThongTinDatBanDAO018() {
        super();
    }


    public boolean luuDatBan(ThongTinDatBan018 ttdb) throws SQLException {
        String sql1 = "INSERT INTO thong_tin_dat_ban018 (khachHang018Id, thoiGianBatDau, thoiGianKetThuc,tenNguoiAn,soDienThoai) VALUES (?, ?, ?,?,?)";
        String sql2 = "INSERT INTO dat_ban_chi_tiet018 (thongTinDatBan018Id, ban018Id) VALUES (?, ?)";
        boolean result = true;
        try {
            CallableStatement cs = con.prepareCall(sql1);
            cs.setInt(1, ttdb.getKhachHang().getId());
            cs.setTimestamp(2, new Timestamp(ttdb.getThoiGianBatDau().getTime()));
            cs.setTimestamp(3, new Timestamp(ttdb.getThoiGianKetThuc().getTime()));
            cs.setString(4, ttdb.getTenNguoiAn());
            cs.setString(5, ttdb.getSoDienThoai());
            cs.executeUpdate();
            
            ResultSet generatedKeys = cs.getGeneratedKeys();
            if (generatedKeys.next()) {
                int generatedId = generatedKeys.getInt(1);
                ttdb.setId(generatedId);
            }
            cs = con.prepareCall(sql2);
            for (DatBanChiTiet018 dbct : ttdb.getDsDatBanChiTiet()) {
                cs.setInt(1, ttdb.getId());
                cs.setInt(2, dbct.getBan().getId());
                cs.executeUpdate();
            }
        } catch (SQLException e) {
            result = false;
            e.printStackTrace();
        }
        return result;
    }
}
