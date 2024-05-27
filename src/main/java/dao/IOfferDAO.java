package dao;

import model.EmailOffer;

public interface IOfferDAO extends GenericDAO<EmailOffer> {
	
	Integer addEmailOffer(String email);
	
	int existsEmailOffer(String email);
}
