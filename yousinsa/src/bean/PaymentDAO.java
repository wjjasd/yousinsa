package bean;

import java.sql.Connection;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.sql.Date;

public class PaymentDAO {

	// 커넥터 설정
	Connection con;
	DBConnectionMgr dbcp;

	public PaymentDAO() {

		dbcp = DBConnectionMgr.getInstance();
		System.out.println("1. connector 연결 성공");
		System.out.println("2. DB연결 성공");

	}

	// 결제 항목 추가
	public boolean addPayment(String userId, int price, Date date, String destination) throws Exception {
		con = dbcp.getConnection();
		boolean result = false;
		String sql = "insert into payments where values (null, ?, ?, ?, ?, 'n')";
		PreparedStatement ps = con.prepareStatement(sql);
		// 4.sql문 실행
		ps.setString(1, userId);
		ps.setInt(2, price);
		ps.setDate(3, date);
		ps.setString(4, destination);
		int row = ps.executeUpdate();

		if (row == 1) {
			result = true;
		}

		dbcp.freeConnection(con, ps);

		return result;

	}

	// 결제 내역 검색
	public List<PaymentHistoryVO> name(String userId) throws Exception {
		con = dbcp.getConnection();
		List<PaymentHistoryVO> list = new ArrayList<>();
		String sql = "select carts.cart_id, carts.user_id, carts.product_id, carts.cart_pcount, carts.cart_review_status,"
				+ "carts.payment_id, payments.payment_price, payments.payment_date, payments.payment_destination, "
				+ "payments.payment_delivery" + "from carts join payments "
				+ "where carts.payment_id = payments.payment_id and " + "carts.user_id = '" + userId + "'";
		PreparedStatement ps = con.prepareStatement(sql);
		// 4.sql문 실행
		ResultSet rs = ps.executeQuery();
		System.out.println("4. 네트워크로 전송 성공!");
		while (rs.next()) {
			PaymentHistoryVO vo = new PaymentHistoryVO();
			vo.setCart_id(rs.getInt("cart_id"));
			vo.setUser_id(rs.getString("user_id"));
			vo.setProduct_id(rs.getInt("product_id"));
			vo.setCart_pcount(rs.getInt("cart_pcount"));
			vo.setCart_review_status(rs.getString("cart_review_status"));
			vo.setPayment_id(rs.getInt("payment_id"));
			vo.setPayment_price(rs.getInt("payment_price"));
			vo.setPayment_date(rs.getDate("payment_date"));
			vo.setPayment_destination(rs.getString("payment_destination"));
			vo.setPayment_delivery(rs.getInt("payment_delivery"));
			list.add(vo);
			System.out.println("결제 목록 불러오는중...");
		}

		dbcp.freeConnection(con, ps);

		return list;

	}

}