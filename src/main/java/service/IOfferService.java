package service;

public interface IOfferService {
	
	Integer addEmailOffer(String email);

	boolean existsEmailOffer(String email);
}
