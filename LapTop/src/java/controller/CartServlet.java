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
public class CartServlet extends HttpServlet {

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
            out.println("<title>Servlet BuyServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BuyServlet at " + request.getContextPath() + "</h1>");
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
       HttpSession session =request.getSession(true);
       User u = (User) request.getSession().getAttribute("acc");
//        String Fname = request.getParameter("Fname");
//             String Lname = request.getParameter("Lname");
//       
//             String phone = request.getParameter("phone");
//             String address = request.getParameter("address");
        if(u == null) {
            request.getRequestDispatcher("Login.jsp").forward(request, response);
            return;
        }
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
            int num,id;
            try{
               num=Integer.parseInt(tnum);
               id=Integer.parseInt(tid);
               
               ProductDAO pdb=new ProductDAO();
               Product p=pdb.getProductById(id);
               //gia ban
               double price=p.getPrice()*1.2;
               Item t=new Item(p,num, price);
               cart.addItem(t);
            }catch(NumberFormatException e){
                num=1;
            }        
        List<Item> list3=cart.getItems();
        session.setAttribute("cart", cart);
        session.setAttribute("size", list3.size());
         ProductDAO pdb=new ProductDAO();
         CategoryDAO c= new CategoryDAO();
        List<Product> list=pdb.getAll();
      
        List<Category> list1=c.getAllCat();
        //product newest
        Product last=pdb.getLast();
        
       String indexPage=request.getParameter("index");
        if(indexPage==null){
            indexPage="1";
        }
        int index=Integer.parseInt(indexPage);
        ProductDAO pd= new ProductDAO();
        int count=pd.gatTotalPage();//tong so trang
        int endPage=count/5;
        if(count % 5!=0){
            endPage++;
        }
        List<Product>list2=pdb.pagingProduct(index);
        request.setAttribute("endP", endPage);
        request.setAttribute("tag", index);
        
        //b2 set data to jsp
        request.setAttribute("listP", list2);
        request.setAttribute("listC", list1);
         request.setAttribute("p", last);
        request.getRequestDispatcher("Home.jsp").forward(request, response);
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
