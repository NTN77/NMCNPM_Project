package service;

public interface IDiscountService {
	
	double getDiscountPrice(String code);

	void updateDiscountNumber(String code);
	
	boolean exists(String code);
	
	boolean used(String code, String email);
}
