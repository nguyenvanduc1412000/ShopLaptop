package controller;

import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;


import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.User;

/**
 *
 * @author asus
 */
public class Login extends HttpServlet {

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
            out.println("<title>Servlet LoginServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginServlet at " + request.getContextPath() + "</h1>");
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
//        Cookie []arr= request.getCookies();
//       //get user and password from cookie
//        for (Cookie o : arr) {
//            if(o.getName().equals("userC")){
//                request.setAttribute("user", o.getValue());
//            }
//            if(o.getName().equals("passC")){
//                request.setAttribute("pass", o.getValue());
//            }    
//            
//        }
        request.getRequestDispatcher("Login.jsp").forward(request, response);
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
        UserDAO ud = new UserDAO();
        String u = request.getParameter("username");
        String p = request.getParameter("password");
        String r=request.getParameter("rem");
        User a=ud.login(u, p);
        User b=ud.getAccBlock(u);
        if(b==null){
               if(a==null){
            request.setAttribute("err", "Wrong username or password!!");
            request.getRequestDispatcher("Login.jsp").forward(request, response);
               }else{
            
            HttpSession session=request.getSession();
            session.setAttribute("account", a);
            session.setAttribute("acc", a);
            //save username,password cookie
            Cookie cuser = new Cookie("user", u);
            Cookie cpass = new Cookie("pass", p);
            Cookie cremember = new Cookie("rem", r);
           if(r!=null){
                //user click remember me-->set time cookies
                               //co nho , 1 ngay
                cuser.setMaxAge(60 * 60 * 24);
                cpass.setMaxAge(60 * 60 * 24);
                cremember.setMaxAge(60 * 60 * 24);
            } else {
               //khong nho , nen xoa no di
                cuser.setMaxAge(0);
                cpass.setMaxAge(0);
                cremember.setMaxAge(0);

            }
            response.addCookie(cuser);
            response.addCookie(cpass);
            response.addCookie(cremember);
            response.sendRedirect("home");
        }
       
    }else{
             request.setAttribute("mess", "YOUR ACCOUNT BLOCKED");
                request.getRequestDispatcher("Login.jsp").forward(request, response);    
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
