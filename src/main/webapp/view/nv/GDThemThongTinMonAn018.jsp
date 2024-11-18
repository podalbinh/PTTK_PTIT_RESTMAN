<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Thêm Thông Tin Món Ăn</title>
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
        .form-container {
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            width: 400px;
        }
        .form-container h2 {
            text-align: center;
            margin-bottom: 25px;
        }
        .form-container label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
        }
        .form-container input[type="text"],
        .form-container textarea,
        .form-container select {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
        }
        .form-container textarea {
            resize: vertical;
        }
        .form-container button {
            width: 48%;
            padding: 10px;
            margin: 5px 1%;
            background-color: #007bff;
            border: none;
            border-radius: 5px;
            color: white;
            font-size: 16px;
            cursor: pointer;
        }
        .form-container button:hover {
            background-color: #0056b3;
        }
        .form-container .back-button {
            background-color: #6c757d;
        }
        .form-container .back-button:hover {
            background-color: #5a6268;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Thêm Thông Tin Món Ăn</h2>
        <form action="doLuuMonAn018.jsp" method="post">
            <label name="labelTenMonAn" for="tenMonAn">Tên món ăn:</label>
            <input type="text" id="tenMonAn" name="inTenMonAn" required>
            
            <label name="labelGia" for="moTa">Mô tả:</label>
            <textarea id="moTa" name="inMoTa" rows="4"></textarea>
            
            <label name="labelGia" for="gia">Giá:</label>
            <input type="text" id="gia" name="inGia" required pattern="^\d+(\.\d{1,2})?$" title="Vui lòng nhập một số hợp lệ">
            
            <label name="labelXuatXu" for="xuatXu">Xuất xứ:</label>
            <input type="text" id="xuatXu" name="inXuatXu" required>
            
            <label name="labelLoaiMonAn" for="loaiMonAn">Loại món ăn:</label>
            <input type="text" id="loaiMonAn" name="inLoaiMonAn" required>
            
            <button type="submit">Lưu</button>
            <button type="button" class="back-button" onclick="location.href='GDQuanLyThongTinMonAn018.jsp'">Quay lại</button>
        </form>
    </div>
</body>
</html>