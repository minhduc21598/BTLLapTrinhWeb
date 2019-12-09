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
                    <a href="ShowShipment">Đơn hàng</a> | 
                    <a href="LogOut">Đăng xuất</a>
                    <% }%>
                </div>
                <div class="cleaner"></div>
            </div> <!-- END of templatemo_header -->

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
                            <% ArrayList<Product> bestseller = (ArrayList<Product>) request.getAttribute("listProduct"); %>
                            <% for (int i = 0; i < bestseller.size(); i++) { %>
                            <% if (bestseller.get(i).getBestseller() == 1) {%>
                            <div class="product_box">
                                <h3><%= bestseller.get(i).getName()%></h3>
                                <a href="DetailProduct?idProduct=<%= bestseller.get(i).getId()%>"><img src="<%= bestseller.get(i).getListImage().get(0).getUrl()%>" alt="Shoes1" /></a>
                                <table>
                                    <tr>
                                        <td>
                                            <span class="product_status"><%= (bestseller.get(i).getRemain() > 0) ? "Còn hàng" : "Hết hàng"%></span>
                                        </td>
                                        <td>
                                            <span class="product_price"><%= bestseller.get(i).getPrice()%></span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <% int sale = bestseller.get(i).getSale(); %>
                                            <% if (sale != 0) {%>
                                            <span class="product_status_sale">-<%= sale%>%</span>
                                            <% } %>
                                        </td>
                                        <td>
                                            <% if (sale != 0) { %>
                                            <% double price = bestseller.get(i).getPrice(); %>
                                            <% double saleprice = (double) price * ((100 - sale) / 100);%>
                                            <span class="product_price_sale"><%= saleprice%></span>
                                            <% }%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <a href="AddToCart?productId=<%= bestseller.get(i).getId()%>" class="addtocart"></a>
                                        </td>
                                        <td>
                                            <a href="DetailProduct?idProduct=<%= bestseller.get(i).getId()%>" class="detail"></a>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <% } %>
                            <% } %>  
                        </div>
                    </div>

                    <h2>Tất cả sản phẩm</h2>
                    <% ArrayList<Product> listProduct = bestseller; %>
                    <% for (int i = 0; i < listProduct.size(); i++) {%>
                    <div class="product_box">
                        <h3><%= listProduct.get(i).getName()%></h3>
                        <a href="DetailProduct?idProduct=<%= listProduct.get(i).getId()%>"><img src="<%= listProduct.get(i).getListImage().get(0).getUrl()%>" alt="Shoes 1" /></a>
                        <table>
                            <tr>
                                <td>
                                    <span class="product_status"><%= (listProduct.get(i).getRemain() > 0) ? "Còn hàng" : "Hết hàng"%></span>
                                </td>
                                <td>
                                    <span class="product_price"><%= listProduct.get(i).getPrice()%></span>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <% int sale = listProduct.get(i).getSale(); %>
                                    <% if (sale != 0) {%>
                                    <span class="product_status_sale">-<%= sale%>%</span>
                                    <% } %>
                                </td>
                                <td>
                                    <% if (sale != 0) { %>
                                    <% double price = listProduct.get(i).getPrice(); %>
                                    <% double saleprice = (double) price * ((100 - sale) / 100);%>
                                    <span class="product_price_sale"><%= saleprice%></span>
                                    <% }%>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a href="AddToCart?productId=<%= listProduct.get(i).getId()%>" class="addtocart"></a>
                                </td>
                                <td>
                                    <a href="DetailProduct?idProduct=<%= listProduct.get(i).getId()%>" class="detail"></a>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <% }%>
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
