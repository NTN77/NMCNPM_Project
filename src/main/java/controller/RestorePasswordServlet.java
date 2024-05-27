package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Account;
import service.IAccountService;
import service.impl.AccountService;

@WebServlet("/RestorePasswordServlet")
public class RestorePasswordServlet extends HttpServlet {
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
		request.getRequestDispatcher("/WEB-INF/web/restorepassword.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		try {
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			if (!Account.validate(email, password)) {
				request.setAttribute("error", "Your password is invalid syntax.");
				request.getRequestDispatcher("/WEB-INF/web/restorepassword.jsp").forward(request, response);
			} else {
				this.service.updatePassword(email, password);
				request.setAttribute("success", "Restore password success.");
				request.getRequestDispatcher("/WEB-INF/web/login.jsp").forward(request, response);
			}
		} catch (NullPointerException e) {
			request.setAttribute("error", "Your path is null.");
			request.getRequestDispatcher("/WEB-INF/web/restorepassword.jsp").forward(request, response);
		}
	}
}