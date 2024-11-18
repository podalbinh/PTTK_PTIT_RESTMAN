
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*, javax.servlet.*, javax.servlet.http.*,  models.ThanhVien018,  models.KhachHang018" %>
<%

    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String isEmployee = request.getParameter("isEmployee");
    String errorMessage = null;

    if (username != null && password != null) {
        // Simple authentication logic (replace with real authentication)
        if ("binhdq".equals(username) && "123456".equals(password)) {
            if ("on".equals(isEmployee)) {
                response.sendRedirect("view/nv/GDChinhNV018.jsp");
            } else {
                ThanhVien018 tv = new ThanhVien018(1, username, password, "Đặng Quý Bình", 
                "2003-11-05", "Điện Biên", 
                "binhdq@gmail.com", "0123456789", "Nam");

                KhachHang018 khachHang = new KhachHang018();
                khachHang.setId(1);
                khachHang.setTaiKhoan(username);
                khachHang.setMatKhau(password);
                khachHang.setHoTen(tv.getHoTen());
                khachHang.setNgaySinh(tv.getNgaySinh());
                khachHang.setDiaChi(tv.getDiaChi());
                khachHang.setEmail(tv.getEmail());
                khachHang.setSoDienThoai(tv.getSoDienThoai());
                khachHang.setGioiTinh(tv.getGioiTinh());
 
                session.setAttribute("khachhang", khachHang);
                response.sendRedirect("view/kh/GDChinhKH018.jsp");
            }
            return;
        } else {
            errorMessage = "Tên đăng nhập hoặc mật khẩu không đúng!";
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Đăng Nhập</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .login-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
            max-width: 90%;
            text-align: center;
        }
        .login-container h2 {
            margin-bottom: 20px;
        }
        .login-container label {
            display: block;
            margin-bottom: 5px;
            text-align: left;
        }
        .login-container input[type="text"],
        .login-container input[type="password"] {
            width: calc(100% - 16px);
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        .login-container input[type="submit"] {
            width: 100%;
            padding: 12px;
            background-color: #007bff;
            border: none;
            border-radius: 4px;
            color: white;
            font-size: 16px;
            cursor: pointer;
        }
        .login-container input[type="submit"]:hover {
            background-color: #0056b3;
        }
        .error-message {
            color: red;
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2>Đăng Nhập</h2>
        <% if (errorMessage != null) { %>
            <p class="error-message"><%= errorMessage %></p>
        <% } %>
        <form action="GDDangNhap018.jsp" method="post">
            <label for="username">Tên đăng nhập:</label>
            <input type="text" id="username" name="username" required>
            
            <label for="password">Mật khẩu:</label>
            <input type="password" id="password" name="password" required>
            
            <label>
                <input type="checkbox" id="isEmployee" name="isEmployee"> Nhân viên
            </label>
            
            <input type="submit" value="Đăng Nhập">
        </form>
    </div>
</body>
</html> 