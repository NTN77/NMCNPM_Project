package dao.impl;

import dao.IOfferDAO;
import model.EmailOffer;

public class EmailOfferDAO extends AbstractDAO<EmailOffer> implements IOfferDAO {

	@Override
	public Integer addEmailOffer(String email) {
		String sql="insert into email_offer(email) values(?)";
		return insert(sql, email);
	}

	@Override
	public int existsEmailOffer(String email) {
		String sql="select count(*) as count from email_offer where email=?";
		return count(sql, email);
	}
}