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
        if (action != null && action.equals("add")) {
            /**
             * Sequence diagram: AddCart - CNPM
             * 2.1.2: Product (is replied by ProductService)
             */
            Product p = this.service.getProductById(Integer.parseInt(id));
            Cart c = Cart.getInstance();
            /**
             * Sequence diagram: AddCart - CNPM
             * 1.1: doPost(page, action, id, quantityDetail) (is sent by product-detail.jsp)
             */
            String quantityDetail1 = request.getParameter("quantityDetail");
            if (quantityDetail1 == null || quantityDetail1.equals("")) {
                /**
                 * Sequence diagram: AddCart - CNPM
                 * 2.1: doPost(page, action, id) (is sent by home.jsp)
                 */
                quantityDetail1 = "1";
            }
            int quantityDetail = Integer.parseInt(quantityDetail1);
            if(quantityDetail==1) {
                c.add(new Product(p.getId(), p.getName(), p.getDescription(), p.getPrice(),
                        p.getSrc(), p.getType(), p.getBrand(), 1));
            } else {
                c.add(new Product(p.getId(), p.getName(), p.getDescription(), p.getPrice(),
                        p.getSrc(), p.getType(), p.getBrand(), quantityDetail));
            }
            /**
             * Sequence diagram: AddCart - CNPM
             * 2.1.5: setAttribute(cart) (self message)
             */
            session.setAttribute("cart", c);
            if(request.getParameter("page").equals("home")) {
                /**
                 * Sequence diagram: AddCart - CNPM
                 * 2.1.8: forward(request, response) (send to home.jsp)
                 */
                if(session.getAttribute("currentPageHome")!=null) {
                    response.sendRedirect("ListServlet?currentPage=" + session.getAttribute("currentPageHome"));
                } else {
                    response.sendRedirect("ListServlet");
                }
            } else if(request.getParameter("page").equals("detail")) {
                /**
                 * Sequence diagram: AddCart - CNPM
                 * 2.1.6: setAttribute(quantityDetail) (self message)
                 */
                session.setAttribute("quantityDetail", quantityDetail);
                /**
                 * Sequence diagram: AddCart - CNPM
                 * 2.1.7: forward(request, response) (send to product-detail.jsp)
                 */
                request.getRequestDispatcher("/WEB-INF/web/product-detail.jsp?productID=" + id).forward(request, response);
            } else if(request.getParameter("page").equals("search")) {
                /**
                 * Sequence diagram: AddCart - CNPM
                 * 2.1.8: forward(request, response) (send to home.jsp)
                 */
                if(session.getAttribute("currentPageSearch")!=null) {
                    response.sendRedirect("SearchServlet?action=" + session.getAttribute("action") + "&name=" + session.getAttribute("name") + "&currentPage=" + session.getAttribute("currentPageSearch"));
                } else {
                    response.sendRedirect("SearchServlet?action=" + session.getAttribute("action") + "&name=" + session.getAttribute("name"));
                }
            } else {
                request.getRequestDispatcher("/WEB-INF/web/cart.jsp").forward(request, response);
            }
        }
        /**
         * Sequence diagram: UpdateQuantity - CNPM
         * 3.1: doPost(action, id, pQuantity) (is sent by cart.jsp)
         */
        else if (action != null && action.equals("updateQuantity")) {
            int pQuantity = Integer.parseInt(request.getParameter("pQuantity"));
            /**
             * Sequence diagram: UpdateQuantity - CNPM
             * 3.1.2: Product (is replied by ProductService)
             */
            Product p = this.service.getProductById(Integer.parseInt(id));
            /**
             * Sequence diagram: UpdateQuantity - CNPM
             * 3.2: getAttribute(cart) (get from cart.jsp)
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
             * 3.2.3: setAttribute(cart) (self message)
             */
            session.setAttribute("cart", c);
            /**
             * Sequence diagram: UpdateQuantity - CNPM
             * 3.2.4: forward(request, response) (send to cart.jsp)
             */
            request.getRequestDispatcher("/WEB-INF/web/cart.jsp").forward(request, response);
        }
        /**
         * Sequence diagram: RemoveItem - CNPM
         * 4.1: doPost(action, id) (is sent by cart.jsp)
         */
        else if (action != null && action.equals("delete")) {
            /**
             * Sequence diagram: RemoveItem - CNPM
             * 4.2: getAttribute(cart) (get from cart.jsp)
             */
            Cart c = (Cart) session.getAttribute("cart");
            /**
             * Sequence diagram: RemoveItem - CNPM
             * 3.2.6: Product (is replied by ProductService)
             */
            Product p = this.service.getProductById(Integer.parseInt(id));
            c.remove(p);
            /**
             * Sequence diagram: RemoveItem - CNPM
             * 3.2.8: setAttribute(cart) (self message)
             */
            session.setAttribute("cart", c);
            /**
             * Sequence diagram: RemoveItem - CNPM
             * 3.2.9: forward(request, response) (send to cart.jsp)
             */
            request.getRequestDispatcher("/WEB-INF/web/cart.jsp").forward(request, response);
        }
    }
}