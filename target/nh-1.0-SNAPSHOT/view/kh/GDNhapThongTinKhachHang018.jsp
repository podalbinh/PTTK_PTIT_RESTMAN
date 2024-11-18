<%-- 
    Document   : GDNhapThongTinKhachHang.jsp
    Created on : Nov 10, 2024, 3:54:20 PM
    Author     : QUY BINH
--%>            

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.*, javax.servlet.http.*, java.util.*, java.text.SimpleDateFormat, models.ThongTinDatBan018 , models.DatBanChiTiet018, models.KhachHang018, models.Ban018, dao.BanDAO018" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body {
                height: 100%;
                margin: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                background-color: #f8f9fa;
            }
            .container {
                width: 80%;
                max-width: 600px;
                background-color: #ffffff;
                padding: 30px;
                border-radius: 8px;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            }
            h1 {
                text-align: center;
                color: #333;
                margin-bottom: 20px;
                font-size: 28px;
                font-weight: bold;
            }
            form {
                display: flex;
                flex-direction: column;
                gap: 15px;
            }
            label {
                font-weight: bold;
                margin-bottom: 5px;
                font-size: 16px;
            }
            input {
                padding: 12px;
                border: 1px solid #ccc;
                border-radius: 4px;
                width: 100%;
                font-size: 16px;
                margin-bottom: 15px;
            }
            button {
                padding: 12px;
                border: none;
                border-radius: 4px;
                background-color: #28a745;
                color: white;
                cursor: pointer;
                font-size: 18px;
                transition: background-color 0.3s;
            }
            button:hover {
                background-color: #218838;
            }
            .button-group {
                display: flex;
                justify-content: space-between;
                margin-top: 20px;
            }
            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
            }
            th, td {
                padding: 12px;
                text-align: left;
                border: 1px solid #ddd;
            }
            th {
                background-color: #5cb85c;
                color: white;
                font-weight: bold;
            }
            tr:nth-child(even) {
                background-color: #f9f9f9;
            }
            tr:hover {
                background-color: #f1f1f1;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>Nhập thông tin khách hàng</h1>
            <%  request.setCharacterEncoding("UTF-8");
            KhachHang018 khachHang = (KhachHang018) session.getAttribute("khachhang");
            if(khachHang == null){
                response.sendRedirect("../../GDDangNhap018.jsp");
                return;
            }
                Date thoiGianBatDau =   (Date) session.getAttribute("thoiGianBatDau");
                Date thoiGianKetThuc = (Date) session.getAttribute("thoiGianKetThuc");
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
                List<Ban018> listBanChon = (new BanDAO018()).getListBanByIds(request.getParameterValues("selectedBan"));
                DatBanChiTiet018[] dsDatBanChiTiet = new DatBanChiTiet018[listBanChon.size()];
                for(int i = 0; i < listBanChon.size(); i++){
                    dsDatBanChiTiet[i] = new DatBanChiTiet018();
                    dsDatBanChiTiet[i].setBan(listBanChon.get(i));
                }
                session.setAttribute("dsDatBanChiTiet", dsDatBanChiTiet);
              
                if (listBanChon == null) {
                    response.sendRedirect("GDChonBan.jsp");
                } else {
            %>
            <form action="doLuuDatBan018.jsp" method="post">
               
                <label for="startDate">Ngày giờ bắt đầu: <p> <%= sdf.format(thoiGianBatDau) %></p><label>
                <label for="endDate">Ngày giờ kết thúc: <p> <%= sdf.format(thoiGianKetThuc) %></p></label>
                <label for="name">Tên:</label>
                <input type="text" id="name" name="tenNguoiAn" value="<%= khachHang.getHoTen() %>" required>
                <label for="phone">Số điện thoại:</label>
                <input type="tel" id="phone" name="soDienThoai" value="<%= khachHang.getSoDienThoai() %>" required>
                <h1> Bàn đã chọn</h1>
                <table>
                    <thead>
                        <tr>
                        <th>TT</th>
                        <th>Tên bàn ăn</th>
                        <th>Mô tả</th>
                        <th>Giá</th>
                        <th>Số lượng người</th>
                        <th>Loại</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (int i = 0; i < listBanChon.size(); i++) { 
                           Ban018 ban = listBanChon.get(i);
                           %>
                        <tr>
                            <td><%= i + 1 %></td>
                            <td>  <%= ban.getTen() %></td>
                            <td> <%= ban.getMoTa() != null ? ban.getMoTa() : "" %></td>
                            <td> <%= String.format("%.0f", ban.getGia()) %></td>
                            <td> <%= ban.getSoLuongNguoi() %></td>
                            <td> <%= ban.getLoai() %></td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
            <div class="button-group">
                <button type="button" onclick="history.back()">Quay lại</button>
                <button type="submit">Lưu</button>
            </div>
        </form>
        <% } %>
        </div>
    </body>
</html>
