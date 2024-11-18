/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

import java.util.Date;

/**
 *
 * @author QUY BINH
 */
public class ThongTinDatBan018 {
     private int id; // Khóa chính
    private KhachHang018 khachHang; // Liên kết với KhachHang018
    private String soDienThoai;
    private Date thoiGianBatDau;
    private Date thoiGianKetThuc;
    private String tenNguoiAn;
    private DatBanChiTiet018[] dsDatBanChiTiet;
    public ThongTinDatBan018() {

    }
    public void setDsDatBanChiTiet(DatBanChiTiet018[] dsDatBanChiTiet) {
        this.dsDatBanChiTiet = dsDatBanChiTiet;
    }
    public DatBanChiTiet018[] getDsDatBanChiTiet() {
        return dsDatBanChiTiet;
    }

    public int getId() {
        return id;
    }

    public KhachHang018 getKhachHang() {
        return khachHang;
    }

    public String getSoDienThoai() {
        return soDienThoai;
    }

    public Date getThoiGianKetThuc() {
        return thoiGianKetThuc;
    }

    public Date getThoiGianBatDau() {
        return thoiGianBatDau;
    }

    public String getTenNguoiAn() {
        return tenNguoiAn;
    }

    // tạo getter và setter cho các thuộc tính
    public void setKhachHang(KhachHang018 khachHang) {
        this.khachHang = khachHang;
    }

    public void setSoDienThoai(String soDienThoai) {
        this.soDienThoai = soDienThoai;
    }

    public void setThoiGianKetThuc(Date thoiGianKetThuc) {
        this.thoiGianKetThuc = thoiGianKetThuc;
    }

    public void setThoiGianBatDau(Date thoiGianBatDau) {
        this.thoiGianBatDau = thoiGianBatDau;
    }

    public void setTenNguoiAn(String tenNguoiAn) {
        this.tenNguoiAn = tenNguoiAn;
    }
    public void setId(int id) {
        this.id = id;
    }


}
