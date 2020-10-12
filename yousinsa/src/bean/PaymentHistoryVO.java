package bean;

import java.sql.Date;

public class PaymentHistoryVO {
	
	private int cart_id;
	private String user_id;
	private int product_id;
	private int cart_pcount;
	private String cart_review_status;
	private String payment_id;
	private int payment_price;
	private Date payment_date;
	private String payment_destination;
	private int payment_delivery;
	public int getCart_id() {
		return cart_id;
	}
	public void setCart_id(int cart_id) {
		this.cart_id = cart_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public int getCart_pcount() {
		return cart_pcount;
	}
	public void setCart_pcount(int cart_pcount) {
		this.cart_pcount = cart_pcount;
	}
	public String getCart_review_status() {
		return cart_review_status;
	}
	public void setCart_review_status(String cart_review_status) {
		this.cart_review_status = cart_review_status;
	}
	public String getPayment_id() {
		return payment_id;
	}
	public void setPayment_id(String payment_id) {
		this.payment_id = payment_id;
	}
	public int getPayment_price() {
		return payment_price;
	}
	public void setPayment_price(int payment_price) {
		this.payment_price = payment_price;
	}
	public Date getPayment_date() {
		return payment_date;
	}
	public void setPayment_date(Date payment_date) {
		this.payment_date = payment_date;
	}
	public String getPayment_destination() {
		return payment_destination;
	}
	public void setPayment_destination(String payment_destination) {
		this.payment_destination = payment_destination;
	}
	public int getPayment_delivery() {
		return payment_delivery;
	}
	public void setPayment_delivery(int payment_delivery) {
		this.payment_delivery = payment_delivery;
	}
	
	

}
