package dao;

import model.Orders;

public interface IOrdersDAO {
	
	Integer insertOrder(Orders o);
	
	Integer insertOrdersDetail(Integer orderId, int productId, int number, double price);

}