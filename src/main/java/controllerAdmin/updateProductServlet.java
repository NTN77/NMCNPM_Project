package controllerAdmin;

import dao.IProductDAO;
import dao.impl.ProductDAO;
import model.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;

@WebServlet("/updateProduct")
@MultipartConfig(maxFileSize = 1024 * 1024 * 5, maxRequestSize = 1024 * 1024 * 10, fileSizeThreshold = 1024 * 1024 * 10)
public class updateProductServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        int id = Integer.parseInt(req.getParameter("id"));
        IProductDAO productDAO = new ProductDAO();
        Product product = productDAO.findProductbyId(id);
        String name = req.getParameter("name");
        System.out.println(name);
        String description = req.getParameter("description");
        System.out.println(description);
        double price = Double.parseDouble(req.getParameter("price"));
        System.out.println(price);
        Part photo = req.getPart("photo");
        String src = UploadFileHelper.uploadFile("image",req,photo);
        System.out.println(photo);
        String type = req.getParameter("type");
        System.out.println(type);
        String brand = req.getParameter("brand");
        System.out.println(brand);

        product.setName(new String (name.getBytes("ISO-8859-1"),"UTF-8"));
        product.setDescription(new String (description.getBytes("ISO-8859-1"),"UTF-8"));
        product.setPrice(price);
        product.setSrc(src);
        product.setType(new String (type.getBytes("ISO-8859-1"),"UTF-8"));
        product.setBrand(new String (brand.getBytes("ISO-8859-1"),"UTF-8"));
//        Nếu update thành công thì trả về trang AdminHomePage và hiển thị sản phẩm đã được update
        if(productDAO.update(product)){
            resp.sendRedirect("AdminHomePage");
            System.out.println("Update thanh cong");
        }
        else {
            resp.sendRedirect("messageError");
            System.out.println("Update thất bại");
        }
    }
}
