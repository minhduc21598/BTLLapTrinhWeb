<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.User" %>
<%@page import="java.util.ArrayList" %>
<%@page import="model.Type" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Trang chủ</title>
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
                        <% User user = (User) session.getAttribute("user"); %>
                        <% if (user == null) { %>
                        <a href="login.jsp">Đăng nhập</a> |
                        <a href="editInforUser.jsp">Đăng ký</a>
                        <% } else {%>                     
                        <p>Xin chào, <%= user.getName()%></p>
                        <a href="editInforUser.jsp">Tài khoản</a> | 
                        <a href="ShowShoppingCart?idUser=<%= user.getId()%>">Giỏ hàng</a> | 
                        <a href="LogOut">Đăng xuất</a>
                        <% }%>

                    </div>
                    <div class="cleaner"></div>
                </div>

                <div id="templatemo_menubar">
                    <div id="top_nav" class="ddsmoothmenu">
                        <ul>
                            <li><a href="index.html" class="selected">Home</a></li>
                            <li><a href="products.html">Sản phẩm</a>
                                <!--                                <ul>
                                                                    <li><a href="#submenu1">Sub menu 1</a></li>
                                                                    <li><a href="#submenu2">Sub menu 2</a></li>
                                                                    <li><a href="#submenu3">Sub menu 3</a></li>
                                                                    <li><a href="#submenu4">Sub menu 4</a></li>
                                                                    <li><a href="#submenu5">Sub menu 5</a></li>
                                                                </ul>-->
                            </li>
                            <li><a href="about.html">Giới thiệu</a>
                                <!--                                <ul>
                                                                    <li><a href="#submenu1">Sub menu 1</a></li>
                                                                    <li><a href="#submenu2">Sub menu 2</a></li>
                                                                    <li><a href="#submenu3">Sub menu 3</a></li>
                                                                </ul>-->
                            </li>
                            <li><a href="faqs.html">FAQs</a></li>
                            <!--                            <li><a href="checkout.html">Checkout</a></li>-->
                            <li><a href="contact.html">Liên hệ</a></li>
                        </ul>
                        <br style="clear: left" />
                    </div>
                    <div id="templatemo_search">
                        <form action="#" method="get">
                            <input type="text" value=" " name="keyword" id="keyword" title="keyword" onfocus="clearText(this)" onblur="clearText(this)" class="txt_field" />
                            <input type="submit" name="Search" value=" " id="searchbutton" title="Search" class="sub_btn"  />
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
                        <div class="sidebar_box"><span class="bottom"></span>
                            <h3>LỌC SẢN PHẨM</h3>
                            <div class="filter">
                                <div class="filter-hang">
                                    <span>CHỌN HÃNG SẢN XUẤT</span> <br>
                                    <ul>
                                        <li>
                                            <a href="#">
                                                <label><input type="checkbox">Adidas</label>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <label><input type="checkbox">Nike</label>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <label><input type="checkbox">Converse</label>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <label><input type="checkbox">Bitis</label>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="filter-gia">
                                    <span>CHỌN MỨC GIÁ</span> <br>
                                    <ul>
                                        <li>
                                            <a href="#">
                                                <label><input type="checkbox">Dưới 1 triệu</label>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <label><input type="checkbox">Từ 1-2 triệu</label>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <label><input type="checkbox">Trên 2 triệu</label>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div id="content" class="float_r">
                        <div class="box-sort">
                            <span>Sắp xếp theo:</span>
                            <select >
                                <option value=""><a href="#">Sắp xếp theo</a></option>
                                <option value=""><a href="#">Giá tăng dần</a></option>
                                <option value=""><a href="#">Giá giảm dần</a></option>
                            </select>
                        </div>

                        <div id="Best-seller">
                            <h3>Bán chạy</h3>

                        </div>
                        <h1>Sản phẩm mới</h1>
                        <div class="product_box">
                            <h3>Ut eu feugiat</h3>
                            <a href="productdetail.html"><img src="images/product/01.jpg" alt="Shoes 1" /></a>
                            <p>Nulla rutrum neque vitae erat condimentum eget malesuada.</p>
                            <p class="product_price">$ 100</p>
                            <a href="shoppingcart.html" class="addtocart"></a>
                            <a href="productdetail.html" class="detail"></a>
                        </div>        	
                        <div class="product_box">
                            <h3>Curabitur et turpis</h3>
                            <a href="productdetail.html"><img src="images/product/02.jpg" alt="Shoes 2" /></a>
                            <p>Sed congue, erat id congue vehicula. Validate <a href="http://validator.w3.org/check?uri=referer" rel="nofollow">XHTML</a> &amp; <a href="http://jigsaw.w3.org/css-validator/check/referer" rel="nofollow">CSS</a>.</p>
                            <p class="product_price">$ 80</p>
                            <a href="shoppingcart.html" class="addtocart"></a>
                            <a href="productdetail.html" class="detail"></a>
                        </div>        	
                        <div class="product_box no_margin_right">
                            <h3>Mauris consectetur</h3>
                            <a href="productdetail.html"><img src="images/product/03.jpg" alt="Shoes 3" /></a>
                            <p>Morbi non risus vitae est vestibulum tincidunt ac eget metus.</p>
                            <p class="product_price">$ 60</p>
                            <a href="shoppingcart.html" class="addtocart"></a>
                            <a href="productdetail.html" class="detail"></a>
                        </div>   

                        <div class="cleaner"></div>

                        <div class="product_box">
                            <h3>Proin volutpat</h3>
                            <a href="productdetail.html"><img src="images/product/04.jpg" alt="Shoes 4" /></a>
                            <p>Sed semper euismod dolor sit amet interdum. Phasellus in mi eros.</p>
                            <p class="product_price">$ 220</p>
                            <a href="shoppingcart.html" class="addtocart"></a>
                            <a href="productdetail.html" class="detail"></a>
                        </div>        	
                        <div class="product_box">
                            <h3>Aenean tempus</h3>
                            <a href="productdetail.html"><img src="images/product/05.jpg" alt="Shoes 5" /></a>
                            <p>Maecenas porttitor erat quis leo pellentesque molestie.</p>
                            <p class="product_price">$ 180</p>
                            <a href="shoppingcart.html" class="addtocart"></a>
                            <a href="productdetail.html" class="detail"></a>
                        </div>        	
                        <div class="product_box no_margin_right">
                            <h3>Nulla luctus urna</h3>
                            <a href="productdetail.html"><img src="images/product/06.jpg" alt="Shoes 6" /></a>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                            <p class="product_price">$ 160</p>
                            <a href="shoppingcart.html" class="addtocart"></a>
                            <a href="productdetail.html" class="detail"></a>
                        </div>        	
                    </div> 
                    <div class="cleaner"></div>
                </div> 

                <div id="templatemo_footer">
                    Copyright © 2019 <a href="#">D16PTIT</a></div> 
            </div>
        </div> 
    </body>
</html>
