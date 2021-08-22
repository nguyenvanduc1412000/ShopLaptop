package controller;

import dal.CategoryDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.CartItem;
import model.Category;
import model.Item;
import model.Product;
import model.User;

/**
 *
 * @author asus
 */
@WebServlet(name = "Detail", urlPatterns = {"/detail"})
public class Detail extends HttpServlet {

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
        String id=request.getParameter("pid");
        int id_raw=Integer.parseInt(id);
        ProductDAO pd= new ProductDAO();
        CategoryDAO c= new CategoryDAO();
        List<Product> list=pd.getAll();
      
        List<Category> list1=c.getAllCat();
        //product newest
        Product last=pd.getLast();
        Product p=pd.getProductById(id_raw);
        request.setAttribute("dt", p);
        request.setAttribute("listP", list);
        request.setAttribute("listC", list1);
         request.setAttribute("p", last);
         //------------------
         HttpSession session =request.getSession(true);
       
       
        
        CartItem cart=null;
        Object o=session.getAttribute("cart");
        //co roi
        if(o!=null){
            cart=(CartItem)o;
        }else{
            cart=new CartItem();
        }
            String tnum=request.getParameter("num");
            String tid=request.getParameter("id");
            int num,id1;
            try{
               num=Integer.parseInt(tnum);
               id1=Integer.parseInt(tid);
               
               
               Product d=pd.getProductById(id1);
               //gia ban
               double price=d.getPrice()*1.2;
               Item t=new Item(d,num, price);
               cart.addItem(t);
            }catch(NumberFormatException e){
                num=1;
            }        
        List<Item> list3=cart.getItems();
        session.setAttribute("cart", cart);
        session.setAttribute("size", list3.size());
        request.getRequestDispatcher("Detail.jsp").forward(request, response);
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
