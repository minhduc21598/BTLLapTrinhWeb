<%@page import="model.ProductImage"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.ProductDAO"%>
<%@page import="model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Trang chủ quản trị</title>
        <meta name="keywords" content="" />
        <meta name="description" content="" />
        <link href="home.css" rel="stylesheet" type="text/css" />

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

                        <p>Xin chào, Admin</p>
                        <a href="LogOut">Đăng xuất</a>
                    </div>
                    <div class="cleaner"></div>
                </div>

                <div id="templatemo_menubar">
                    <div id="top_nav" class="ddsmoothmenu">
                        <ul>
                            <li><a href="GetProductForAdmin" class="selected">Danh sách sản phẩm</a></li>
                            <li><a href="addProducts.jsp">Thêm sản phẩm</a>
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


                    <table class="data" align="center" class="listProduct">
                        <tr class="data">
                            <th class="data" width="30px">STT</th>
                            <th class="data">Mã sản phẩm</th>
                            <th class="data">Tên sản phẩm</th>
                            <th class="data">Nhà sản xuất</th>
                            <th class="data">Giá Bán</th>
                            <th class="data">Giá Nhập</th>
                            <th class="data">Hình ảnh</th>
                            <th class="data" width="75px">Tùy chọn</th>
                        </tr>
                        <% ArrayList<Product> list = (ArrayList<Product>) request.getAttribute("listProduct"); %>
                        <% for (int i = 0; i < list.size();i++){ %>
                        <tr class="data">
                            <td class="data" width="30px"><%=i+1%></td>
                            <td class="data"><%=list.get(i).getId()%></td>
                            <td class="data"><%=list.get(i).getName()%></td>
                            <td class="data"><%=list.get(i).getManufacturer().getName()%></td>
                            <td class="data"><%= list.get(i).getPrice()%></td>                                       
                            <td class="data"><%= list.get(i).getImportprice()%></td>	
                            <td class="data"><img src="<%= list.get(i).getListImage().get(0).getUrl() %>"/></td>	
                            <td class="data" width="75px">
                        <center>
                            <a href="UpdateProduct?maSP=<%=list.get(i).getId()%>">Sửa</a>
                            <a href="DeleteProduct?maSP=<%=list.get(i).getId()%>">Xóa</a>
                        </center>
                        </td>
                        <% } %>
                        </tr>
                    </table>

                </div> 
                <%
                    Product sp = new Product();
                    sp.setId(1);
                %>                
                <div id="templatemo_footer">
                    Copyright © 2019 <a href="#">D16PTIT</a></div> 
            </div>
        </div> 
    </body>
</html>
