package controllerAdmin;

import dao.IProductDAO;
import dao.impl.ProductDAO;
import model.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/AdminHomePage")
public class AdminHomePageServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       String action = request.getParameter("action");
       if(action == null){
           doGet_viewlist(request,response);
       }
       //Nếu action là update thì vào doGet_update xử lí
       else if(action.equalsIgnoreCase("updateProduct")){
           doGet_update(request,response);
       }
       //Nếu action là delete thì vào doGet_delete xử lí
      else if(action.equalsIgnoreCase("delete")){
            doGet_delete(request,response);
        }
    }
    protected void doGet_update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        IProductDAO productDAO = new ProductDAO();
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productDAO.findProductbyId(id);
        request.setAttribute("product1", product);
        request.getRequestDispatcher("/WEB-INF/admin/updateProduct.jsp").forward(request, response);
    }
    protected void doGet_delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idS = request.getParameter("id");
        int id = Integer.parseInt(idS);
        IProductDAO productDAO = new ProductDAO();
        if(productDAO.delete(id)){
            System.out.println("Xoa thanh cong");
            response.sendRedirect("AdminHomePage");
        }else{
            System.out.println("xoa that bai");
        }


   }
    protected void doGet_viewlist(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        IProductDAO productDAO = new ProductDAO();
        List<Product> products = productDAO.findAll();
        request.setAttribute("products", products);
        request.getRequestDispatcher("/WEB-INF/admin/adminProduct.jsp").forward(request, response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}