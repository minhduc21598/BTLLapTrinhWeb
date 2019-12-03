
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Login</title>
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
                        <a href="#">My Account</a> | <a href="#">My Cart</a> | <a href="#">Logout</a> | <a href="#">Login</a></p>
                    <p>
                        Shopping Cart: <strong>3 items</strong> ( <a href="shoppingcart.html">Show Cart</a> )
                    </p>
                </div>
                <div class="cleaner"></div>
            </div> <!-- END of templatemo_header -->

            <div id="templatemo_menubar">
                <div id="top_nav" class="ddsmoothmenu">
                    <ul>
                        <li><a href="index.html">Trang Chủ</a></li>
                        <li><a href="products.html">Sản Phẩm</a>

                        </li>
                        <li><a href="about.html">Giới Thiệu</a>

                        </li>
                        <li><a href="faqs.html">FAQ</a></li>
                        <!-- <li><a href="checkout.html">Checkout</a></li> -->
                        <li><a href="contact.html">Liên Hệ</a></li>
                    </ul>
                    <br style="clear: left" />
                </div> <!-- end of ddsmoothmenu -->
                <div id="templatemo_search">
                    <form action="#" method="get">
                        <input type="text" value=" " name="keyword" id="keyword" title="keyword" onfocus="clearText(this)" onblur="clearText(this)" class="txt_field" />
                        <input type="submit" name="Search" value=" " alt="Search" id="searchbutton" title="Search" class="sub_btn"  />
                    </form>
                </div>
            </div> <!-- END of templatemo_menubar -->

            <div id="templatemo_main">

                <form class="box-login" action="CheckLoginCustomer" method="post">
                    <h3>Thông tin đăng nhập</h3>
                    <input type="text" name = "name" placeholder="Tên đăng nhập">
                    <input type="password" name = "pass" placeholder="Mật khẩu"> 
                    
                    <input type="submit" name = "OK" value="Đăng nhập">
                </form>

            </div>
            <!-- END of templatemo_main -->

            <div id="templatemo_footer">
                <p><a href="#">Trang chủ</a> | <a href="#">Sản phẩm</a> | <a href="#">Giới thiệu</a> | <a href="#">FAQ</a> | <a href="#">Liên hệ</a>
                </p>

                Copyright © 2019 <a href="#">D16 PTIT</a> 
            </div> 
            <!-- END of templatemo_footer -->

        </div> <!-- END of templatemo_wrapper -->
    </div> <!-- END of templatemo_body_wrapper -->

</body>
</html>
