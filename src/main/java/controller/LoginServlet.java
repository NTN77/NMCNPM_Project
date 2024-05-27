package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Account;
import service.IAccountService;
import service.impl.AccountService;

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private IAccountService service;
	
	@Override
	public void init() throws ServletException {
		super.init();
		this.service = new AccountService();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		request.setAttribute("error", "");
		Cookie arr[] = request.getCookies();
		if (arr != null) {
			for (Cookie o : arr) {
				if (o.getName().equals("userC")) {
					request.setAttribute("username", o.getValue());
				}
				if (o.getName().equals("passC")) {
					request.setAttribute("password", o.getValue());
				}
			}
		}
		request.getRequestDispatcher("/WEB-INF/web/login.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		request.getSession(true).invalidate();
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String remember = request.getParameter("remember-me");
		
		if (!Account.validate(email, password)) {
			request.setAttribute("error", "Email or password is invalid syntax.");
			request.getRequestDispatcher("/WEB-INF/web/login.jsp").forward(request, response);
		} else if (!this.service.login(email, password)) {
			request.setAttribute("error", "Email or password is incorrect.");
			request.getRequestDispatcher("/WEB-INF/web/login.jsp").forward(request, response);
		} else {
			HttpSession session = request.getSession(true);
			Account account = this.service.getAccountByEmail(email);
			session.setAttribute("account", account);
			session.setAttribute("isLoggedIn", true);
			Cookie u = new Cookie("userC", account.getEmail());
			Cookie p = new Cookie("passC", account.getPwd());
			u.setMaxAge(30 * 24 * 60 * 60);
			if (remember != null) {
				p.setMaxAge(30 * 24 * 60 * 60);
			} else {
				p.setMaxAge(0);
			}
			response.addCookie(u);
			response.addCookie(p);
			if(account.getRole()==1) {
				response.sendRedirect("ListServlet");
			} else {
				response.sendRedirect("AdminHomePage");
			}
		}
	}
}