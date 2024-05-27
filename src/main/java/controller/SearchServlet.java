package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Pagination;
import model.Product;
import service.IProductService;
import service.impl.ProductService;

@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final int PRODUCTS_PER_PAGE = 6;
	private static final int VISIBLE_PAGES = 5;
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
		String page = request.getParameter("currentPage");
		String name = request.getParameter("name");
		String action = request.getParameter("action");
		List<Product> listProduct = null;
		if(action == null || action.equals("")) {
			listProduct = new ArrayList<>();
		} else {
			if(action.equalsIgnoreCase("Search by name") || action.equalsIgnoreCase("Theo ten")) {
				listProduct = this.service.searchByName(name);
			} else if(action.equalsIgnoreCase("Search by description") || action.equalsIgnoreCase("Theo mo ta")) {
				listProduct = this.service.searchByDescription(name);
			} else if(action.equalsIgnoreCase("Search by price") || action.equalsIgnoreCase("Theo gia")) {
				listProduct = this.service.searchByPrice(name);
			} else if(action.equalsIgnoreCase("Search by brand") || action.equalsIgnoreCase("Theo thuong hieu")) {
				listProduct = this.service.searchByBrand(name);
			}
		}
		int totalPageSearch = (int) Math.ceil((double) listProduct.size() / PRODUCTS_PER_PAGE);
		Pagination pagination = new Pagination(PRODUCTS_PER_PAGE, listProduct);
		int currentPage = 1;
		if (page != null) {
			currentPage = Integer.parseInt(page);
		}
		int startPage = Math.max(currentPage - VISIBLE_PAGES / 2, 1);
		int endPage = Math.min(startPage + VISIBLE_PAGES - 1, totalPageSearch);
		List<Product> products = pagination.getProductPerPage(currentPage);
		
		HttpSession session = request.getSession(true);
		if (action.equals("search")) {
			session.setAttribute("words", name);
		} else {
			session.setAttribute("words", "");
		}
		session.setAttribute("action", action);
		session.setAttribute("name", name);
		session.setAttribute("currentPageSearch", currentPage);
		session.setAttribute("startPageSearch", startPage);
		session.setAttribute("endPageSearch", endPage);
		session.setAttribute("products_per_page", PRODUCTS_PER_PAGE);
		session.setAttribute("ProductSearch", products);
		session.setAttribute("totalPageSearch", totalPageSearch);
		request.getRequestDispatcher("/WEB-INF/web/home.jsp?page=search").forward(request, response);
	}
}