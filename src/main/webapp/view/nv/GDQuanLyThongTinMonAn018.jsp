<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Quản lý thông tin món ăn</title>
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
        .container {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
            text-align: center;
        }
        .container button {
            width: 100%;
            padding: 12px;
            margin: 8px 0;
            background-color: #6c757d; /* Màu xám cho các nút */
            border: none;
            border-radius: 6px;
            color: white;
            font-size: 18px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .container button:hover {
            background-color: #5a6268; /* Màu xám đậm hơn khi hover */
        }
        .container .main-button {
            background-color: #007bff; /* Màu xanh cho nút Quản lý thông tin */
        }
        .container .main-button:hover {
            background-color: #007bff; /* Màu xanh đậm hơn khi hover */
        }
        .container .back-button {
            font-size: 16px; /* Nhỏ hơn nút Quản lý thông tin */
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Quản lý thông tin món ăn</h2>
        <button class="main-button" onclick="location.href='GDThemThongTinMonAn018.jsp'">Thêm thông tin món ăn</button>
        <button class="main-button" onclick="location.href='SuaThongTinMonAn.jsp'">Sửa thông tin món ăn</button>
        <button class="main-button" onclick="location.href='XoaThongTinMonAn.jsp'">Xóa thông tin món ăn</button>
        <button type="button" class="back-button" onclick="location.href='GDChinhNV018.jsp'">Quay lại</button>
    </div>
</body>
</html>