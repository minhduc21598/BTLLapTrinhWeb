
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Chỉnh sửa thông tin</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="css/home.css" rel="stylesheet" type="text/css" />
<link href="css/ddsmoothmenu.css" rel="stylesheet" type="text/css"  />
</head>
<body>
    <div id="templatemo_body_wrapper">
        <div id="templatemo_wrapper">

            <div id="templatemo_header">
                <div id="site_title"><h1><a href="#">Online Shoes Store</a></h1></div>
                <div id="header_right">
                    <p>
                        <a href="#">Tài khoản</a> | <a href="#">Giỏ hàng</a> | <a href="#">Đăng xuất</a> | <a href="#">Đăng nhập</a></p>
                    <p>
                        Giỏ hàng hiện tại: <strong>3 items</strong> ( <a href="shoppingcart.html">Xem giỏ</a> )
                    </p>
                </div>
                <div class="cleaner"></div>
            </div> <!-- END of templatemo_header -->

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
                </div> <!-- end of ddsmoothmenu -->
                <div id="templatemo_search">
                    <form action="#" method="get">
                        <input type="text" placeholder="Nhập sản phẩm cần tìm" value=" " name="keyword" id="keyword" title="keyword" onfocus="clearText(this)" onblur="clearText(this)" class="txt_field" />
                        <input type="submit" name="Search" value=" " alt="Search" id="searchbutton" title="Search" class="sub_btn"  />
                    </form>
                </div>
            </div> <!-- END of templatemo_menubar -->

            <div id="templatemo_main">
                <div id="sidebar" class="float_l">
                    <div class="sidebar_box"><span class="bottom"></span>
                        <h3>Danh mục sản phẩm</h3>   
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
                    <div>
                        <form class="box-edit-infor-customer" action="" method="post">
                            <h3>CHỈNH SỬA THÔNG TIN</h3>
                            <label for="">Họ và tên:</label>
                            <input type="text" name = "name" placeholder="Nhập họ và tên...">
                            <label for="">Địa chỉ:</label>
                            <input type="text" name = "address" placeholder="Nhập địa chỉ...">
                            <label for="">Ngày sinh:</label>
                            <input type="date" name = "date" placeholder="Nhập ngày sinh...">
                            <label for="">Email:</label>
                            <input type="email" name = "email" placeholder="Nhập email...">
                            <label for="">Số điện thoại:</label>
                            <input type="tel" name = "phone" placeholder="Nhập số điện thoại...">

                            <input type="submit" name = "OK">
                        </form>
                    </div>
                </div>
                <div class="cleaner"></div>
            </div> <!-- END of templatemo_main -->

            <div id="templatemo_footer">
                <p><a href="#">Trang chủ</a> | <a href="#">Sản phẩm</a> | <a href="#">Giới thiệu</a> | <a href="#">FAQ</a> | <a href="#">Liên hệ</a>
                </p>
                Copyright © 2019 <a href="#">D16 PTIT</a>     
            </div> <!-- E   ND of templatemo_footer -->    
        </div> <!-- END of templatemo_wrapper -->
    </div> <!-- END of templatemo_body_wrapper -->

</body>
</html>

