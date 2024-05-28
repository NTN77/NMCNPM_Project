package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Cart;
import model.Product;
import service.IProductService;
import service.impl.ProductService;

@WebServlet("/AddToCartServlet")
public class AddToCartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private IProductService service;

    @Override
    public void init() throws ServletException {
        super.init();
        this.service = new ProductService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        request.getRequestDispatcher("/WEB-INF/web/cart.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");
        String id = request.getParameter("id");
        HttpSession session = request.getSession(true);
        /**
         * Sequence diagram: AddCart - CNPM
         * 1.1: addToCart(POST, action, id) (is sent by ProductDetailGUI)
         */
        if (action != null && action.equals("add")) {
            /**
             * Sequence diagram: AddCart - CNPM
             * 1.1.2: Product (is replied by ProductService)
             */
            Product p = this.service.getProductById(Integer.parseInt(id));
//			Cart c = (Cart) session.getAttribute("cart");
            Cart c = Cart.getInstance();
            c.add(new Product(p.getId(), p.getName(), p.getDescription(), p.getPrice(),
                    p.getSrc(), p.getType(), p.getBrand(), 1));
            /**
             * Sequence diagram: AddCart - CNPM
             * 1.1.5: setAttribute(cart) (self message)
             */
            session.setAttribute("cart", c);
            /**
             * Sequence diagram: AddCart - CNPM
             * 1.1.6: forward(request, response) (send to CartGUI)
             */
//            request.getRequestDispatcher("/WEB-INF/web/cart.jsp").forward(request, response);
            if(request.getParameter("page").equals("home")) {
                if(session.getAttribute("currentPageHome")!=null) {
                    response.sendRedirect("ListServlet?currentPage=" + session.getAttribute("currentPageHome"));
                } else {
                    response.sendRedirect("ListServlet");
                }
            } else if(request.getParameter("page").equals("detail")) {
                request.getRequestDispatcher("/WEB-INF/web/product-detail.jsp?productID=" + id).forward(request, response);
            } else {
                request.getRequestDispatcher("/WEB-INF/web/cart.jsp").forward(request, response);
            }
        }
        /**
         * Sequence diagram: UpdateQuantity - CNPM
         * 2.1: updateProductQuantity(POST, action, id, pQuantity) (is sent by CartGUI)
         */
        else if (action != null && action.equals("updateQuantity")) {
            int pQuantity = Integer.parseInt(request.getParameter("pQuantity"));
            /**
             * Sequence diagram: UpdateQuantity - CNPM
             * 2.1.2: Product (is replied by ProductService)
             */
            Product p = this.service.getProductById(Integer.parseInt(id));
            /**
             * Sequence diagram: UpdateQuantity - CNPM
             * 2.2: getAtrribute(cart) (self message)
             */
            Cart c = (Cart) session.getAttribute("cart");
            if (pQuantity > 0) {
                c.add(new Product(p.getId(), p.getName(), p.getDescription(), p.getPrice(),
                        p.getSrc(), p.getType(), p.getBrand(), p.getNumber()), pQuantity);
            } else if(pQuantity == 0) {
                c.remove(p);
            }
            /**
             * Sequence diagram: UpdateQuantity - CNPM
             * 2.1.4: setAttribute(cart) (self message)
             */
            session.setAttribute("cart", c);
            /**
             * Sequence diagram: UpdateQuantity - CNPM
             * 2.1.5: forward(request, response) (send to CartGUI)
             */
            request.getRequestDispatcher("/WEB-INF/web/cart.jsp").forward(request, response);
        }
        /**
         * Sequence diagram: RemoveItem - CNPM
         * 3.1: deleteURL(POST, action, id) (is sent by CartGUI)
         */
        else if (action != null && action.equals("delete")) {
            /**
             * Sequence diagram: RemoveItem - CNPM
             * 3.2: getAtrribute(cart) (self message)
             */
            Cart c = (Cart) session.getAttribute("cart");
            /**
             * Sequence diagram: RemoveItem - CNPM
             * 2.1.7: Product (is replied by ProductService)
             */
            Product p = this.service.getProductById(Integer.parseInt(id));
            c.remove(p);
            /**
             * Sequence diagram: RemoveItem - CNPM
             * 2.1.9: setAttribute(cart) (self message)
             */
            session.setAttribute("cart", c);
            /**
             * Sequence diagram: RemoveItem - CNPM
             * 2.1.10: forward(request, response) (send to CartGUI)
             */
            request.getRequestDispatcher("/WEB-INF/web/cart.jsp").forward(request, response);
        }
    }
}