<%-- 
    Document   : GDChonBan
    Created on : Nov 10, 2024, 3:54:02 PM
    Author     : QUY BINH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="javax.servlet.*, javax.servlet.http.*, java.util.*, models.KhachHang018, models.Ban018, dao.BanDAO018 " %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Chọn Bàn</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 20px;
            }
            h1 {
                text-align: center;
                color: #333;
                margin-bottom: 30px;
            }
            table {
                width: 100%;
                border-collapse: collapse;
                margin: 30px 0;
                background: #fff;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            }
            th, td {
                padding: 15px;
                text-align: left;
                border: 1px solid #ccc;
                cursor: pointer;
            }
            th {
                background-color: #5cb85c;
                color: white;
            }
            tr:hover {
                background-color: #f1f1f1;
            }
            .button-container {
                text-align: center;
                margin-top: 30px;
            }
            button {
                padding: 12px 25px;
                background-color: #5cb85c;
                color: white;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                font-size: 16px;
            }
            button:hover {
                background-color: #4cae4c;
            }
        </style>
    </head>
    <body>
        <%     
            request.setCharacterEncoding("UTF-8");
            KhachHang018 khachHang = (KhachHang018) session.getAttribute("khachhang");
            if(khachHang == null){
                response.sendRedirect("../../GDDangNhap018.jsp");
                return;
            }
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
            Date thoiGianBatDau = null;
            Date thoiGianKetThuc = null;
            try {
                 thoiGianBatDau = sdf.parse(request.getParameter("date") + " " + request.getParameter("startTime"));
                 thoiGianKetThuc = sdf.parse(request.getParameter("date") + " " + request.getParameter("endTime"));
            } catch (Exception e) {
                e.printStackTrace(); 
            }
            List<Ban018> listBanTrong = (new BanDAO018()).getBanTrong(thoiGianBatDau, thoiGianKetThuc);
            session.setAttribute("listBanTrong", listBanTrong);
            session.setAttribute("thoiGianBatDau", thoiGianBatDau);
            session.setAttribute("thoiGianKetThuc", thoiGianKetThuc);

        %>

        <h1>Xin chào, <%= khachHang != null ? khachHang.getHoTen() : "Khách hàng" %>!</h1>
        <h1>Danh Sách Bàn Ăn Còn Trống</h1>
        <h3>Ngày đặt: <%= request.getParameter("date") %></h3>
        <h3>Giờ bắt đầu: <%= request.getParameter("startTime") %></h3>
        <h3>Giờ kết thúc: <%= request.getParameter("endTime") %></h3>
        <form action="GDNhapThongTinKhachHang018.jsp" method="post">
            <table>
                <thead>
                    <tr>
                        <th>TT</th>
                        <th>Tên bàn ăn</th>
                        <th>Mô tả</th>
                        <th>Giá</th>
                        <th>Số lượng người</th>
                        <th>Loại</th>
                        <th>Chọn</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (int i = 0; i < listBanTrong.size(); i++) { 
                           Ban018 ban = listBanTrong.get(i);
                           %>
                    <tr>
                        <td><%= i + 1 %></td>
                        <td>  <%= ban.getTen() %></td>
                        <td> <%= ban.getMoTa() != null ? ban.getMoTa() : "" %></td>
                        <td> <%= String.format("%.0f", ban.getGia()) %></td>
                        <td> <%= ban.getSoLuongNguoi() %></td>
                        <td> <%= ban.getLoai() %></td>
                        <td>
                            <input type="checkbox"  name="selectedBan" value=<%= ban.getId() %>>
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
            <div class="button-container">
                <button type="button" onclick="goBack()">Quay lại</button>
                <button type="submit" onclick="return validateSelection()">Tiếp tục</button>
            </div>
        </form>
        <script>
            function goBack() {
                window.history.back(); // Quay lại trang trước đó
            }
            function validateSelection() {
                const checkboxes = document.querySelectorAll('input[name="selectedBan"]:checked');
                if (checkboxes.length === 0) {
                    alert("Vui lòng chọn ít nhất một bàn để tiếp tục.");
                    return false; // Ngăn không cho form được gửi
                }
                return true; // Cho phép form được gửi
            }
        </script>
    </body>
</html>
