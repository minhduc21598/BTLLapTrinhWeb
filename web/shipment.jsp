<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.User" %>
<%@page import="model.Shipment" %>
<%@page import="model.Type" %>
<%@page import="model.Manufacturer" %>
<%@page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Hóa đơn:...</title>
        <meta name="keywords" content="" />
        <meta name="description" content="" />
        <link href="home.css" rel="stylesheet" type="text/css" />
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
                        <a href="ShowShipment">Đơn hàng</a> |
                        <a href="LogOut">Đăng xuất</a>
                    </div>
                    <div class="cleaner"></div>
                </div> 
                <div id="templatemo_menubar">
                    <div id="top_nav" class="ddsmoothmenu">
                        <ul>
                            <li><a href="GetInitialData" class="selected">Trang chủ</a></li>
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
                                    <% ArrayList<Type> listType = (ArrayList<Type>) request.getAttribute("listType");  %>
                                    <% for (int i = 0; i < listType.size(); i++) {%>
                                    <li><a href="Filter?type=<%= listType.get(i).getType()%>"><%= listType.get(i).getType()%></a></li>
                                        <% }%>
                                </ul>
                            </div>
                        </div>
                        <div class="sidebar_box"><span class="bottom"></span>
                            <h3>LỌC SẢN PHẨM</h3>
                            <div class="filter">
                                <div class="filter-hang">
                                    <span>CHỌN HÃNG SẢN XUẤT</span> <br>
                                    <ul>
                                        <% ArrayList<Manufacturer> listManu = (ArrayList<Manufacturer>) request.getAttribute("listManu");  %>
                                        <% for (int i = 0; i < listManu.size(); i++) {%>
                                        <li>
                                            <a>
                                                <label><input type="radio" onclick="location = 'Filter?manufacturer=<%= listManu.get(i).getName()%>'"><%= listManu.get(i).getName()%></label>
                                            </a>
                                        </li>
                                        <% }%>
                                    </ul>
                                </div>
                                <div class="filter-gia">
                                    <span>CHỌN MỨC GIÁ</span> <br>
                                    <ul>
                                        <li>
                                            <a><label><input type="radio" onclick="location = 'Filter?priceRange=1'">Dưới 1 triệu</label></a>
                                        </li>
                                        <li>
                                            <a><label><input type="radio" onclick="location = 'Filter?priceRange=2'">Từ 1-2 triệu</label></a>
                                        </li>
                                        <li>
                                            <a><label><input type="radio" onclick="location = 'Filter?priceRange=3'">Trên 2 triệu</label></a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="content" class="float_r">
                        <h2>Chi tiết đơn hàng</h2>
                        <table width="660px" cellspacing="0" cellpadding="5">
                            <tr bgcolor="#ddd">
                                <th width="220" align="left">Ảnh sản phẩm </th>
                                <th width="180" align="left">Tên sản phẩm</th>
                                <th width="100" align="left">Số lượng </th>
                                <th width="60" align="left">Giá </th>
                                <th width="60" align="left">Tổng tiền</th>
                            </tr>
                            <% double totalCost = 0; %>
                            <% ArrayList<Shipment> listShipment = (ArrayList<Shipment>) request.getAttribute("listShipment"); %>
                            <% for (int i = 0; i < listShipment.size(); i++) {%>
                            <tr>
                                <td><img src="<%= listShipment.get(i).getProduct().getListImage().get(0).getUrl()%>" alt="image 1" /></td>
                                <td><%= listShipment.get(i).getProduct().getName()%></td>
                                <td>                            
                                    <input type="text" id="quantity" value="<%= listShipment.get(i).getQuantity()%>" style="width: 20px; text-align:center" readonly>                           
                                </td>
                                <td align="left"><%= listShipment.get(i).getProduct().getPrice()%></td>
                                <td align="left"><%= listShipment.get(i).getTotal()%></td>
                                <td align="center"> 
                                    <a href="RemoveFromCart?idShipment=<%= listShipment.get(i).getId()%>"><img src="images/remove_x.gif" alt="remove" /><br />Hủy</a>  
                                </td>
                                <% totalCost += listShipment.get(i).getTotal(); %>
                            </tr>
                            <% }%>
                        </table>
                        <div class="bill">
                            <% if(totalCost != 0){ %>
                            <p>Tổng tiền thanh toán: <%= totalCost%></p>
                            <% } else {%>
                            <p>Không có đơn hàng nào !</p>
                            <% } %>
                        </div>
                        <br>
                        <br>
                        <div>
                            <p style="float: right; margin-right: 60px;"><a href = "GetInitialData">Tiếp tục mua sắm</a></p>
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