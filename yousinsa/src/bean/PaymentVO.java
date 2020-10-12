package bean;

import java.util.Date;

public class PaymentVO {
	
	private String payment_id;  			//결제아이디
	private String user_id;				//유저아이디
	private int payment_price;			//결제 총 금액
	private String payment_date;		//결제일
	private String payment_destination;	//배송지
	private int payment_delivery;		//배송상태 (-1:준비중, 0: 배송중, 1:배송완료)
	public String getPayment_id() {
		return payment_id;
	}
	public void setPayment_id(String payment_id) {
		this.payment_id = payment_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getPayment_price() {
		return payment_price;
	}
	public void setPayment_price(int payment_price) {
		this.payment_price = payment_price;
	}
	public String getPayment_date() {
		return payment_date;
	}
	public void setPayment_date(String payment_date) {
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
