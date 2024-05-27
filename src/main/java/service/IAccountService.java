package service;

import model.Account;

public interface IAccountService {
	
	boolean login(String email, String password);
	
	boolean exists(String email);
	
	void createAccount(Account account);
	
	int updateAccount(String email, String name, String address, String phone, String photo);
	
	void updatePassword(String email, String password);
	
	Account getAccountByEmail(String email);
}
