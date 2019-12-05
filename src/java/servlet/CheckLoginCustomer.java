package servlet;

import dao.AccountDAO;
import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Account;
import model.User;

@WebServlet(name = "CheckLoginCustomer", urlPatterns = {"/CheckLoginCustomer"})
public class CheckLoginCustomer extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        processRequest(request, response);
        String name = request.getParameter("name");
        String pass = request.getParameter("pass");
        AccountDAO ad = new AccountDAO();
        Account ac = ad.checkAccount(name, pass);
        RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
        if (ac.getUsername() != null) {
            UserDAO ud = new UserDAO();
            User user = ud.checkUser(ac.getId());
            user.setAccount(ac);
            if (user.getType() == 2) {
                HttpSession session = request.getSession();
                session.setAttribute("user", user);
                request.setAttribute("mess", "Đăng nhập thành công !");
                rd.forward(request, response);
            } else if (user.getType() == 1) {
                request.setAttribute("mess", "Admin không được đăng nhập ở đây !");
                rd.forward(request, response);
            }
        } else {
            request.setAttribute("mess", "Sai tên đăng nhập hoặc mật khẩu !");
            rd.forward(request, response);
        }
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
