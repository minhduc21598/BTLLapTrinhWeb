<%-- 
    Document   : addProduct
    Author     : ngoqu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Trang chủ quản trị</title>
        <meta name="keywords" content="" />
        <meta name="description" content="" />
        <link href="css/home.css" rel="stylesheet" type="text/css" />

        <link rel="stylesheet" href="css/nivo-slider.css" type="text/css" media="screen" />

        <link  href="css/ddsmoothmenu.css"  rel="stylesheet" type="text/css" />

        <script>
        <% String mess = (String) request.getAttribute("mess"); %>
        <% if (mess != null) {%>
        alert(`<%= mess%>`);
        <% }%>
    </script>
    </head>
    <body>
        <div id="templatemo_body_wrapper">
            <div id="templatemo_wrapper">

                <div id="templatemo_header">
                    <div id="site_title"><h1><a href="#">Online Shoes Store</a></h1></div>
                    <div id="header_right">
                                         
                        <p>Xin chào, Admin</p>
                        <a href="index.jsp">Đăng xuất</a>
                    </div>
                    <div class="cleaner"></div>
                </div>

                <div id="templatemo_menubar">
                    <div id="top_nav" class="ddsmoothmenu">
                        <ul>
                            <li><a href="adminHome.jsp" >Danh sách sản phẩm</a></li>
                            <li><a href="addProducts.jsp" class="selected">Thêm sản phẩm</a>
                        </ul>
                    </div>  
                </div> 

                <div id="templatemo_main">
                    <div>
                        <form class="box-edit-infor-customer" method="post">
                            <h3>THÊM THÔNG TIN SẢN PHẨM</h3>
                            <label>Tên Sản Phẩm:</label>
                            <input type="text" name = "tenSP" placeholder="Nhập tên sản phẩm" >
                            <label>Giá bán:</label>
                            <input type="text" name = "giaBan" placeholder="Nhập giá bán" >
                            <label>Giá nhập:</label>
                            <input type="text" name = "giaNhap" placeholder="Nhập giá nhập hàng" >
                            <label>Khuyến mại:</label>
                            <input type="text" name = "khuyenMai" placeholder="Nhập % khuyến mại" >
                            <label>Tồn kho:</label>
                            <input type="text" name = "tonKho" placeholder="Nhập số lượng còn lại trong kho" >
                            <label>Nhập số lượng bán:</label>
                            <input type="text" name = "name" placeholder="Nhập số lượng sản phẩm bán" >
                            <label>Đặc điểm sản phẩm:</label>
                            <input type="radio" name = "featured" value="1" > Hot
                            <input type="radio" name = "featured" value="2" > Bán chạy
                            </br>
                            <label>Nhà cung cấp</label>
                            <select>
                                <option value="1">Converse</option>
                                <option value="2">Adidas</option>
                                <option value="3">Nike</option>
                                <option value="4">Bitis</option>
                                <option value="5">Gucci</option>
                            </select>
                            </br>
                            <label>Loại</label>
                            <select>
                                <option value="1">Giày thể thao nam</option>
                                <option value="2">Giày sneaker nam</option>
                                <option value="3">Giày lười nam</option>
                                <option value="4">Giày tây nam</option>
                                <option value="5">Giày vải nam</option>
                                <option value="6">Giày boots nam</option>
                                <option value="7">Giày casual nam</option>
                                <option value="8">Giày thể thao nữ</option>
                                <option value="9">Giày sneaker nữ</option>
                                <option value="10">Giày lười nữ</option>
                                <option value="11">Giày cao gót</option>
                                <option value="12">Giày búp bê</option>
                                <option value="13">Giày đế xuồng nữ</option>
                                <option value="14">Giày boots nữ</option>
                                <option value="15">Giày sandals nữ</option>
                            </select>



                            <input type="submit" name = "OK">
                           
                        </form>
                    </div>
                </div>                  

                <div id="templatemo_footer">
                    Copyright © 2019 <a href="#">D16PTIT</a></div> 
            </div>
        </div> 
    </body>
</html>

