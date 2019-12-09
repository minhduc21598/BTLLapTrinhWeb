<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.User" %>
<%@page import="model.Shipment" %>
<%@page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Hóa đơn:...</title>
        <meta name="keywords" content="" />
        <meta name="description" content="" />
        <link href="css/home.css" rel="stylesheet" type="text/css" />
        <link href="css/ddsmoothmenu.css" rel="stylesheet" type="text/css" />
    </head>
    <body>

        <div id="templatemo_body_wrapper">
            <div id="templatemo_wrapper">
                <div id="templatemo_header">
                    <div id="site_title"><h1><a href="#">Shop Giày Online</a></h1></div>
                    <div id="header_right">
                        <% User user = (User) session.getAttribute("user");%>
                        <p>Xin chào, <%= user.getName()%></p>
                        <a href="editInforUser.jsp">Tài khoản</a> | 
                        <a href="ShowShoppingCart?idUser=<%= user.getId()%>">Giỏ hàng</a>  | 
                        <a href="LogOut">Đăng xuất</a>
                    </div>
                    <div class="cleaner"></div>
                </div> 
                <div id="templatemo_menubar">
                    <div id="top_nav" class="ddsmoothmenu">
                       <ul>
                            <li><a href="index.jsp" class="selected">Trang chủ</a></li>
                            <li><a href="#">Giới thiệu</a></li>
                            <li><a href="#">FAQs</a></li>
                            <li><a href="#">Liên hệ</a></li>
                        </ul>
                        <br style="clear: left" />
                    </div>
                    <div id="templatemo_search">
                        <form action="#" method="get">
                            <input type="text" value=" " name="keyword" id="keyword" title="keyword" onfocus="clearText(this)" onblur="clearText(this)" class="txt_field" />
                            <input type="submit" name="Search" value=" " alt="Search" id="searchbutton" title="Search" class="sub_btn"  />
                        </form>
                    </div>
                </div>

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
                        <h1>CHI TIẾT ĐƠN HÀNG</h1>
                        <table width="660px" cellspacing="0" cellpadding="5">
                            <tr bgcolor="#ddd">
                                <th width="220" align="left">Ảnh sản phẩm </th>
                                <th width="180" align="left">Tên sản phẩm</th>
                                <th width="100" align="left">Số lượng </th>
                                <th width="60" align="left">Giá </th>
                                <th width="60" align="left">Tổng tiền</th>
                            </tr>
                            <!--=====-->
                            <tr>
                                <td><img src="images/product/01.jpg" alt="image 1" /></td>
                                <td>Adidas xxx </td>
                                <td>                            
                                    <input type="text" id="quantity" value="1" style="width: 20px; text-align:center" readonly>                           
                                </td>
                                <td align="left">$100 </td>
                                <td align="left">$100 </td>
                            </tr>
                            <!--=====-->
                            <tr>
                                <td><img src="images/product/02.jpg" alt="image 2" /> </td>
                                <td>Converse xxx</td>
                                <td>
                                    <input type="text" id="quantity" value="1" style="width: 20px; text-align:center" readonly>  
                                </td>
                                <td align="left">$80 </td>
                                <td align="left">$80 </td>
                            </tr>
                            <!--======-->
                            <tr>
                                <td><img src="images/product/03.jpg" alt="image 3" /> </td>
                                <td>Adidas xyz</td>
                                <td>
                                    <input type="text" id="quantity" value="1" style="width: 20px; text-align:center" readonly>  
                                </td>
                                <td align="left">$60 </td>
                                <td align="left">$60 </td>
                            </tr>
                            <!--======-->
                        </table>
                        <div class="bill">
                            <p>Tổng tiền thanh toán: 250$</p>
                        </div>
                    </div>
                    <div class="cleaner"></div>
                </div> 
                <div id="templatemo_footer">
                    Copyright © 2019 <a href="#">D16 PTIT</a>
                </div>
            </div>
        </div>
    </body>

</html>