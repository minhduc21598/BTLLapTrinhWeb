/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dao.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;
import model.Product;

/**
 *
 * @author Minh Đức
 */
@WebServlet(name = "Filter", urlPatterns = {"/Filter"})
public class Filter extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    public ArrayList<Product> filterByManu(String name) {
        ProductDAO pd = new ProductDAO();
        ArrayList<Product> listProduct = pd.getAllProduct();
        ArrayList<Product> listProductByManu = new ArrayList<>();
        for (int i = 0; i < listProduct.size(); i++) {
            if (listProduct.get(i).getManufacturer().getName().equals(name)) {
                listProductByManu.add(listProduct.get(i));
            }
        }
        return listProductByManu;
    }

    public ArrayList<Product> filterByPrice(String type) {
        ProductDAO pd = new ProductDAO();
        ArrayList<Product> listProduct = pd.getAllProduct();
        ArrayList<Product> listProductByPrice = new ArrayList<>();
        if (type.equals("1")) {
            for (int i = 0; i < listProduct.size(); i++) {
                if (listProduct.get(i).getPrice() < 1000000) {
                    listProductByPrice.add(listProduct.get(i));
                }
            }
        }
        if (type.equals("2")) {
            for (int i = 0; i < listProduct.size(); i++) {
                if (listProduct.get(i).getPrice() >= 1000000 && listProduct.get(i).getPrice() <= 2000000) {
                    listProductByPrice.add(listProduct.get(i));
                }
            }
        }
        if (type.equals("3")) {
            for (int i = 0; i < listProduct.size(); i++) {
                if (listProduct.get(i).getPrice() > 2000000) {
                    listProductByPrice.add(listProduct.get(i));
                }
            }
        }
        return listProductByPrice;
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Filter</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Filter at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        String manufacturer = (String) request.getParameter("manufacturer");
        String priceRange = (String) request.getParameter("priceRange");
        ArrayList<Product> listProduct = new ArrayList<>();
        if (manufacturer != null && priceRange == null) {
            listProduct = filterByManu(manufacturer);
        }
        if (manufacturer == null && priceRange != null) {
            listProduct = filterByPrice(priceRange);
        }
        if (manufacturer != null && priceRange != null) {
            ArrayList<Product> listProduct1 = filterByManu(manufacturer);
            ArrayList<Product> listProduct2 = filterByPrice(priceRange);
            for (int i = 0; i < listProduct1.size(); i++) {
                if (listProduct2.contains(listProduct1.get(i))) {
                    listProduct.add(listProduct1.get(i));
                }
            }
        }
        request.setAttribute("listProduct", listProduct);
        RequestDispatcher rd = request.getRequestDispatcher("GetInitialData");
        rd.forward(request, response);
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
