<%-- 
    Document   : doLuuDatBan.jsp
    Created on : Nov 10, 2024, 11:49:18 PM
    Author     : QUY BINH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.*, javax.servlet.http.*, java.util.Date" %>
<%@ page import="models.KhachHang018,  java.util.*, models.Ban018,  models.DatBanChiTiet018, models.ThongTinDatBan018, dao.ThongTinDatBanDAO018" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thông tin đã nhận</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                background-color: #f4f4f9;
            }
            .container {
                background-color: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                text-align: center;
                max-width: 400px;
                width: 100%;
            }
            h3.success {
                color: #28a745;
            }
            .button {
                display: inline-block;
                margin-top: 20px;
                padding: 10px 20px;
                background-color: #28a745;
                color: #fff;
                text-decoration: none;
                border-radius: 5px;
                font-weight: bold;
                border: none;
                cursor: pointer;
            }
            .button:hover {
                background-color: #218838;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <%
                request.setCharacterEncoding("UTF-8");
                KhachHang018 khachHang = (KhachHang018) session.getAttribute("khachhang");
                if(khachHang == null){
                    response.sendRedirect("../../GDDangNhap018.jsp");
                    return;
                }
                ThongTinDatBan018 ttdb = new ThongTinDatBan018();
                ttdb.setKhachHang(khachHang);
                ttdb.setSoDienThoai(request.getParameter("soDienThoai"));
                ttdb.setThoiGianBatDau((Date) session.getAttribute("thoiGianBatDau"));
                ttdb.setThoiGianKetThuc((Date) session.getAttribute("thoiGianKetThuc"));
                ttdb.setTenNguoiAn(request.getParameter("tenNguoiAn"));
                ttdb.setDsDatBanChiTiet((DatBanChiTiet018[]) session.getAttribute("dsDatBanChiTiet"));
                
                if((new ThongTinDatBanDAO018()).luuDatBan(ttdb)){
                    out.println("<h3 name='hThongBao' class='success'>Lưu thông tin đặt bàn thành công!</h3>");
                }
                else {
                out.println("<h3 name='hThongBao' class='success'>Lưu thông tin đặt bàn thất bại!</h3>");
                }
            %>
            
            <a href="GDChinhKH018.jsp" class="button">Trở lại</a>
        </div>
    </body>
</html>
