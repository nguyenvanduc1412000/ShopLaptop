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
public class Search extends HttpServlet {

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
        String PTid = request.getParameter("PTidSearch");
        String name = request.getParameter("txt");
        ProductDAO dao = new ProductDAO();
        int count = dao.countBySearchName(name);
        int size = 6;
        int endPage = count / size;
        if (count % size != 0) {
            endPage++;
        }
        if (PTid == null) {
            PTid = "1";
        }
        
        List<Product> list = dao.getProductIndexBySearchName(name, PTid);
//        if(dao.getProductIndexBySearchName(name, PTid).size()==null){
//            
//            request.setAttribute("mess", "Cant find product");
//            request.getRequestDispatcher("Home.jsp").forward(request, response);
//        }

        CategoryDAO c= new CategoryDAO();
        List<Category> list1=c.getAllCat();
        //product newest
        Product last=dao.getLast();
        
        //b2 set data to jsp
        
        request.setAttribute("endPageSearch", endPage);
        request.setAttribute("PTidSearch", PTid);
         request.setAttribute("txtS", name);
        request.setAttribute("listC", list1);
         request.setAttribute("p", last);
        request.setAttribute("listP", list);
        
        
//        request.setAttribute("txt1", txtSearch);
        request.getRequestDispatcher("Home.jsp").forward(request, response);
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
