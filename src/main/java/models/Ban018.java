/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

/**
 *
 * @author QUY BINH
 */

public class Ban018 {
    private String ten; // Name of the table
    private String moTa; // Description of the table
    private Double gia; // Price of the table
    private int soLuongNguoi; // Number of people the table can accommodate
    private String loai; // Type of the table
    private int id; // ID of the table
    // Constructor
    public Ban018(int id, String ten, String moTa, Double gia, int soLuongNguoi, String loai) {
        this.id = id;
        this.ten = ten;
        this.moTa = moTa;
        this.gia = gia;
        this.soLuongNguoi = soLuongNguoi;
        this.loai = loai;
       
    }

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    // Getters
    public String getTen() {
        return ten;
    }

    public String getMoTa() {
        return moTa;
    }

    public Double getGia() {
        return gia;
    }

    public int getSoLuongNguoi() {
        return soLuongNguoi;
    }

    public String getLoai() {
        return loai;
    }



    // Setters (if needed)
    public void setTen(String ten) {
        this.ten = ten;
    }

    public void setMoTa(String moTa) {
        this.moTa = moTa;
    }

    public void setGia(Double gia) {
        this.gia = gia;
    }

    public void setSoLuongNguoi(int soLuongNguoi) {
        this.soLuongNguoi = soLuongNguoi;
    }

    public void setLoai(String loai) {
        this.loai = loai;
    }


}