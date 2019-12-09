/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import dao.ShipmentDAO;
import dao.ProductDAO;
import java.util.ArrayList;
import model.Shipment;
import model.User;
import model.Product;

/**
 *
 * @author Minh Đức
 */
@WebServlet(name = "AddToCart", urlPatterns = {"/AddToCart"})
public class AddToCart extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddToCart</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddToCart at " + request.getContextPath() + "</h1>");
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
        int productId = Integer.parseInt(request.getParameter("productId"));
        boolean alreadyExist = false;
        ShipmentDAO sd = new ShipmentDAO();
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        ArrayList<Shipment> listShipment = sd.getShipment(user.getId());
        for (Shipment s : listShipment) {
            if (s.getProduct().getId() == productId) {
                alreadyExist = true;
                break;
            }
        }
        ProductDAO pd = new ProductDAO();
        Product product = pd.getProduct(productId);
        if (!alreadyExist) {
            Shipment shipment = new Shipment();
            shipment.setQuantity(1);
            shipment.setTotal(product.getPrice());
            shipment.setStatus(0);
            shipment.setProduct(product);
            shipment.setUser(user);
            int check = sd.createShipmentInCart(shipment);
            if (check != 0) {
                response.sendRedirect("GetInitialData");
            }
        } else {
            int check = sd.updateShipmentQuantity(product, user.getId());
            if (check != 0) {
                response.sendRedirect("GetInitialData");
            }
        }
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
