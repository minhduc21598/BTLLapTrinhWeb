
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.User" %>
<%@page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Chỉnh sửa thông tin</title>
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <link href="css/home.css" rel="stylesheet" type="text/css" />
    <link href="css/ddsmoothmenu.css" rel="stylesheet" type="text/css"  />
</head>

<script>
    <% String mess = (String) request.getAttribute("mess"); %>
    <% if (mess != null) {%>
    alert(`<%= mess%>`);
    <% }%>
</script>

<body>
    <div id="templatemo_body_wrapper">
        <div id="templatemo_wrapper">

            <div id="templatemo_header">
                <div id="site_title"><h1><a href="#">Online Shoes Store</a></h1></div>
                <div id="header_right">
                    <% User user = (User) session.getAttribute("user"); %>
                    <% if (user == null) { %>
                    <a href="loginForCustomer.jsp">Đăng nhập</a> |
                    <a href="editInforCustomer.jsp">Đăng ký</a>
                    <% } else {%>                     
                    <p>Xin chào, <%= user.getName()%></p>
                    <a href="editInforCustomer.jsp">Tài khoản</a> | 
                    <a href="ShowShoppingCart?idUser=<%= user.getId()%>">Giỏ hàng</a> | 
                    <a href="LogOut">Đăng xuất</a>
                    <% }%>
                </div>
                <div class="cleaner"></div>
            </div> <!-- END of templatemo_header -->

            <div id="templatemo_menubar">
                <div id="top_nav" class="ddsmoothmenu">
                    <ul>
                        <li><a href="index.html">Trang Chủ</a></li>
                        <li><a href="products.html">Sản Phẩm</a>
                            <!--  <ul>
                                 <li><a href="#submenu1">Sub menu 1</a></li>
                                 <li><a href="#submenu2">Sub menu 2</a></li>
                                 <li><a href="#submenu3">Sub menu 3</a></li>
                                 <li><a href="#submenu4">Sub menu 4</a></li>
                                 <li><a href="#submenu5">Sub menu 5</a></li>
                           </ul> -->
                        </li>
                        <li><a href="about.html">Giới Thiệu</a>
                            <!--  <ul>
                                 <li><a href="#submenu1">Sub menu 1</a></li>
                                 <li><a href="#submenu2">Sub menu 2</a></li>
                                 <li><a href="#submenu3">Sub menu 3</a></li>
                           </ul> -->
                        </li>
                        <li><a href="faqs.html">FAQ</a></li>
                        <!-- <li><a href="checkout.html">Checkout</a></li> -->
                        <li><a href="contact.html">Liên Hệ</a></li>
                    </ul>
                    <br style="clear: left" />
                </div> <!-- end of ddsmoothmenu -->
                <div id="templatemo_search">
                    <form action="#" method="get">
                        <input type="text" placeholder="Nhập sản phẩm cần tìm" value=" " name="keyword" id="keyword" title="keyword" onfocus="clearText(this)" onblur="clearText(this)" class="txt_field" />
                        <input type="submit" name="Search" value=" " alt="Search" id="searchbutton" title="Search" class="sub_btn"  />
                    </form>
                </div>
            </div> <!-- END of templatemo_menubar -->

            <div id="templatemo_main">
                <div id="sidebar" class="float_l">
                    <div class="sidebar_box"><span class="bottom"></span>
                        <h3>Danh mục sản phẩm</h3>   
                        <div class="content"> 
                            <ul class="sidebar_list">
                                <li class="first"><a href="#">Giày thể thao nam</a></li>
                                <li><a href="#">Giày sneaker nam</a></li>
                                <li><a href="#">Giày lười nam</a></li>
                                <li><a href="#">Giày tây nam</a></li>
                                <li><a href="#">Giày vải nam</a></li>
                                <li><a href="#">Giày boots nam</a></li>
                                <li><a href="#">Giày casual nam</a></li>
                                <li><a href="#">Giày thể thao nữ</a></li>
                                <li><a href="#">Giày sneaker nữ</a></li>
                                <li><a href="#">Giày lười nữ</a></li>
                                <li><a href="#">Giày cao gót</a></li>
                                <li><a href="#">Giày búp bê</a></li>
                                <li><a href="#">Giày đế xuồng nữ</a></li>
                                <li><a href="#">Giày boots nữ</a></li>
                                <li class="last"><a href="#">Giày sandals nữ</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div id="content" class="float_r">
                    <div>
                        <form class="box-edit-infor-customer" action="EditInforUser?action=<%= (user == null) ? "create" : "update"%>" method="post">
                            <h3>THÔNG TIN NGƯỜI DÙNG</h3>
                            <label for="">Họ và tên:</label>
                            <input type="text" name = "name" placeholder="Nhập họ và tên" value="<%= (user == null) ? "" : user.getName()%>">
                            <label for="">Địa chỉ:</label>
                            <input type="text" name = "address" placeholder="Nhập địa chỉ" value="<%= (user == null) ? "" : user.getAddress()%>">
                            <label for="">Ngày sinh:</label>
                            <input type="date" name = "date" value="<%= (user == null) ? "" : user.getDateofbirth()%>">
                            <label for="">Email:</label>
                            <input type="email" name = "email" placeholder="Nhập email" value="<%= (user == null) ? "" : ((user.getEmail() == null) ? "" : user.getEmail())%>">
                            <label for="">Số điện thoại:</label>
                            <input type="tel" name = "phone" placeholder="Nhập số điện thoại" value="<%= (user == null) ? "" : user.getPhonenum()%>">
                            <label for="">Tên người dùng:</label>
                            <% if (user == null) { %>
                            <input type="text" name = "username" placeholder="Nhập tên người dùng">
                            <% } else {%>
                            <input type="text" name = "username" placeholder="Nhập tên người dùng" value="<%= user.getAccount().getUsername()%>" readonly>
                            <% }%>
                            <label for="">Nhập password:</label> 
                            <input type="password" name = "pass" placeholder="Nhập password" value="<%= (user == null) ? "" : user.getAccount().getPassword()%>">
                            <input type="submit" name = "OK" value="<%= (user == null) ? "Tạo mới" : "Cập nhật"%>">
                        </form>
                    </div>
                </div>
                <div class="cleaner"></div>
            </div> <!-- END of templatemo_main -->

            <div id="templatemo_footer">
                <p><a href="#">Trang chủ</a> | <a href="#">Sản phẩm</a> | <a href="#">Giới thiệu</a> | <a href="#">FAQ</a> | <a href="#">Liên hệ</a>
                </p>
                Copyright © 2019 <a href="#">D16 PTIT</a>     
            </div> <!-- E   ND of templatemo_footer -->    
        </div> <!-- END of templatemo_wrapper -->
    </div> <!-- END of templatemo_body_wrapper -->

</body>
</html>

