package model;

import java.util.Date;
import java.util.List;

public class Orders {
    private int orderId;
    private String usermail;
    private String username;
    private String address;
    private String phoneNumber;
    private List<Product> lp;
    private int status;
    private Date orderDate;

    public Orders() {

    }

    public Orders(String usermail, String username, String address, int status) {
        this.usermail = usermail;
        this.username = username;
        this.address = address;
        this.status = status;

    }

    public Orders(String usermail, String username, String address, String phoneNumber, List<Product> lp, int status,
                  Date orderDate) {
        super();
        this.usermail = usermail;
        this.username = username;
        this.address = address;
        this.phoneNumber = phoneNumber;
        this.lp = lp;
        this.status = status;
        this.orderDate = orderDate;
    }

    public Orders(int orderId, String usermail, String username, String address, String phoneNumber, List<Product> lp, int status,
                 Date orderDate) {
        super();
        this.orderId = orderId;
        this.usermail = usermail;
        this.username = username;
        this.address = address;
        this.phoneNumber = phoneNumber;
        this.lp = lp;
        this.status = status;
        this.orderDate = orderDate;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public String getUsermail() {
        return usermail;
    }

    public void setUsermail(String usermail) {
        this.usermail = usermail;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public List<Product> getLp() {
        return lp;
    }

//	public void setLp(List<Product> lp) {
//		this.lp = lp;
//	}

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }


    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }


}