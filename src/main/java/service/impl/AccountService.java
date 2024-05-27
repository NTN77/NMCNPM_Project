package service.impl;

import dao.IAccountDAO;
import dao.impl.AccountDAO;
import model.Account;
import service.IAccountService;

public class AccountService implements IAccountService {
	private IAccountDAO accountDAO;
	
	public AccountService() {
		this.accountDAO = new AccountDAO();
	}

 	@Override
	public boolean login(String email, String password) {
		int count = this.accountDAO.checkLogin(email, password);
		if(count == 0) return false;
		else return true;
	}

	@Override
	public boolean exists(String email) {
		int count = this.accountDAO.exists(email);
		if(count == 0) return false;
		else return true;
	}

	@Override
	public void createAccount(Account account) {
		this.accountDAO.createAccount(account);		
	}

	@Override
	public int updateAccount(String email, String name, String address, String phone, String photo) {
		return this.accountDAO.updateAccount(email, name, address, phone, photo);
	}

	@Override
	public void updatePassword(String email, String password) {
		this.accountDAO.updatePassword(email, password);	
	}

	@Override
	public Account getAccountByEmail(String email) {
		return this.accountDAO.getAccountByEmail(email).get(0);
	}
}