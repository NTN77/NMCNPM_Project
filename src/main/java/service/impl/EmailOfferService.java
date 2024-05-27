package service.impl;

import dao.IOfferDAO;
import dao.impl.EmailOfferDAO;
import service.IOfferService;

public class EmailOfferService implements IOfferService{
	private IOfferDAO offerDAO;
	
	
	public EmailOfferService() {
		this.offerDAO = new EmailOfferDAO();
	}

	@Override
	public Integer addEmailOffer(String email) {
		return this.offerDAO.addEmailOffer(email);
	}

	@Override
	public boolean existsEmailOffer(String email) {
		int count = this.offerDAO.existsEmailOffer(email);
		if(count == 0) return false;
		else return true;
	}
}