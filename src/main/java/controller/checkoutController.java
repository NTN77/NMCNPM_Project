package controller;

import dao.impl.OrdersDAO;
import model.Account;
import model.Cart;
import model.Orders;
import model.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@WebServlet(name= "PaymentController", value = "/checkout" )
public class checkoutController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession sessions = req.getSession();
        Account user = (Account) sessions.getAttribute("account");
        Cart cart = (Cart) sessions.getAttribute("cart");
        double total = cart.getTotalAmount();
        double grandTotal = total + 2;
        req.setAttribute("total", total);
        req.setAttribute("grandTotal", grandTotal);
            doPost(req, resp);
    }

    //
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession sessions = req.getSession();
        Account user = (Account) sessions.getAttribute("account");
        Cart cart = (Cart) sessions.getAttribute("cart");

        OrdersDAO orderZ = new OrdersDAO();
        List<Product> products = cart.getItems();
        req.setCharacterEncoding("UTF-8");
        String namePay = req.getParameter("namePay");
        String phonePay = req.getParameter("phonePay");
        String address = req.getParameter("address");


//check validation
        Map<String, String> errors = new HashMap<>();

        validateRequireField("namePay", namePay, "Tên hiển thị", errors);
        validateRequireField("phonePay", phonePay, "Số điện thoại", errors);
        validateRequireField("address", address, "Địa chỉ", errors);


        if (!errors.isEmpty()) {
            req.setAttribute("errors", errors);
            req.getRequestDispatcher("/WEB-INF/web/checkout.jsp").forward(req, resp);
        } else {

            Orders order = new Orders();
            order.setUsermail(user.getEmail());
            order.setUsername(namePay);
            order.setStatus(2);
            order.setPhoneNumber(phonePay);
            order.setAddress(address);

//           Xoasa sesion gio hàng
            Integer oID = orderZ.insertOrder(order);
            for(Product p : products){
                orderZ.insertOrdersDetail(oID,p.getId(),p.getNumber(),p.getPrice());
            }
            cart.clear();
            req.getSession().setAttribute("cart", cart);
            resp.sendRedirect("ListServlet");

        }
    }

    public static void validateRequireField(String fieldName, String value, String viewName, Map<String, String> errors) {
        if (value == null || value.trim().isEmpty()) {
            errors.put(fieldName, viewName + " không được bỏ trống");
        }
    }
}