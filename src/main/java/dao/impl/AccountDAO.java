package dao.impl;

import java.util.List;

import dao.IAccountDAO;
import mapper.AccountMapper;
import model.Account;

public class AccountDAO extends AbstractDAO<Account> implements IAccountDAO {

	@Override
	public int checkLogin(String email, String password) {
		String sql = "select count(*) as count from account where user_mail=? && password=?";
		return count(sql, email, password);
	}

	@Override
	public int exists(String email) {
		String sql = "select count(*) as count from account where user_mail=?";
		return count(sql, email);
	}

	@Override
	public Integer createAccount(Account account) {
		String sql = "insert into account(user_mail, password, account_role, user_name, user_address, user_phone) values(?,?,?,?,?,?)";
		return insert(sql, account.getEmail(), account.getPwd(), account.getRole(), 
						   account.getName(), account.getAddress(), account.getPhone());
	}

	@Override
	public int updateAccount(String email, String name, String address, String phone, String photo) {
		String sql = "update account set user_name=?, user_address=?, user_phone=?, user_photo=? where user_mail=?";
		return update(sql, name, address, phone, photo, email);
	}

	@Override
	public int updatePassword(String email, String password) {
		String sql = "update account set password=? where user_mail=?";
		return update(sql, password, email);
	}

	@Override
	public List<Account> getAccountByEmail(String email) {
		String sql = "select * from account where user_mail=?";
		return query(sql, new AccountMapper(), email);
	}
}