<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Đăng nhập:...</title>
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <link href="home.css" rel="stylesheet" type="text/css" />
    <link href="css/ddsmoothmenu.css" rel="stylesheet" type="text/css"  />
</head>

<script>
    <% String mess = (String) request.getAttribute("mess"); %>
    <% if (mess != null) {%>
    alert(`<%= mess%>`);
    <% }%>
</script>
<body>
    <div id="templatemo_body_wrapper">
        <div id="templatemo_wrapper">
            <div id="templatemo_header">
                <div id="site_title"><h1><a href="#">Shop Giày Online</a></h1></div>
                <div id="header_right">
                    <a href="login.jsp">Đăng nhập</a> |
                    <a href="editInforUser.jsp">Đăng ký</a>
                </div>
                <div class="cleaner"></div>
            </div>
            <div id="templatemo_menubar">
                <div id="top_nav" class="ddsmoothmenu">
                    <ul>
                        <li><a href="GetInitialData">Trang Chủ</a></li>
                        <li><a href="contact.html">Liên Hệ</a></li>
                    </ul>
                    <br style="clear: left" />
                </div>
                <div id="templatemo_search">
                    <form action="#" method="get">
                        <input type="text" value=" " name="keyword" id="keyword" title="keyword" onfocus="clearText(this)" onblur="clearText(this)" class="txt_field" />
                        <input type="submit" name="Search" value=" " alt="Search" id="searchbutton" title="Search" class="sub_btn"  />
                    </form>
                </div>
            </div>
            <div id="templatemo_main">
                <form class="box-login" action="CheckLogin" method="post">
                    <h3>Thông tin đăng nhập</h3>
                    <input type="text" name = "name" placeholder="Tên đăng nhập">
                    <input type="password" name = "pass" placeholder="Mật khẩu">                   
                    <input type="submit" name = "OK" value="Đăng nhập">                   
                    <span> Bạn chưa có tài khoản? <a href ="editInforUser.jsp"> Đăng kí ngay <a/></span>
                </form>
            </div>
            <div id="templatemo_footer">
                Copyright © 2019 <a href="#">D16 PTIT</a> 
            </div> 
        </div>
    </div>
</body>
</html>
