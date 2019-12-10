/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dao.ProductDAO;
import dao.TypeDAO;
import dao.ManufacturerDAO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Manufacturer;
import model.Product;
import model.Type;

/**
 *
 * @author ngoqu
 */
@WebServlet(name = "qlProduct", urlPatterns = {"/qlProduct"})
public class qlProduct extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        ProductDAO pd = new ProductDAO();
        Product product = new Product();
        product.setName(request.getParameter("tenSP"));
        product.setPrice(Double.parseDouble(request.getParameter("giaBan")));
        product.setImportprice(Double.parseDouble(request.getParameter("giaNhap")));
        product.setSale(Integer.parseInt(request.getParameter("khuyenMai")));
        product.setRemain(Integer.parseInt(request.getParameter("tonKho")));
        product.setSold(0);
        TypeDAO td = new TypeDAO();
        Type type = td.getType(Integer.parseInt(request.getParameter("loai")));
        product.setType(type);
        product.setHot(1);
        product.setBestseller(0);
        ManufacturerDAO md = new ManufacturerDAO();
        Manufacturer manu = md.getManufacturer(Integer.parseInt(request.getParameter("nhaCungCap")));
        product.setManufacturer(manu);
        boolean test = pd.addProduct(product);
        if (test == true) {
            RequestDispatcher rd = request.getRequestDispatcher("addProducts.jsp");
            request.setAttribute("mess", "Thêm sản phẩm thành công !");
            rd.forward(request, response);
        } else {
            RequestDispatcher rd = request.getRequestDispatcher("addProducts.jsp");
            request.setAttribute("mess", "Thông tin không chính xác hoặc đã bị trùng. Vui lòng nhập lại !");
            rd.forward(request, response);
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
