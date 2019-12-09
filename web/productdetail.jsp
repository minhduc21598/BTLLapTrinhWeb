
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
            <div id="templatemo_menubar">
                <div id="top_nav" class="ddsmoothmenu">
                    <ul>
                        <li><a href="GetInitialData" class="selected">Trang chủ</a></li>

                        <li><a href="contact.html">Liên hệ</a></li>
                    </ul>
                    <br style="clear: left" />
                </div> 
                <div id="templatemo_search">
                    <form action="Search" method="post">
                        <input type="text" name="keyword" onfocus="clearText(this)" onblur="clearText(this)" class="txt_field" />
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
                    <h1>Chi tiết sản phẩm</h1>
                    <% Product product = (Product) request.getAttribute("product"); %>
                    <div class="content_half float_l">
                        <img src="<%= product.getListImage().get(0).getUrl() %>" alt="image" />
                    </div>
                    <div class="content_half float_r">
                        <table>
                            <tr>
                                <td>Tên sản phẩm:</td>
                                <td><%= product.getName()%></td>
                            </tr>
                            <tr>
                                <td>Giá:</td>
                                <td><%= product.getPrice()%> đ</td>
                            </tr>
                            <% if (product.getSale() > 0) {%>
                            <tr>
                                <td><%= -product.getSale()%>%</td>
                                <td><%= product.getPrice() * ((100 - product.getSale()) / 100)%> đ</td>
                            </tr>
                            <% }%>
                            <tr>
                                <td>Loại:</td>
                                <td><%= product.getType().getType()%></td>
                            </tr>
                            <tr>
                                <td>Hãng sản suất:</td>
                                <td><%= product.getManufacturer().getName()%></td>
                            </tr>
                            <tr>
                                <td>Trạng thái:</td>
                                <td><%= (product.getRemain() > 0) ? "Còn hàng" : "Hết hàng"%></td>
                            </tr>
                            <% if (product.getRemain() > 0) {%>
                            <tr>
                                <td>Số lượng:</td>
                                <td><%= product.getRemain()%></td>
                            </tr>
                            <% }%>
                        </table>
                        <div class="cleaner h20"></div>
                        <a href="shoppingcart.html" class="addtocart"></a>
                    </div>
                    <div class="cleaner h30"></div>

                    <h5>Mô tả sản phẩm</h5>
                    <p>Đế giày được thiết kế chịu ma sát tốt, tăng chiều cao, nhẹ, êm, cân bằng và thoáng khí. Kiểu dáng hottrend của năm nay.Có thể làm giày cặp, giày nhóm. Thích hợp đi chơi, chạy bộ, gym, đi học, đi làm... Có thể kết hợp với váy, jeans... Đều phù hợp. <!-- <a href="http://validator.w3.org/check?uri=referer" rel="nofollow">XHTML</a> &amp; <a href="http://jigsaw.w3.org/css-validator/check/referer" rel="nofollow">CSS</a>. --></p>	

                    <div class="cleaner h50"></div>
                    <h3>Sản phẩm tương tự</h3>
                    <% ArrayList<Product> relevantProduct = (ArrayList<Product>) request.getAttribute("relevantProduct");%>
                    <% for(int i = 0;i < relevantProduct.size();i++){ %>
                    <div class="product_box">
                        <% String url = relevantProduct.get(i).getListImage().get(0).getUrl(); %>
                        <a href="DetailProduct?idProduct=<%= relevantProduct.get(i).getId() %>"><img src="<%= url %>" alt="" /></a>
                        <h3><%= relevantProduct.get(i).getName()%></h3>
                        <p class="product_price"><%= relevantProduct.get(i).getPrice() %></p>
                        <a href="AddToCart?productId=<%= relevantProduct.get(i).getId()%>" class="addtocart"></a>
                        <a href="DetailProduct?idProduct=<%= relevantProduct.get(i).getId() %>" class="detail"></a>
                    </div> 
                    <% }%>
                    <div style="text-align: center;">
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
