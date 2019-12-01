
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                    <p>
                        <a href="#">My Account</a> | <a href="#">My Wishlist</a> | <a href="#">My Cart</a> | <a href="#">Checkout</a> | <a href="#">Log In</a></p>
                    <p>
                        Giỏ hàng hiện tại: <strong>3 sản phẩm</strong> ( <a href="shoppingcart.jsp">Xem giỏ</a> )
                    </p>
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
                        <h3>Bán chạy nhất </h3>   
                        <div class="content"> 
                            <div class="bs_box">
                                <a href="#"><img src="images/templatemo_image_01.jpg" alt="image" /></a>
                                <h4><a href="#">Tên giày bán chạy 1</a></h4>
                                <p class="price">$10</p>
                                <div class="cleaner"></div>
                            </div>
                            <div class="bs_box">
                                <a href="#"><img src="images/templatemo_image_01.jpg" alt="image" /></a>
                                <h4><a href="#">Tên giày bán chạy 2</a></h4>
                                <p class="price">$12</p>
                                <div class="cleaner"></div>
                            </div>
                            <div class="bs_box">
                                <a href="#"><img src="images/templatemo_image_01.jpg" alt="image" /></a>
                                <h4><a href="#">Tên giày bán chạy 3</a></h4>
                                <p class="price">$20</p>
                                <div class="cleaner"></div>
                            </div>
                            <div class="bs_box">
                                <a href="#"><img src="images/templatemo_image_01.jpg" alt="image" /></a>
                                <h4><a href="#">Tên giày bán chạy 4</a></h4>
                                <p class="price">$8</p>
                                <div class="cleaner"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="content" class="float_r">
                    <h1>Chi tiết sản phẩm</h1>
                    <div class="content_half float_l">
                        <a  rel="lightbox[portfolio]" href="images/product/10_l.jpg"><img src="images/product/10.jpg" alt="image" /></a>
                    </div>
                    <div class="content_half float_r">
                        <table>
                            <tr>
                                <td width="160">Giá:</td>
                                <td>$100</td>
                            </tr>
                            <tr>
                                <td>Trạng thái:</td>
                                <td>Còn hàng</td>
                            </tr>
                            <tr>
                                <td>Mã sản phẩm:</td>
                                <td>N123</td>
                            </tr>
                            <tr>
                                <td>Giới tính:</td>
                                <td>Nữ</td>
                            </tr>
                            <tr>
                                <td>Hãng sản suất:</td>
                                <td>Nike</td>
                            </tr>
                            <tr>
                                <td>Số lượng:</td>
                                <td><input type="text" value="1" style="width: 20px; text-align: right" /></td>
                            </tr>
                        </table>
                        <div class="cleaner h20"></div>
                        <a href="shoppingcart.html" class="addtocart"></a>
                    </div>
                    <div class="cleaner h30"></div>

                    <h5>Mô tả sản phẩm</h5>
                    <p>Đế giày được thiết kế chịu ma sát tốt, tăng chiều cao, nhẹ, êm, cân bằng và thoáng khí. Kiểu dáng hottrend của năm nay.Có thể làm giày cặp, giày nhóm. Thích hợp đi chơi, chạy bộ, gym, đi học, đi làm... Có thể kết hợp với váy, jeans... Đều phù hợp. <!-- <a href="http://validator.w3.org/check?uri=referer" rel="nofollow">XHTML</a> &amp; <a href="http://jigsaw.w3.org/css-validator/check/referer" rel="nofollow">CSS</a>. --></p>	

                    <div class="cleaner h50"></div>

                    <h3>Sản phẩm tương tự</h3>
                    <div class="product_box">
                        <a href="productdetail.html"><img src="images/product/01.jpg" alt="" /></a>
                        <h3>Adidas xxx</h3>
                        <p class="product_price">$ 100</p>
                        <a href="shoppingcart.html" class="addtocart"></a>
                        <a href="productdetail.html" class="detail"></a>
                    </div>        	
                    <div class="product_box">
                        <a href="productdetail.html"><img src="images/product/02.jpg" alt="" /></a>
                        <h3>Converse xxx</h3>
                        <p class="product_price">$ 200</p>
                        <a href="shoppingcart.html" class="addtocart"></a>
                        <a href="productdetail.html" class="detail"></a>
                    </div>        	
                    <div class="product_box no_margin_right">
                        <a href="productdetail.html"><img src="images/product/03.jpg" alt="" /></a>
                        <h3>Adidas xyz</h3>
                        <p class="product_price">$ 120</p>
                        <a href="shoppingcart.html" class="addtocart"></a>
                        <a href="productdetail.html" class="detail"></a>
                    </div>     
                </div> 
                <div class="cleaner"></div>
            </div> 
            <!-- END of templatemo_main -->
            <div id="templatemo_footer">
                <p><a href="#">Trang chủ</a> | <a href="#">Sản phẩm</a> | <a href="#">Giới thiệu</a> | <a href="#">FAQ</a> | <a href="#">Liên hệ</a>
                </p>
                Copyright © 2019 <a href="#">D16 PTIT</a>
            </div> 
            <!-- END of templatemo_footer -->
        </div> 
        <!-- END of templatemo_wrapper -->
    </div> 
    <!-- END of templatemo_body_wrapper -->
</body>
</html>