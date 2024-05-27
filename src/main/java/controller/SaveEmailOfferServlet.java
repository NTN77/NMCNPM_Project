package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.IAccountService;
import service.IOfferService;
import service.impl.AccountService;
import service.impl.EmailOfferService;

@WebServlet("/SaveEmailOfferServlet")
public class SaveEmailOfferServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private IAccountService accountService;
	private IOfferService offerService;
	
	@Override
	public void init() throws ServletException {
		super.init();
		this.accountService = new AccountService();
		this.offerService = new EmailOfferService();
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("email");
		if (!this.offerService.existsEmailOffer(email) || !this.accountService.exists(email)) {
			this.offerService.addEmailOffer(email);
		}
		request.getRequestDispatcher("/WEB-INF/web/mailsuccess.jsp").forward(request, response);
	}
}