package controller;

import model.Account;
import model.Cart;
import model.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(value = "/checkoutPage")
public class checkout extends HttpServlet {
//    private IOrdersService orderService;
//
//    @Override
//    public void init() throws ServletException {
//        super.init();
//        this.orderService = new OrdersService();
//    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession sessions = req.getSession();
        Account user = (Account) sessions.getAttribute("account");
        Cart c = (Cart) sessions.getAttribute("cart");
        if (user == null) {
            resp.sendRedirect("LoginServlet");
        } else {
            List<Product> products = c.getItems();
//            this.orderService.insertOrder(new Orders(user.getEmail(), name, address, phone, products, 2, null));
            double total = c.getTotalAmount();
            double grandTotal = total + 2;
            req.setAttribute("total", total);
            req.setAttribute("grandTotal", grandTotal);
            req.getRequestDispatcher("/WEB-INF/web/checkout.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
