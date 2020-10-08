package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;



public class CartDAO {

	// 커넥터 설정
	Connection con;
	DBConnectionMgr dbcp;

	public CartDAO() {

		dbcp = DBConnectionMgr.getInstance();
		System.out.println("1. connector 연결 성공");
		System.out.println("2. DB연결 성공");
	}

	// 장바구니 상품 추가
	public boolean addItem(String userId, int productId, int pcount) throws Exception {
		
		con = dbcp.getConnection();
		boolean result = false;
		String sql = "insert into carts values (null, ?, ?, ?, null, 'n')";
		PreparedStatement ps = con.prepareStatement(sql);
		// 4.sql문 실행
		ps.setString(1, userId);
		ps.setInt(2, productId);
		ps.setInt(3, pcount);
		int row = ps.executeUpdate();

		// 입력 성공
		if (row == 1) {
			result = true;
		}
		con.close();
		ps.close();

		dbcp.freeConnection(con,ps);
		return result;

	}

	// 사용자의 장바구니 내용검색
	public List<CartVO> getUserCart(String userId) throws Exception {

		con = dbcp.getConnection();
		List<CartVO> list = new ArrayList<>();
		String sql = "select * from carts where user_id = '" + userId + "' and payment_id is null";
		PreparedStatement ps = con.prepareStatement(sql);
		System.out.println("3. sql문 생성 성공!");

		// 4.sql문 실행
		ResultSet rs = ps.executeQuery();
		System.out.println("4. 네트워크로 전송 성공!");

		while (rs.next()) {
			CartVO vo = new CartVO();
			vo.setCart_id(rs.getInt("cart_id"));
			vo.setUser_id(rs.getString("user_id"));
			vo.setProduct_id(rs.getInt("product_id"));
			vo.setCart_pcount(rs.getInt("cart_pcount"));
			vo.setPayment_id(rs.getInt("payment_id"));
			vo.setCart_review_status(rs.getString("cart_id"));
			list.add(vo);
			System.out.println("장바구니 목록 불러오는중...");
		}
		con.close();
		ps.close();

		dbcp.freeConnection(con,ps,rs);
		return list;

	}

	// 사용자가 결제한 상품 검색
	public List<CartVO> getPaidItems(String userId) throws Exception {
		
		con = dbcp.getConnection();
		List<CartVO> list = new ArrayList<>();
		String sql = "select * from carts where user_id = '" + userId + "' and payment_id is not null";
		PreparedStatement ps = con.prepareStatement(sql);
		// 4.sql문 실행
		ResultSet rs = ps.executeQuery();
		System.out.println("4. 네트워크로 전송 성공!");
		
		while (rs.next()) {
			CartVO vo = new CartVO();
			vo.setCart_id(rs.getInt("cart_id"));
			vo.setUser_id(rs.getString("user_id"));
			vo.setProduct_id(rs.getInt("product_id"));
			vo.setCart_pcount(rs.getInt("cart_pcount"));
			vo.setPayment_id(rs.getInt("payment_id"));
			vo.setCart_review_status(rs.getString("cart_id"));
			list.add(vo);
			System.out.println("결제 목록 불러오는중...");
		}
		// 읽기 실패시 null 반환
		if (list.size() == 0) {
			list = null;
		}
		con.close();
		ps.close();

		dbcp.freeConnection(con,ps,rs);
		return list;

	}

	
	// 사용자가 결제한 상품 중 리뷰 안한 상품이름 검색
	public List<String> getNotReviewedItems(String userId) throws Exception {
		con = dbcp.getConnection();
		List<String> list = new ArrayList<>(); // 상품아이디로 검색한 상품 이름들 리스트
		String sql = "select product_id from carts where user_id = '" + userId
				+ "' and payment_id is not null and cart_review_status = 'n'";
		PreparedStatement ps = con.prepareStatement(sql);
		// 4.sql문 실행
		ResultSet rs = ps.executeQuery();
		System.out.println("4. 네트워크로 전송 성공!");
		
		ProductDAO pdao = new ProductDAO();
		int pindx = 0;
		while (rs.next()) {
			ArrayList<ProductVO> pList = (ArrayList<ProductVO>)pdao.productsearch(rs.getInt("product_id"));
			list.add(pList.get(pindx).getProduct_name());
			pindx++;
			System.out.println("리뷰할 아이템 목록 불러오는중...");
		}

		dbcp.freeConnection(con,ps,rs);
		return list;

	}

	// 장바구니 항목 삭제
	public boolean deleteItem(String userId, String productId) throws Exception {

		con = dbcp.getConnection();
		String sql = "delete from carts where user_id = '" + userId + "' and product_id = '" + productId + "'";
		PreparedStatement ps = con.prepareStatement(sql);
		System.out.println("3. sql문 생성 성공!");

		// 4.sql문 실행
		int row = ps.executeUpdate();
		System.out.println("4. 네트워크로 전송 성공!");

		boolean result = false;
		if (row == 1) {
			result = true;
		}

		con.close();
		ps.close();
		
		dbcp.freeConnection(con,ps);
		return result;

	}

	// 장바구니 수량 변경
	public boolean updatePcount(String userId, String productId, int pCount) throws Exception {

		con = dbcp.getConnection();
		String sql = "update carts set cart_pcount = " + pCount + "where user_id = '" + userId + "' and product_id = '"
				+ productId + "'";
		PreparedStatement ps = con.prepareStatement(sql);
		System.out.println("3. sql문 생성 성공!");

		// 4.sql문 실행
		int row = ps.executeUpdate();
		System.out.println("4. 네트워크로 전송 성공!");

		boolean result = false;
		if (row == 1) {
			result = true;
		}

		con.close();
		ps.close();

		dbcp.freeConnection(con,ps);
		return result;
	}

	// 장바구니 리뷰상태 변경
	public boolean updateReviewStatus(int cartId, char status) throws Exception {

		con = dbcp.getConnection();
		String sql = "update carts set cart_review_status = '" + status + "' where cart_id = '" + cartId + "'";
		PreparedStatement ps = con.prepareStatement(sql);
		System.out.println("3. sql문 생성 성공!");

		// 4.sql문 실행
		int row = ps.executeUpdate();
		System.out.println("4. 네트워크로 전송 성공!");

		boolean result = false;
		if (row == 1) {
			result = true;
		}

		con.close();
		ps.close();

		dbcp.freeConnection(con,ps);
		return result;

	}

}