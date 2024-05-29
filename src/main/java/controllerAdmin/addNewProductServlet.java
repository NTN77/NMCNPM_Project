package controllerAdmin;

import dao.IProductDAO;
import dao.impl.ProductDAO;
import model.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/addNewProduct")
@MultipartConfig(maxFileSize = 1024 * 1024 * 5, maxRequestSize = 1024 * 1024 * 10, fileSizeThreshold = 1024 * 1024 * 10)
public class addNewProductServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       String action = req.getParameter("action");
       if ( action == null) {
           doGet_upload(req,resp);
       }
    }
    protected void doGet_upload(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/admin/addnewProduct.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if(action.equalsIgnoreCase("addnewproduct")){
            doPost_upload(req,resp);
        }
    }
    protected void doPost_upload(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        IProductDAO productDAO = new ProductDAO();
        Product product = new Product();
        String name = req.getParameter("name");
        String description = req.getParameter("description");
        double price = Double.parseDouble(req.getParameter("price"));
        Part photo = req.getPart("photo");
        String src = UploadFileHelper.uploadFile("image",req,photo);
        System.out.println(src);
        System.out.println(photo);
        String type = req.getParameter("type");
        String brand = req.getParameter("brand");

        product.setName(new String (name.getBytes("ISO-8859-1"),"UTF-8"));
        product.setDescription(new String (description.getBytes("ISO-8859-1"),"UTF-8"));
        product.setPrice(price);
        product.setSrc(src);
        product.setType(new String (type.getBytes("ISO-8859-1"),"UTF-8"));
        product.setBrand(new String (brand.getBytes("ISO-8859-1"),"UTF-8"));
        //Tao thanh cong thi gui ve lai trang adminHomePage
        if(productDAO.create(product)) {
            System.out.println("them san pham thanh cong");
            resp.sendRedirect("AdminHomePage");
        } else {
            //Create that bai thi gui ve trang messageError
            HttpSession session = req.getSession();
            System.out.println("them san pham that bai");
            session.setAttribute("responUri", "addNewProduct");
            resp.sendRedirect("messageError");
        }
    }


}
