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
                                         
                        <p>Xin chào, Admin</p>
                        <a href="LogOut">Đăng xuất</a>
                    </div>
                    <div class="cleaner"></div>
                </div>

                <div id="templatemo_menubar">
                    <div id="top_nav" class="ddsmoothmenu">
                        <ul>
                            <li><a href="adminHome.jsp" class="selected">Danh sách sản phẩm</a></li>
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
                    
                       
                    <table class="data">
				<tr class="data">
					<th class="data" width="30px">STT</th>
					<th class="data">Mã sản phẩm</th>
					<th class="data">Tên sản phẩm</th>
					<th class="data">Mã chuyên mục</th>
					<th class="data">Giá</th>
					<th class="data">Hình ảnh</th>
					<th class="data" width="75px">Tùy chọn</th>
				</tr>
				<% int i=1;
                                    for(Product sp : ProductDAO.ListProduct()){ 
									%>
									<tr class="data">
					<td class="data" width="30px"><%=i++%></td>
					<td class="data"><%=sp.getId()%></td>
					<td class="data"><%=sp.getName()%></td>
					<td class="data"><%=sp.getPrice()%></td>
					<td class="data"><%=sp.getImportprice()%></td>					
					<td class="data" width="75px">
				<center>
					<a href="Update_SanPham?command=update&MaSP=<%=sp.getId()%>">Sửa</a>&nbsp;&nbsp; | &nbsp;&nbsp;
					<a href="qlSanPham?command=delete&MaSP=<%=sp.getId() %>">Xóa</a>
					</center>
					</td>
				
				<% 
				}
					%>
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
