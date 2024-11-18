<%@ page import="dao.MonAnDAO018" %>
<%@ page import="   models.MonAn018" %>
<%@ page import="java.sql.SQLException" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Lưu Món Ăn</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        h3 {
            color: #4CAF50;
        }
        a {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 15px;
            background-color: #008CBA;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }
        a:hover {
            background-color: #005f73;
        }
        .success {
            color: green; /* Color for success messages */
        }
        .error {
            color: red; /* Color for error messages */
        }
        .container {
            max-width: 600px; /* Set a max width for better layout */
            margin: 0 auto; /* Center the container */
            padding: 20px; /* Add some padding */
            text-align: center; /* Center text */
            border: 1px solid #ccc; /* Optional: Add a border */
            border-radius: 5px; /* Optional: Rounded corners */
        }
    </style>
</head>
<body>
    <div class="container">
        <%
             request.setCharacterEncoding("UTF-8");
            MonAn018 monan = new MonAn018();
            monan.setTen(request.getParameter("inTenMonAn"));
            monan.setMoTa(request.getParameter("inMoTa"));
            monan.setGia(Double.parseDouble(request.getParameter("inGia")));
            monan.setLoai(request.getParameter("inLoaiMonAn"));
            monan.setXuatXu(request.getParameter("inXuatXu"));

            // Gọi phương thức lưu món ăn
            boolean result = (new MonAnDAO018()).luuMonAn(monan);
            if (result) {
                out.println("<h3 name='hThongBao'class='success'>Lưu món ăn thành công!</h3>");
            } else {
                out.println("<h3 name='hThongBao' class='error'>Lưu món ăn thất bại!</h3>");
            }
        %>
        <a name="btnTroLai"href="GDChinhNV018.jsp">Trở lại</a>
    </div>
</body>
</html>