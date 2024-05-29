package dao.impl;

import dao.IOrdersDAO;
import model.Orders;

import java.time.LocalDate;

public class OrdersDAO extends AbstractDAO<Orders> implements IOrdersDAO {
//    public void addOrder(Orders order, Cart cart, Account user) {
//        if (order == null) {
//            throw new IllegalArgumentException("Order object is null");
//        }
//
//        LocalDate curDate = LocalDate.now();
//        String date = curDate.toString();
//
//        String sql = "insert into orders(user_email, user_name, order_status, order_discount_code, order_address) values(?,?,?,?,?)";
//        return insert(sql, o.getUsermail(), o.getUsername(), o.getStatus(), o.getDiscount(), o.getAddress());
//    }

    @Override
    public Integer insertOrder(Orders o) {
        LocalDate curDate = LocalDate.now();
        String date = curDate.toString();
        String sql = "insert into orders(user_email, user_name, order_status, order_address,order_date) values(?,?,?,?,?)";
        return insert(sql, o.getUsermail(), o.getUsername(), o.getStatus(), o.getAddress(),date);
    }

    @Override
    public Integer insertOrdersDetail(Integer orderId, int productId, int amount, double price) {
        String sql="insert into orders_detail(order_id, product_id, amount_product, price_product) values(?,?,?,?)";
        return insert(sql, orderId, productId, amount, price);
    }

    public static void main(String[] args) {
        OrdersDAO o = new OrdersDAO();
//        System.out.println(o.insertOrdersDetail(2,3,5,400));
    }
}
