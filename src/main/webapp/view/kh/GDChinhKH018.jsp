<%-- 
    Document   : GDChinhKH
    Created on : Nov 10, 2024, 3:46:27 PM
    Author     : QUY BINH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f9;
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                height: 100vh;
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }
            .greeting {
                font-weight: bold;
                margin-bottom: 20px;
                font-size: 24px;
                text-align: center;
            }
            .container {
                background-color: #fff;
                padding: 30px;
                border-radius: 8px;
                box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
                width: 90%;
                max-width: 400px;
                text-align: center;
            }
            .container button {
                width: 100%;
                padding: 10px;
                margin-top: 15px;
                background-color: #007bff;
                border: none;
                border-radius: 4px;
                color: white;
                font-size: 18px;
                cursor: pointer;
                transition: background-color 0.3s;
            }
            .container button:hover {
                background-color: #0056b3;
            }
        </style>
    </head>
    <body>
        <%@ page import="javax.servlet.*, javax.servlet.http.*, models.KhachHang018" %>
        <%
        KhachHang018 khachHang = (KhachHang018) session.getAttribute("khachhang");
            if(khachHang == null){
                response.sendRedirect("../../GDDangNhap018.jsp");
                return; 
            }
        %>
        <h3 class='greeting'>
            <%
                if (khachHang != null) {
                    out.println("Xin chào, " + khachHang.getHoTen());
                } else {
                    out.println("Bạn chưa đăng nhập.");
                }
            %>
        </h3>
        <main class="container">
            <button onclick="location.href='GDDatBan018.jsp'">Đặt bàn</button>
        </main>
    </body>
</html>
