package bean;

import java.sql.Date;

public class ReviewVO {
	//private라고 쓰면, 이 클래스내에서만 변수에 접근해서 쓸 수 있음.
	private int review_num; 
	private String user_id;
	private int product_id;
	private String review_content;
	private Double review_score;
	private String review_date;
	
	
	public int getReview_num() {
		return review_num;
	}
	public void setReview_num(int review_num) {
		this.review_num = review_num;
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
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public Double getReview_score() {
		return review_score;
	}
	public void setReview_score(double d) {
		this.review_score = d;
	}
	public String getReview_date() {
		return review_date;
	}
	public void setReview_date(String review_date) {
		this.review_date = review_date;
	}

	
	
	}
