<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.User" %>
<%@page import="model.Shipment" %>
<%@page import="model.Type" %>
<%@page import="model.Manufacturer" %>
<%@page import="java.util.ArrayList" %>

<!DOCTYPE html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Giỏ hàng</title>
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <link href="css/home.css" rel="stylesheet" type="text/css" />
    <link href="css/ddsmoothmenu.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <div id="templatemo_body_wrapper">
        <div id="templatemo_wrapper">
            <div id="templatemo_header">
                <div id="site_title"><h1><a href="#">Online Shoes Store</a></h1></div>
                <div id="header_right">
                    <% User user = (User) session.getAttribute("user");%>
                    <p>Xin chào, <%= user.getName()%></p>
                    <a href="editInforUser.jsp">Tài khoản</a> | 
                    <a href="ShowShoppingCart">Giỏ hàng</a>  |
                    <a href="ShowShipment">Đơn hàng</a> |
                    <a href="LogOut">Đăng xuất</a>
                </div>
                <div class="cleaner"></div>
            </div> 
            <div id="templatemo_menubar">
                <div id="top_nav" class="ddsmoothmenu">
                    <ul>
                        <li><a href="GetInitialData">Trang Chủ</a></li>
                        <li><a href="products.html">Sản Phẩm</a>
                        </li>
                        <li><a href="about.html">Giới Thiệu</a>
                        </li>
                        <li><a href="faqs.html">FAQ</a></li>
                        <li><a href="contact.html">Liên Hệ</a></li>
                    </ul>
                    <br style="clear: left" />
                </div> 
                <div id="templatemo_search">
                    <form action="#" method="get">
                        <input type="text" placeholder="Nhập sản phẩm cần tìm" value=" " name="keyword" id="keyword" title="keyword" onfocus="clearText(this)" onblur="clearText(this)" class="txt_field" />
                        <input type="submit" name="Search" value=" " alt="Search" id="searchbutton" title="Search" class="sub_btn"  />
                    </form>
                </div>
            </div> 
            <div id="templatemo_main">
                <div id="sidebar" class="float_l">
                    <div class="sidebar_box"><span class="bottom"></span>
                        <h3>DANH MỤC SẢN PHẨM</h3>   
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
                    <h1>Giỏ hàng</h1>
                    <table width="680px" cellspacing="0" cellpadding="5">
                        <tr bgcolor="#ddd">
                            <th width="220" align="left">Ảnh sản phẩm </th> 
                            <th width="180" align="left">Mô tả</th> 
                            <th width="100" align="center">Số lượng </th> 
                            <th width="60" align="right">Giá </th> 
                            <th width="60" align="right">Tổng tiền</th> 
                            <th width="90"> </th>
                        </tr>
                        <% ArrayList<Shipment> list = (ArrayList<Shipment>) request.getAttribute("list"); %>
                        <% for (int i = 0; i < list.size(); i++) {%>
                        <tr>
                            <td><a href="DetailProduct?idProduct=<%= list.get(i).getProduct().getId() %>"><img src="images/product/02.jpg" alt="image 2" /></a></td>
                            <td><%= list.get(i).getProduct().getName()%></td> 
                            <td align="center">
                                <input type="text" value="<%= list.get(i).getQuantity()%>" style="width: 20px; text-align: right" />  
                            </td>
                            <td align="right"><%= list.get(i).getProduct().getPrice()%>  </td>
                            <td align="right"><%= list.get(i).getTotal()%> </td>
                            <td align="center"> 
                                <a href="RemoveFromCart?idShipment=<%= list.get(i).getId()%>"><img src="images/remove_x.gif" alt="remove" /><br />Hủy</a>  
                            </td>
                        </tr>
                        <% }%>
                    </table>
                    <div style="float:right; width: 215px; margin-top: 20px;">
                        <p><a href="javascript:history.back()">Tiếp tục mua sắm</a></p>
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