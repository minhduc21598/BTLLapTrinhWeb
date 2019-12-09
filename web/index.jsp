<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.User" %>
<%@page import="java.util.ArrayList" %>
<%@page import="model.Type" %>
<%@page import="model.Manufacturer" %>
<%@page import="model.Product" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Trang chủ</title>
        <meta name="keywords" content="" />
        <meta name="description" content="" />
        <link href="css/home.css" rel="stylesheet" type="text/css" />
        <link  href="css/ddsmoothmenu.css"  rel="stylesheet" type="text/css" />
    </head>

    <script>
        <% String mess = (String) request.getAttribute("mess"); %>
        <% if (mess != null) {%>
        alert(`<%= mess%>`);
        <% request.removeAttribute("mess"); %>
        <% }%>
    </script>

    <body>
        <div id="templatemo_body_wrapper">
            <div id="templatemo_wrapper">

                <div id="templatemo_header">
                    <div id="site_title"><h1><a href="#">Giày Online</a></h1></div>
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
                            <li><a href="#">Sản phẩm</a></li>
                            <li><a href="#">Giới thiệu</a></li>
                            <li><a href="#">FAQs</a></li>
                            <li><a href="#">Liên hệ</a></li>
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
                        <div class="box-sort">
                            <span>Sắp xếp theo:</span>
                            <select onchange="location = this.value;">
                                <option>---Sắp xếp theo---</option>
                                <option value="Sort?sortType=increase">Giá tăng dần</option>
                                <option value="Sort?sortType=decrease">Giá giảm dần</option>
                            </select>
                        </div>
                        <h2>Sản phẩm bán chạy</h2>
                        <div class="best-seller">
                            <div class="best-seller-scroll">
                                <div class="product_box">
                                    <h3>Tên sản phẩm</h3>
                                    <a href="productdetail.html"><img src="images/product/01.jpg" alt="Shoes 1" /></a>
                                    <table>
                                        <tr>
                                            <td><span class="product_status">Còn hàng</span></td>
                                            <td><span class="product_price">2000000đ</span></td>
                                        </tr>
                                        <tr>
                                            <td><span class="product_status_sale">-10%</span></td>
                                            <td><span class="product_price_sale">1800000đ</span></td>
                                        </tr>
                                        <tr>
                                            <td><a href="shoppingcart.html" class="addtocart"></a></td>
                                            <td><a href="productdetail.html" class="detail"></a></td>
                                        </tr>
                                    </table>
                                </div>
                                <!--===========-->
                                <div class="product_box">
                                    <h3>Tên sản phẩm</h3>
                                    <a href="productdetail.html"><img src="images/product/01.jpg" alt="Shoes 2" /></a>
                                    <table>
                                        <tr>
                                            <td><span class="product_status">Còn hàng</span></td>
                                            <td><span class="product_price">2000000đ</span></td>
                                        </tr>
                                        <tr>
                                            <td><span class="product_status_sale">-10%</span></td>
                                            <td><span class="product_price_sale">1800000đ</span></td>
                                        </tr>
                                        <tr>
                                            <td><a href="shoppingcart.html" class="addtocart"></a></td>
                                            <td><a href="productdetail.html" class="detail"></a></td>
                                        </tr>
                                    </table>
                                </div>
                                <!--==================-->
                                <div class="product_box">
                                    <h3>Tên sản phẩm</h3>
                                    <a href="productdetail.html"><img src="images/product/01.jpg" alt="Shoes 3" /></a>
                                    <table>
                                        <tr>
                                            <td><span class="product_status">Còn hàng</span></td>
                                            <td><span class="product_price">2000000đ</span></td>
                                        </tr>
                                        <tr>
                                            <td><span class="product_status_sale">-10%</span></td>
                                            <td><span class="product_price_sale">1800000đ</span></td>
                                        </tr>
                                        <tr>
                                            <td><a href="shoppingcart.html" class="addtocart"></a></td>
                                            <td><a href="productdetail.html" class="detail"></a></td>
                                        </tr>
                                    </table>
                                </div>
                                <!--=====================-->
                                <div class="product_box">
                                    <h3>Tên sản phẩm</h3>
                                    <a href="productdetail.html"><img src="images/product/01.jpg" alt="Shoes 4" /></a>
                                    <table>
                                        <tr>
                                            <td><span class="product_status">Còn hàng</span></td>
                                            <td><span class="product_price">2000000đ</span></td>
                                        </tr>
                                        <tr>
                                            <td><span class="product_status_sale">-10%</span></td>
                                            <td><span class="product_price_sale">1800000đ</span></td>
                                        </tr>
                                        <tr>
                                            <td><a href="shoppingcart.html" class="addtocart"></a></td>
                                            <td><a href="productdetail.html" class="detail"></a></td>
                                        </tr>
                                    </table>
                                </div>
                                <!--=================-->
                                <div class="product_box">
                                    <h3>Tên sản phẩm</h3>
                                    <a href="productdetail.html"><img src="images/product/01.jpg" alt="Shoes 4" /></a>
                                    <table>
                                        <tr>
                                            <td><span class="product_status">Còn hàng</span></td>
                                            <td><span class="product_price">2000000đ</span></td>
                                        </tr>
                                        <tr>
                                            <td><span class="product_status_sale">-10%</span></td>
                                            <td><span class="product_price_sale">1800000đ</span></td>
                                        </tr>
                                        <tr>
                                            <td><a href="shoppingcart.html" class="addtocart"></a></td>
                                            <td><a href="productdetail.html" class="detail"></a></td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <!--//////////////////////-->
                        <h2>Sản phẩm mới</h2>
                        <div class="product_box">
                            <h3>Tên sản phẩm</h3>
                            <a href="productdetail.html"><img src="images/product/03.jpg" alt="Shoes 1" /></a>
                            <table>
                                <tr>
                                    <td><span class="product_status">Còn hàng</span></td>
                                    <td><span class="product_price">2000000đ</span></td>
                                </tr>
                                <tr>
                                    <td><span class="product_status_sale">-10%</span></td>
                                    <td><span class="product_price_sale">1800000đ</span></td>
                                </tr>
                                <tr>
                                    <td><a href="shoppingcart.html" class="addtocart"></a></td>
                                    <td><a href="productdetail.html" class="detail"></a></td>
                                </tr>
                            </table>
                        </div>
                        <!--=============-->
                        <div class="product_box">
                            <h3>Tên sản phẩm</h3>
                            <a href="productdetail.html"><img src="images/product/03.jpg" alt="Shoes 2" /></a>
                            <table>
                                <tr>
                                    <td><span class="product_status">Còn hàng</span></td>
                                    <td><span class="product_price">2000000đ</span></td>
                                </tr>
                                <tr>
                                    <td><span class="product_status_sale">-10%</span></td>
                                    <td><span class="product_price_sale">1800000đ</span></td>
                                </tr>
                                <tr>
                                    <td><a href="shoppingcart.html" class="addtocart"></a></td>
                                    <td><a href="productdetail.html" class="detail"></a></td>
                                </tr>
                            </table>
                        </div>
                        <!--=============-->
                        <div class="product_box">
                            <h3>Tên sản phẩm</h3>
                            <a href="productdetail.html"><img src="images/product/03.jpg" alt="Shoes 3" /></a>
                            <table>
                                <tr>
                                    <td><span class="product_status">Còn hàng</span></td>
                                    <td><span class="product_price">2000000đ</span></td>
                                </tr>
                                <tr>
                                    <td><span class="product_status_sale">-10%</span></td>
                                    <td><span class="product_price_sale">1800000đ</span></td>
                                </tr>
                                <tr>
                                    <td><a href="shoppingcart.html" class="addtocart"></a></td>
                                    <td><a href="productdetail.html" class="detail"></a></td>
                                </tr>
                            </table>
                        </div>
                        <!--================-->        
                        <div class="product_box">
                            <h3>Tên sản phẩm</h3>
                            <a href="productdetail.html"><img src="images/product/03.jpg" alt="Shoes 1" /></a>
                            <table>
                                <tr>
                                    <td><span class="product_status">Còn hàng</span></td>
                                    <td><span class="product_price">2000000đ</span></td>
                                </tr>
                                <tr>
                                    <td><span class="product_status_sale">-10%</span></td>
                                    <td><span class="product_price_sale">1800000đ</span></td>
                                </tr>
                                <tr>
                                    <td><a href="shoppingcart.html" class="addtocart"></a></td>
                                    <td><a href="productdetail.html" class="detail"></a></td>
                                </tr>
                            </table>
                        </div>
                        <!--===============-->
                        <div class="product_box">
                            <h3>Tên sản phẩm</h3>
                            <a href="productdetail.html"><img src="images/product/03.jpg" alt="Shoes 5" /></a>
                            <table>
                                <tr>
                                    <td><span class="product_status">Còn hàng</span></td>
                                    <td><span class="product_price">2000000đ</span></td>
                                </tr>
                                <tr>
                                    <td><span class="product_status_sale">-10%</span></td>
                                    <td><span class="product_price_sale">1800000đ</span></td>
                                </tr>
                                <tr>
                                    <td><a href="shoppingcart.html" class="addtocart"></a></td>
                                    <td><a href="productdetail.html" class="detail"></a></td>
                                </tr>
                            </table>
                        </div>
                        <div class="product_box">
                            <h3>Tên sản phẩm</h3>
                            <a href="productdetail.html"><img src="images/product/03.jpg" alt="Shoes 6" /></a>
                            <table>
                                <tr>
                                    <td><span class="product_status">Còn hàng</span></td>
                                    <td><span class="product_price">2000000đ</span></td>
                                </tr>
                                <tr>
                                    <td><span class="product_status_sale">-10%</span></td>
                                    <td><span class="product_price_sale">1800000đ</span></td>
                                </tr>
                                <tr>
                                    <td><a href="shoppingcart.html" class="addtocart"></a></td>
                                    <td><a href="productdetail.html" class="detail"></a></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <div class="cleaner"></div>
<!--                 </div> 
                <div class="cleaner"></div> -->
            </div> 

            <div id="templatemo_footer">
                Copyright © 2019 <a href="#">D16PTIT</a></div> 
        </div>
    </div> 
</body>
</html>
