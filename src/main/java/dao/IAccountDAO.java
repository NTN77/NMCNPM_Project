package dao;

import java.util.List;

import model.Account;

public interface IAccountDAO extends GenericDAO<Account> {
	
	int checkLogin(String email, String password);
	
	int exists(String email);
	
	Integer createAccount(Account account);
	
	int updateAccount(String email, String name, String address, String phone, String photo);
	
	int updatePassword(String email, String password);
	
	List<Account> getAccountByEmail(String email);
	
}