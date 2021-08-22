package controller;

import dal.CategoryDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Category;
import model.Product;

/**
 *
 * @author asus
 */
public class CategoryControll extends HttpServlet {

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
            out.println("<title>Servlet CategoryController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CategoryController at " + request.getContextPath() + "</h1>");
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
        String PTid = request.getParameter("PTidCate");
        String cateID = request.getParameter("cid");
        ProductDAO dao = new ProductDAO();
        int count = dao.countByCid(cateID);
        int size = 6;
        int endPage = count / size;
        if (count % size != 0) {
            endPage++;
        }
        if (PTid == null) {
            PTid = "1";
        }
        request.setAttribute("endPageCate", endPage);
        request.setAttribute("PTidCate", PTid);
        List<Product> list2 = dao.getProductByCate(cateID, PTid);
//        take cid
       String cID=request.getParameter("id_cat");
//       load product by cid
        ProductDAO d= new ProductDAO();
          CategoryDAO c= new CategoryDAO();
        List<Product> list=d.getListProByCat(cID);
         List<Category> list1=c.getAllCat();
        //product newest
        Product last=d.getLast();
        request.setAttribute("listP", list2);
         request.setAttribute("cateID", cateID);
        request.setAttribute("listC", list1);
         request.setAttribute("p", last);
        request.setAttribute("tag", cateID);
        request.getRequestDispatcher("Home.jsp").forward(request, response);
       
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
