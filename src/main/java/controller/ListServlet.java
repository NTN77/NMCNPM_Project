package controller;

import model.Product;
import service.IProductService;
import service.impl.ProductService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

public class ListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final int VISIBLE_PAGES = 5;
	private int totalPageHome;
	private IProductService service;

	@Override
	public void init() throws ServletException {
		super.init();
		this.service = new ProductService();
		this.totalPageHome = this.service.getTotalPages();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession(true);
		Boolean loggedIn = (Boolean) session.getAttribute("isLoggedIn");
		String page = request.getParameter("page");
		if (loggedIn == null) {
			session.setAttribute("isLoggedIn", false);
		} else {
			session.setAttribute("isLoggedIn", (boolean) loggedIn);
		}	
		if (page == null || page.equals("home")) {
			int currentPage = 1;
			String numberPage = request.getParameter("currentPage");
			if (numberPage != null) {
				currentPage = Integer.parseInt(numberPage);
			}
			int startPage = Math.max(currentPage - VISIBLE_PAGES/2, 1);
			int endPage = Math.min(startPage + VISIBLE_PAGES - 1, totalPageHome);
			List<Product> products = this.service.getProductsPerPage(currentPage);
			session.setAttribute("words", "");
			session.setAttribute("currentPageHome", currentPage);
			session.setAttribute("startPageHome", startPage);
			session.setAttribute("endPageHome", endPage);
			session.setAttribute("products_per_page", this.service.getProductsPerPageConstant());
			session.setAttribute("ProductHome", products);
			session.setAttribute("totalPageHome", totalPageHome);
			request.getRequestDispatcher("/WEB-INF/web/home.jsp?page=home").forward(request, response);
		}
	}
}