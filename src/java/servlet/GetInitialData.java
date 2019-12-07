/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;
import java.util.ArrayList;
import model.Type;
import dao.TypeDAO;
import model.Manufacturer;
import dao.ManufacturerDAO;
import model.Product;
import dao.ProductDAO;
import java.util.Collections;
import java.util.Comparator;

/**
 *
 * @author Minh Đức
 */
@WebServlet(name = "GetInitialData", urlPatterns = {"/GetInitialData"})
public class GetInitialData extends HttpServlet {

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
        ArrayList<Product> listProduct = (ArrayList<Product>) request.getAttribute("listProduct");
        TypeDAO td = new TypeDAO();
        ArrayList<Type> listType = td.getAllType();
        request.setAttribute("listType", listType);

        ManufacturerDAO md = new ManufacturerDAO();
        ArrayList<Manufacturer> listManu = md.getAllManufacturer();
        request.setAttribute("listManu", listManu);

        if(listProduct == null){
            ProductDAO pd = new ProductDAO();
            listProduct = pd.getAllProduct();
            request.setAttribute("listProduct", listProduct);
        } else {
            request.setAttribute("listProduct", listProduct);
        }
        RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
        rd.forward(request, response);

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
//        String sortType = (String) request.getAttribute("sortType");
//        ProductDAO pd = new ProductDAO();
//        ArrayList<Product> listProduct = pd.getAllProduct();
//        if (sortType.equals("increase")) {
//            Collections.sort(listProduct, new Comparator<Product>() {
//                @Override
//                public int compare(Product p1, Product p2) {
//                    return ((int) p1.getPrice() - (int) p2.getPrice());
//                }
//            });
//        } else if (sortType.equals("decrease")) {
//            Collections.sort(listProduct, new Comparator<Product>() {
//                @Override
//                public int compare(Product p1, Product p2) {
//                    return ((int) p2.getPrice() - (int) p1.getPrice());
//                }
//            });
//        }
//        request.setAttribute("listProduct", listProduct);
//        RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
//        rd.forward(request, response);
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
//        processRequest(request, response);
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
