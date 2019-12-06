package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.RequestDispatcher;
import model.User;
import model.Account;
import dao.AccountDAO;
import dao.UserDAO;
import java.sql.Date;

/**
 *
 * @author Minh Đức
 */
@WebServlet(name = "EditInforUser", urlPatterns = {"/EditInforUser"})
public class EditInforUser extends HttpServlet {

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
        String action = request.getParameter("action");
        AccountDAO ad = new AccountDAO();
        UserDAO ud = new UserDAO();
        if (action.equals("create")) {
            User user = new User();
            user.setName(request.getParameter("name"));
            user.setAddress(request.getParameter("address"));
            user.setDateofbirth(Date.valueOf(request.getParameter("date")));
            user.setEmail(request.getParameter("email"));
            user.setPhonenum(request.getParameter("phone"));
            user.setType(2);
            int idUser = ud.createUser(user);
            if (idUser != 0) {
                Account account = new Account();
                account.setId(idUser);
                account.setUsername(request.getParameter("username"));
                account.setPassword(request.getParameter("pass"));
                int check = ad.createAccount(account);
                if (check != 0) {
                    RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                    request.setAttribute("mess", "Đăng kí thành công !");
                    rd.forward(request, response);
                } else {
                    RequestDispatcher rd = request.getRequestDispatcher("editInforCustomer.jsp");
                    request.setAttribute("mess", "Đăng kí không thành công !");
                    rd.forward(request, response);
                }
            } else {
                RequestDispatcher rd = request.getRequestDispatcher("editInforCustomer.jsp");
                request.setAttribute("mess", "Đăng kí không thành công !");
                rd.forward(request, response);
            }
        } else if (action.equals("update")) {
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("user");
            String pass = request.getParameter("pass");
            user.getAccount().setPassword(pass);
            user.setName(request.getParameter("name"));
            user.setAddress(request.getParameter("address"));
            user.setDateofbirth(Date.valueOf(request.getParameter("date")));
            user.setEmail(request.getParameter("email"));
            user.setPhonenum(request.getParameter("phone"));
            int check1 = ad.updateAccount(user.getId(), pass);
            int check2 = ud.updateUser(user);
            RequestDispatcher rd = request.getRequestDispatcher("editInforCustomer.jsp");
            if (check1 != 0 && check2 != 0) {
                request.setAttribute("mess", "Cập nhật thành công !");
                rd.forward(request, response);
            } else {
                request.setAttribute("mess", "Cập nhật không thành công !");
                rd.forward(request, response);
            }
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
