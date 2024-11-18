/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;



import models.Ban018;


import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author QUY BINH
 */
public class BanDAO018 extends DAO018{


    public BanDAO018() {
        super();
    }

 
    public List<Ban018> getBanTrong(Date thoiGianBatDau, Date thoiGianKetThuc) throws SQLException {
        List<Ban018> list = new ArrayList<>();
        String sql = "SELECT b.*  " + 
                    "FROM ban018 AS b " + 
                    "WHERE b.id NOT IN (" + 
                    "    SELECT dbct.ban018Id " + 
                    "    FROM dat_ban_chi_tiet018 AS dbct " + 
                    "    JOIN thong_tin_dat_ban018 AS tt ON dbct.thongTinDatBan018Id = tt.id " + 
                    "    WHERE (tt.thoiGianBatDau < ? AND tt.thoiGianKetThuc > ?) " + 
                    "       OR (tt.thoiGianBatDau < ? AND tt.thoiGianKetThuc > ?) " + 
                    "       OR (tt.thoiGianBatDau >= ? AND tt.thoiGianKetThuc <= ?) " + 
                    ");";
            CallableStatement cstmt = con.prepareCall(sql);
            cstmt.setTimestamp(1, new java.sql.Timestamp(thoiGianBatDau.getTime()));
            cstmt.setTimestamp(2, new java.sql.Timestamp(thoiGianBatDau.getTime()));
            cstmt.setTimestamp(3, new java.sql.Timestamp(thoiGianKetThuc.getTime()));
            cstmt.setTimestamp(4, new java.sql.Timestamp(thoiGianKetThuc.getTime()));
            cstmt.setTimestamp(5, new java.sql.Timestamp(thoiGianBatDau.getTime()));
            cstmt.setTimestamp(6, new java.sql.Timestamp(thoiGianKetThuc.getTime()));
        try (ResultSet rs = cstmt.executeQuery()) {
        while (rs.next()) {
            list.add(new Ban018(rs.getInt("b.id"), rs.getString("b.ten"), rs.getString("b.moTa"), rs.getDouble("b.gia"), rs.getInt("b.soLuongNguoi"), rs.getString("b.loai"))); 
        }
        }
        return list;
    }

    public List<Ban018> getListBanByIds(String[] selectedBanIds) throws SQLException {
        List<Ban018> list = new ArrayList<>();
        StringBuilder sqlBuilder = new StringBuilder("SELECT b.* FROM ban018 AS b WHERE b.id in (");
        for (int i = 0; i < selectedBanIds.length; i++) {
            sqlBuilder.append(selectedBanIds[i]);
            if (i < selectedBanIds.length - 1) {
                sqlBuilder.append(",");
            }
        }
        sqlBuilder.append(")");
        System.out.println(sqlBuilder.toString());
        CallableStatement cstmt = con.prepareCall(sqlBuilder.toString());
        try (ResultSet rs = cstmt.executeQuery()) {
            while (rs.next()) {
                list.add(new Ban018(rs.getInt("b.id"), rs.getString("b.ten"), rs.getString("b.moTa"), rs.getDouble("b.gia"), rs.getInt("b.soLuongNguoi"), rs.getString("b.loai")));
            }
        }
        return list;    
    }
}