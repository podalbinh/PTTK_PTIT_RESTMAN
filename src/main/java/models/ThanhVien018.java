package models;

public class ThanhVien018 {
    private int id; // Khóa chính
    private String taiKhoan;
    private String matKhau;
    private String hoTen;
    private String ngaySinh; // Ngày sinh
    private String diaChi;
    private String email;
    private String soDienThoai;
    private String gioiTinh;

    public ThanhVien018(int id, String taiKhoan, String matKhau, String hoTen, String ngaySinh, 
                        String diaChi, String email, String soDienThoai, String gioiTinh) {
        this.id = id;
        this.taiKhoan = taiKhoan;
        this.matKhau = matKhau;
        this.hoTen = hoTen;
        this.ngaySinh = ngaySinh;
        this.diaChi = diaChi;
        this.email = email;
        this.soDienThoai = soDienThoai;
        this.gioiTinh = gioiTinh;
    }
    public ThanhVien018() {
    }


    //getter và setter
    public String getDiaChi() {
        return diaChi;
    }
    public String getEmail() {
        return email;
    }
    public String getGioiTinh() {
        return gioiTinh;
    }
    public String getHoTen() {
        return hoTen;
    }
    public int getId() {
        return id;
    }
    public String getNgaySinh() {
        return ngaySinh;
    }
    public String getMatKhau() {
        return matKhau;
    }
    public String getSoDienThoai() {
        return soDienThoai;
    }
    public String getTaiKhoan() {
        return taiKhoan;    
    }
    public void setDiaChi(String diaChi) {
        this.diaChi = diaChi;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public void setGioiTinh(String gioiTinh) {
        this.gioiTinh = gioiTinh;
    }
    public void setHoTen(String hoTen) {
        this.hoTen = hoTen;
    }
    public void setId(int id) {
        this.id = id;
    }
    public void setNgaySinh(String ngaySinh) {
        this.ngaySinh = ngaySinh;
    }
    public void setMatKhau(String matKhau) {
        this.matKhau = matKhau;
    }
    public void setSoDienThoai(String soDienThoai) {
        this.soDienThoai = soDienThoai;
    }
    public void setTaiKhoan(String taiKhoan) {
        this.taiKhoan = taiKhoan;
    }
}
