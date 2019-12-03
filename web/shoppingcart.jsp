
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.User" %>
<%@page import="model.Shipment" %>
<%@page import="java.util.ArrayList" %>

<!DOCTYPE html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Giỏ hàng</title>
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <link href="css/home.css" rel="stylesheet" type="text/css" />
    <link href="css/ddsmoothmenu.css" rel="stylesheet" type="text/css" />
    <!-- <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/ddsmoothmenu.js">
    </script>
    <script type="text/javascript">   
    ddsmoothmenu.init({
            mainmenuid: "top_nav", //menu DIV id
            orientation: 'h', //Horizontal or vertical menu: Set to "h" or "v"
            classname: 'ddsmoothmenu', //class added to menu's outer DIV
            //customtheme: ["#1c5a80", "#18374a"],
            contentsource: "markup" //"markup" or ["container_id", "path_to_menu_file"]
    })
    </script> -->

</head>
<body>
    <div id="templatemo_body_wrapper">
        <div id="templatemo_wrapper">
            <div id="templatemo_header">
                <div id="site_title"><h1><a href="#">Online Shoes Store</a></h1></div>
                <div id="header_right">
                    <% User user = (User) session.getAttribute("user"); %>
                    <% if (user == null) { %>
                    <a href="loginForCustomer.jsp">Đăng nhập</a>
                    <% } else {%>                    
                    <p>Xin chào, <%= user.getName()%></p>
                    <a href="editInforCustomer.jsp">Tài khoản</a> | 
                    <a href="shoppingcart.jsp">Giỏ hàng</a> | 
                    <a href="LogOut?user=<%= user %>">Đăng xuất</a>
                    <% }%>
                    <p>
                        Giỏ hàng hiện tại: <strong>3 sản phẩm</strong> ( <a href="shoppingcart.jsp">Xem giỏ</a> )
                    </p>
                </div>
                <div class="cleaner"></div>
            </div> 
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
                            <td><img src="images/product/02.jpg" alt="image 2" /> </td>
                            <td><%= list.get(i).getProduct().getName()%></td> 
                            <td align="center">
                                <input type="text" value="<%= list.get(i).getQuantity()%>" style="width: 20px; text-align: right" />  
                            </td>
                            <td align="right"><%= list.get(i).getProduct().getPrice()%>  </td>
                            <td align="right"><%= list.get(i).getTotal()%> </td>
                            <td align="center"> <a href="#"><img src="images/remove_x.gif" alt="remove" /><br />Hủy</a>  </td>
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
                <p><a href="#">Trang chủ</a> | <a href="#">Sản phẩm</a> | <a href="#">Giới thiệu</a> | <a href="#">FAQ</a> | <a href="#">Liên hệ</a>
                </p>
                Copyright © 2019 <a href="#">D16 PTIT</a>
            </div> 
        </div> 
    </div> 
</body>
</html>