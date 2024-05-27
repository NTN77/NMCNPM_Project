package mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import model.Account;

public class AccountMapper implements RowMapper<Account> {

	@Override
	public Account mapRow(ResultSet resultSet) {
		try {
			Account account = new Account();
			account.setEmail(resultSet.getString("user_mail"));
			account.setPwd(resultSet.getString("password"));
			account.setRole(resultSet.getInt("account_role"));
			account.setName(resultSet.getString("user_name"));
			account.setAddress(resultSet.getString("user_address"));
			account.setPhone(resultSet.getString("user_phone"));
			account.setPhoto(resultSet.getString("user_photo"));
			return account;
		} catch (SQLException e) {
			return null;
		}
	}
}