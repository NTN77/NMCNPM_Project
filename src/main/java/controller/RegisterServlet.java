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

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
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
		request.setAttribute("error_register", "");
		request.setAttribute("error", "");
		request.getRequestDispatcher("/WEB-INF/web/register.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		String repeatPassword = request.getParameter("repeat-password");
		if (!password.equals(repeatPassword)) {
			request.setAttribute("error_register", "Password and repeat password are not same.");
			request.getRequestDispatcher("/WEB-INF/web/register.jsp").forward(request, response);
		} else if (!Account.validate(email, password)) {
			request.setAttribute("error_register", "Email or password is invalid syntax.");
			request.getRequestDispatcher("/WEB-INF/web/register.jsp").forward(request, response);
		} else if (this.service.exists(email)) {
			request.setAttribute("error_register", "Email existed.");
			request.getRequestDispatcher("/WEB-INF/web/register.jsp").forward(request, response);
		} else {
			this.service.createAccount(new Account(email, password, 1, name, address, phone));
			request.setAttribute("success", "Register success.");
			request.setAttribute("error_register", "");
			request.getRequestDispatcher("/WEB-INF/web/login.jsp").forward(request, response);
		}
	}
}