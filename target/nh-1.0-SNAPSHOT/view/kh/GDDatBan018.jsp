<%-- 
    Document   : GDDatBan
    Created on : Nov 10, 2024, 3:53:41 PM
    Author     : QUY BINH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đặt Bàn</title>
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
                margin-bottom: 20px;
            }
            form {
                max-width: 500px;
                margin: 0 auto;
                padding: 30px;
                background: #fff;
                border-radius: 8px;
                box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
            }
            label {
                display: block;
                margin-bottom: 10px;
                font-weight: bold;
                font-size: 1.1em;
            }
            input[type="datetime-local"], input[type="date"], select {
                width: calc(100% - 20px);
                padding: 12px;
                margin-bottom: 20px;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
                font-size: 1em;
            }
            button {
                width: 100%;
                padding: 12px;
                background-color: #28a745;
                color: white;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                font-size: 1.1em;
                margin-bottom: 10px;
            }
            button:hover {
                background-color: #218838;
            }
        </style>
    </head>
    <body>
        <h1>Đặt Bàn</h1>
        <%@ page import="javax.servlet.*, javax.servlet.http.*, models.KhachHang018" %>
            <%  
            request.setCharacterEncoding("UTF-8");
            KhachHang018 khachHang = (KhachHang018) session.getAttribute("khachhang");
            if(khachHang == null){
                response.sendRedirect("../../GDDangNhap018.jsp");
                return;
            }
                 
            %>
        <h3 style='text-align: center; font-weight: bold; font-size: 1.5em; margin-top: 20px;'> Xin chào,  <%= khachHang.getHoTen() %></h3>
        <form action="GDChonBan018.jsp" method="post" onsubmit="return validateDates()">
            <label for="startDate">Ngày đặt :</label>
            <input type="date" id="date" name="date" required min="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) %>">
            
            <label for="startTime">Giờ bắt đầu:</label>
            <select id="startTime" name="startTime" required>
                <script>
                    // Tạo các tùy chọn giờ từ 00:00 đến 23:30, cách nhau 30 phút
                    for (let i = 16; i <= 47; i++) { // Chỉ đến 46 để không bao gồm 24:00
                        const hours = String(Math.floor(i / 2)).padStart(2, '0');
                        const minutes = (i % 2) * 30;
                        const time = hours + ':' + String(minutes).padStart(2, '0'); // Sử dụng chuỗi thông thường
                        document.write('<option value="' + time + '">' + time + '</option>'); // Sử dụng chuỗi thông thường
                    }
                </script>
            </select>
            
       
            <label for="endTime">Giờ kết thúc:</label>
            <select id="endTime" name="endTime" required>
                <script>
                    // Tạo các tùy chọn giờ từ 00:00 đến 23:30, cách nhau 30 phút
                    for (let i = 16; i <= 47; i++) { // Chỉ đến 46 để không bao gồm 24:00
                        const hours = String(Math.floor(i / 2)).padStart(2, '0');
                        const minutes = (i % 2) * 30;
                        const time = hours + ':' + String(minutes).padStart(2, '0'); // Sử dụng chuỗi thông thường
                        document.write('<option value="' + time + '">' + time + '</option>'); // Sử dụng chuỗi thông thường
                    }
                </script>
            </select>
            
            <button type="submit">Tiếp</button>
            <button type="button" onclick="window.history.back();">Quay Lại</button>
        </form>

        <script>
            function validateDates() {
                const dateStr = document.getElementById('date').value;
                const startTimeStr = document.getElementById('startTime').value;
                const endTimeStr = document.getElementById('endTime').value;
                
                const startDate = dateStr+" "+startTimeStr;
                const endDate = dateStr+" "+endTimeStr;
                const currentDate = new Date();
                const currentDateTime = new Date(currentDate.getTime() + (7 * 60 * 60 * 1000)); // Cộng thêm 7 giờ
                const formattedCurrentDateTime = currentDateTime.toISOString().replace('T', ' ').slice(0, 16); // Định dạng

                if (startDate >= endDate) {
                    alert("Ngày giờ bắt đầu phải trước ngày giờ kết thúc.");
                    return false;
                }
                if(startDate < formattedCurrentDateTime){
                    alert("Ngày giờ bắt đầu phải lớn hơn ngày giờ hiện tại.");
                    return false;
                }
                return true;
            }
        </script>
    </body>
</html>
