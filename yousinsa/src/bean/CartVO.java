package bean;

public class CartVO {
	
	private int cart_id;				//장바구니 레코드 식별자
	private String user_id;				//장바구니의 주인
	private int product_id;			//장바구니에 담긴 상품 식별자
	private int cart_pcount;			//상품의 수량
	private String payment_id;				//상품의 결제 여부&id, null인경우 미결제
	private String cart_review_status;	//상품의 리부 여부 default 'n' == 쓰여지지 않음
	
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
	public String getPayment_id() {
		return payment_id;
	}
	public void setPayment_id(String payment_id) {
		this.payment_id = payment_id;
	}
	public String getCart_review_status() {
		return cart_review_status;
	}
	public void setCart_review_status(String cart_review_status) {
		this.cart_review_status = cart_review_status;
	}

}
