<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Product" %>
<%@page import="model.User" %>
<%@page import="model.Manufacturer" %>
<%@page import="model.Type" %>
<%@page import="java.util.ArrayList" %>>
<!DOCTYPE html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Chi tiết sản phẩm</title>
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <link href="css/home.css" rel="stylesheet" type="text/css" />
    <link href="css/ddsmoothmenu.css" rel="stylesheet" type="text/css"  />
    <!--     <script type="text/javascript" src="js/jquery.min.js"></script>
        <script type="text/javascript" src="js/ddsmoothmenu.js"> 
         </script> 
         <script type="text/javascript">
        // ddsmoothmenu.init({
        // 	mainmenuid: "top_nav", //menu DIV id
        // 	orientation: 'h', //Horizontal or vertical menu: Set to "h" or "v"
        // 	classname: 'ddsmoothmenu', //class added to menu's outer DIV
        // 	//customtheme: ["#1c5a80", "#18374a"],
        // 	contentsource: "markup" //"markup" or ["container_id", "path_to_menu_file"]
        // })
        </script> 
         <script type="text/javascript" src="js/jquery-1-4-2.min.js"></script>  
         <link rel="stylesheet" href="css/slimbox2.css" type="text/css" media="screen" />  
         <script type="text/JavaScript" src="js/slimbox2.js"></script>  -->

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
                </div> 
                <!-- end of ddsmoothmenu -->
                <div id="templatemo_search">
                    <form action="#" method="get">
                        <input type="text" placeholder="Nhập sản phẩm cần tìm" value=" " name="keyword" id="keyword" title="keyword" onfocus="clearText(this)" onblur="clearText(this)" class="txt_field" />
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
                    <h1>Chi tiết sản phẩm</h1>
                    <div class="content_half float_l">
                        <img src="images/product/10.jpg" alt="image" />
                    </div>
                    <div class="content_half float_r">
                        <% Product product = (Product) request.getAttribute("product");%>
                        <table>
                            <tr>
                                <td>Tên sản phẩm:</td>
                                <td><%= product.getName() %></td>
                            </tr>
                            <tr>
                                <td width="160">Giá:</td>
                                <td><%= product.getPrice()%></td>
                            </tr>
                            <tr>
                                <td>Loại sản phẩm:</td>
                                <td><%= product.getType().getType()%></td>
                            </tr>
                            <tr>
                                <td>Hãng sản suất:</td>
                                <td><%= product.getManufacturer().getName()%></td>
                            </tr>
                            <tr>
                                <td>Trạng thái:</td>
                                <td>
                                    <%= (product.getRemain() > 0) ? "Còn hàng" : "Hết hàng"%>
                                </td>
                            </tr>
                            <% if(product.getRemain() > 0){ %>
                            <tr>
                                <td>Số lượng:</td>
                                <td><%= product.getRemain() %></td>
                            </tr>
                            <% } %>
                        </table>
                        <div class="cleaner h20"></div>
                        <a href="AddToCart?productId=<%= product.getId()%>" class="addtocart"></a>
                    </div>
                    <div class="cleaner h30"></div>

                    <h5>Mô tả sản phẩm</h5>
                    <p>Đế giày được thiết kế chịu ma sát tốt, tăng chiều cao, nhẹ, êm, cân bằng và thoáng khí. Kiểu dáng hottrend của năm nay.Có thể làm giày cặp, giày nhóm. Thích hợp đi chơi, chạy bộ, gym, đi học, đi làm... Có thể kết hợp với váy, jeans... Đều phù hợp. <!-- <a href="http://validator.w3.org/check?uri=referer" rel="nofollow">XHTML</a> &amp; <a href="http://jigsaw.w3.org/css-validator/check/referer" rel="nofollow">CSS</a>. --></p>	

                    <div class="cleaner h50"></div>

                    <h3>Sản phẩm liên quan</h3>
                    <% ArrayList<Product> relevantProduct = (ArrayList<Product>) request.getAttribute("relevantProduct"); %>
                    <% for (Product p : relevantProduct) {%>
                    <div class="product_box">
                        <a href="DetailProduct?idProduct=<%= p.getId()%>"><img src="images/product/01.jpg" alt="" /></a>
                        <h3><%= p.getName()%></h3>
                        <p class="product_price"><%= p.getPrice()%> đ</p>
                        <% if (user == null) { %>
                        <a href="login.jsp" class="addtocart"></a>
                        <% } else {%>
                        <a href="AddToCart?productId=<%= p.getId()%>" class="addtocart"></a>
                        <% }%>
                        <a href="DetailProduct?idProduct=<%= p.getId()%>" class="detail"></a>
                    </div> 
                    <% }%>
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