<%-- 
    Document   : index2
    Created on : Dec 9, 2019, 2:44:44 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.User" %>
<%@page import="java.util.ArrayList" %>
<%@page import="model.Type" %>
<%@page import="model.Manufacturer" %>
<%@page import="model.Product" %>
<!DOCTYPE html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Trang chủ:...</title>
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <link href="home.css" rel="stylesheet" type="text/css" />
    <link href="css/ddsmoothmenu.css" rel="stylesheet" type="text/css" />
        <script>
        <% String mess = (String) request.getAttribute("mess"); %>
        <% if (mess != null) {%>
        alert(`<%= mess%>`);
        <% request.removeAttribute("mess"); %>
        <% }%>
    </script>
</head>

<body>

    <div id="templatemo_body_wrapper">
        <div id="templatemo_wrapper">

            <div id="templatemo_header">
                <div id="site_title">
                    <h1><a href="#">Online Shoes Store</a></h1>
                </div>
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
            </div> <!-- END of templatemo_header -->

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
                </div> <!-- end of ddsmoothmenu -->
                <div id="templatemo_search">
                        <form action="Search" method="post">
                            <input type="text" name="keyword" onfocus="clearText(this)" onblur="clearText(this)" class="txt_field" />
                            <input type="submit" name="Search" value=" " alt="Search" id="searchbutton" title="Search" class="sub_btn"  />
                        </form>
                    </div>
            </div> <!-- END of templatemo_menubar -->

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
                    <div class="sidebar_box"><span class="bottom"></span>
                        <h3>LỌC SẢN PHẨM</h3>
                        <div class="filter">
                            <div class="filter-hang">
                                <span>CHỌN HÃNG SẢN XUẤT</span> <br>
                                <ul>
                                    <li>
                                        <a href="#">
                                            <label><input type="checkbox" name="" value="">Adidas</label>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <label><input type="checkbox" name="" value="">Nike</label>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <label><input type="checkbox" name="" value="">Converse</label>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <label><input type="checkbox" name="" value="">Bitis</label>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                            <div class="filter-gia">
                                <span>CHỌN MỨC GIÁ</span> <br>
                                <ul>
                                    <li>
                                        <a href="#">
                                            <label><input type="checkbox" name="" value="">Dưới 1 triệu</label>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <label><input type="checkbox" name="" value="">Từ 1-2 triệu</label>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <label><input type="checkbox" name="" value="">Trên 2 triệu</label>
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
                        <select name="">
                            <option value=""><a href="#">Sắp xếp theo</a></option>
                            <option value=""><a href="#">Giá tăng dần</a></option>
                            <option value=""><a href="#">Giá giảm dần</a></option>
                        </select>
                    </div>
                    <!-- ============ -->
                    <h2>Sản phẩm bán chạy</h2>
                    <div class="best-seller">
                        <div class="best-seller-scroll">
                            <div class="product_box">
                                <h3>Tên sản phẩm</h3>
                                <a href="productdetail.html"><img src="images/product/01.jpg" alt="Shoes1" /></a>
                                <table>
                                    <tr>
                                        <td>
                                            <span class="product_status">Còn hàng</span>
                                        </td>
                                        <td>
                                            <span class="product_price">2000000đ</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <span class="product_status_sale">-10%</span>
                                        </td>
                                        <td>
                                            <span class="product_price_sale">1800000đ</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <a href="shoppingcart.html" class="addtocart"></a>
                                        </td>
                                        <td>
                                            <a href="productdetail.html" class="detail"></a>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div class="product_box">
                                <h3>Tên sản phẩm</h3>
                                <a href="productdetail.html"><img src="images/product/02.jpg" alt="Shoes2" /></a>
                                <table>
                                    <tr>
                                        <td>
                                            <span class="product_status">Còn hàng</span>
                                        </td>
                                        <td>
                                            <span class="product_price">2000000đ</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <span class="product_status_sale">-10%</span>
                                        </td>
                                        <td>
                                            <span class="product_price_sale">1800000đ</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <a href="shoppingcart.html" class="addtocart"></a>
                                        </td>
                                        <td>
                                            <a href="productdetail.html" class="detail"></a>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div class="product_box">
                                <h3>Tên sản phẩm</h3>
                                <a href="productdetail.html"><img src="images/product/04.jpg" alt="Shoes3" /></a>
                                <table>
                                    <tr>
                                        <td>
                                            <span class="product_status">Còn hàng</span>
                                        </td>
                                        <td>
                                            <span class="product_price">2000000đ</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <span class="product_status_sale">-10%</span>
                                        </td>
                                        <td>
                                            <span class="product_price_sale">1800000đ</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <a href="shoppingcart.html" class="addtocart"></a>
                                        </td>
                                        <td>
                                            <a href="productdetail.html" class="detail"></a>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div class="product_box">
                                <h3>Tên sản phẩm</h3>
                                <a href="productdetail.html"><img src="images/product/04.jpg" alt="Shoes4" /></a>
                                <table>
                                    <tr>
                                        <td>
                                            <span class="product_status">Còn hàng</span>
                                        </td>
                                        <td>
                                            <span class="product_price">2000000đ</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <span class="product_status_sale">-10%</span>
                                        </td>
                                        <td>
                                            <span class="product_price_sale">1800000đ</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <a href="shoppingcart.html" class="addtocart"></a>
                                        </td>
                                        <td>
                                            <a href="productdetail.html" class="detail"></a>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                    <!-- ================= -->

                    <h2>Sản phẩm mới</h2>
                    <div class="product_box">
                            <h3>Tên sản phẩm</h3>
                            <a href="productdetail.html"><img src="images/product/03.jpg" alt="Shoes 1" /></a>
                            <table>
                                <tr>
                                    <td>
                                        <span class="product_status">Còn hàng</span>
                                    </td>
                                    <td>
                                        <span class="product_price">2000000đ</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span class="product_status_sale">-10%</span>
                                    </td>
                                    <td>
                                        <span class="product_price_sale">1800000đ</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <a href="shoppingcart.html" class="addtocart"></a>
                                    </td>
                                    <td>
                                        <a href="productdetail.html" class="detail"></a>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    <div class="product_box">
                        <h3>Tên sản phẩm</h3>
                        <a href="productdetail.html"><img src="images/product/02.jpg" alt="Shoes 2" /></a>
                        <table>
                            <tr>
                                <td>
                                    <span class="product_status">Còn hàng</span>
                                </td>
                                <td>
                                    <span class="product_price">2000000đ</span>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span class="product_status_sale">-10%</span>
                                </td>
                                <td>
                                    <span class="product_price_sale">1800000đ</span>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a href="shoppingcart.html" class="addtocart"></a>
                                </td>
                                <td>
                                    <a href="productdetail.html" class="detail"></a>
                                </td>
                            </tr>
                        </table>
                    </div>

                    <div class="product_box">
                        <h3>Tên sản phẩm</h3>
                        <a href="productdetail.html"><img src="images/product/03.jpg" alt="Shoes 3" /></a>
                        <table>
                            <tr>
                                <td>
                                    <span class="product_status">Còn hàng</span>
                                </td>
                                <td>
                                    <span class="product_price">2000000đ</span>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span class="product_status_sale">-10%</span>
                                </td>
                                <td>
                                    <span class="product_price_sale">1800000đ</span>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a href="shoppingcart.html" class="addtocart"></a>
                                </td>
                                <td>
                                    <a href="productdetail.html" class="detail"></a>
                                </td>
                            </tr>
                        </table>
                    </div>

                    <div class="cleaner"></div>

                    <div class="product_box">
                        <h3>Tên sản phẩm</h3>
                        <a href="productdetail.html"><img src="images/product/04.jpg" alt="Shoes 4" /></a>
                        <table>
                            <tr>
                                <td>
                                    <span class="product_status">Còn hàng</span>
                                </td>
                                <td>
                                    <span class="product_price">2000000đ</span>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span class="product_status_sale">-10%</span>
                                </td>
                                <td>
                                    <span class="product_price_sale">1800000đ</span>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a href="shoppingcart.html" class="addtocart"></a>
                                </td>
                                <td>
                                    <a href="productdetail.html" class="detail"></a>
                                </td>
                            </tr>
                        </table>
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
