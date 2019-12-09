
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.User" %>
<%@page import="java.util.ArrayList" %>
<%@page import="model.Type" %>
<%@page import="model.Manufacturer" %>
<%@page import="model.Product" %>
<!DOCTYPE html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Chi tiết sản phẩm:...</title>
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <link href="home.css" rel="stylesheet" type="text/css" />
    <link href="css/ddsmoothmenu.css" rel="stylesheet" type="text/css"  />

</head>
<body>
    <div id="templatemo_body_wrapper">
        <div id="templatemo_wrapper">
            <div id="templatemo_header">
                <div id="site_title"><h1><a href="#">Online Shoes Store</a></h1></div>
                <div id="header_right">
                        <% User user = (User) session.getAttribute("user"); %>
                        <% if (user == null) { %>
                        <a href="login.jsp">Đăng nhập</a> |
                        <a href="editInforUser.jsp">Đăng ký</a>
                        <% } else {%>                     
                        <p>Xin chào, <%= user.getName()%></p>
                        <a href="editInforUser.jsp">Tài khoản</a> | 
                        <a href="ShowShoppingCart">Giỏ hàng</a> |
                        <a href="ShowShipment">Đơn hàng</a> |
                        <a href="LogOut">Đăng xuất</a>
                        <% }%>

                    </div>
                <div class="cleaner"></div>
            </div> 
            <!-- END of templatemo_header -->
            <div id="templatemo_menubar">
                <div id="top_nav" class="ddsmoothmenu">
                   <ul>
                        <li><a href="GetInitialData" class="selected">Trang chủ</a></li>
                            <li><a href="about.html">Giới thiệu</a>
                            </li>
                            <li><a href="faqs.html">FAQs</a></li>
                            <li><a href="contact.html">Liên hệ</a></li>
                        </ul>
                    <br style="clear: left" />
                </div> 
                <!-- end of ddsmoothmenu -->
                <div id="templatemo_search">
                        <form action="Search" method="post">
                            <input type="text" name="keyword" onfocus="clearText(this)" onblur="clearText(this)" class="txt_field" />
                            <input type="submit" name="Search" value=" " alt="Search" id="searchbutton" title="Search" class="sub_btn"  />
                        </form>
                    </div>
            </div> 
            <!-- END of templatemo_menubar -->
            <div id="templatemo_main">
                <div id="sidebar" class="float_l">
                    <div class="sidebar_box"><span class="bottom"></span>
                        <h3>DANH MỤC SẢN PHẨM</h3>   
                        <div class="content">
                            <ul class="sidebar_list">
                                <li><a href="#">Giày thể thao nam</a></li>
                                <li><a href="#">Giày sneaker nam</a></li>
                                <li><a href="#">Giày lười nam</a></li>         
                                <li><a href="#">Giày thể thao nữ</a></li>
                                <li><a href="#">Giày sneaker nữ</a></li>
                                <li><a href="#">Giày cao gót</a></li>
                                <li><a href="#">Giày búp bê</a></li>
                                <li class="last"><a href="#">Giày sandals nữ</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div id="content" class="float_r">
                    <h1>Chi tiết sản phẩm</h1>
                    <div class="content_half float_l">
                        <a  rel="lightbox[portfolio]" href="images/product/10_l.jpg"><img src="images/product/10.jpg" alt="image" /></a>
                    </div>
                    <div class="content_half float_r">
                        <table>
                            <tr>
                                <td width="160">Giá:</td>
                                <td>$100</td>
                            </tr>
                            <tr>
                                <td>Trạng thái:</td>
                                <td>Còn hàng</td>
                            </tr>
                            <tr>
                                <td>Mã sản phẩm:</td>
                                <td>N123</td>
                            </tr>
                            <tr>
                                <td>Giới tính:</td>
                                <td>Nữ</td>
                            </tr>
                            <tr>
                                <td>Hãng sản suất:</td>
                                <td>Nike</td>
                            </tr>
                            <tr>
                                <td>Số lượng:</td>
                                <td><input type="text" value="1" style="width: 20px; text-align: right" /></td>
                            </tr>
                        </table>
                        <div class="cleaner h20"></div>
                        <a href="shoppingcart.html" class="addtocart"></a>
                    </div>
                    <div class="cleaner h30"></div>

                    <h5>Mô tả sản phẩm</h5>
                    <p>Đế giày được thiết kế chịu ma sát tốt, tăng chiều cao, nhẹ, êm, cân bằng và thoáng khí. Kiểu dáng hottrend của năm nay.Có thể làm giày cặp, giày nhóm. Thích hợp đi chơi, chạy bộ, gym, đi học, đi làm... Có thể kết hợp với váy, jeans... Đều phù hợp. <!-- <a href="http://validator.w3.org/check?uri=referer" rel="nofollow">XHTML</a> &amp; <a href="http://jigsaw.w3.org/css-validator/check/referer" rel="nofollow">CSS</a>. --></p>	

                    <div class="cleaner h50"></div>  
                    <div>
                        <p> <a href="index.jsp">Tiếp tục mua hàng</a></p>
                    </div>
                </div> 
                <div class="cleaner"></div>
            </div> 
             <div id="templatemo_footer">
                Copyright © 20119 <a href="#">D16PTIT</a>
            </div>
        </div> 
    </div> 
</body>
</html>