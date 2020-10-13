package bean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

//CRUD중심으로 기능을 정의
//데이터와 관련된 작업(Data Access Object: DAO)
public class ReviewDAO {
	
	// 커넥터 설정
	Connection con;
	DBConnectionMgr dbcp;

	public ReviewDAO() {

		dbcp = DBConnectionMgr.getInstance();
		System.out.println("1. connector 연결 성공");
		System.out.println("2. DB연결 성공");
	}
	
	// 게시판 작성
	public boolean create(ReviewVO vo) throws Exception {
		con = dbcp.getConnection();
		// 3. sql문을 만든다.(create)
		String sql = "insert into review values (null,?,?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ProductDAO pdao = new ProductDAO();
		
		ps.setString(1, vo.getUser_id());
		ps.setInt(2, vo.getProduct_id());
		ps.setDouble(3, vo.getReview_score());
		ps.setString(4, vo.getReview_date());
		ps.setString(5, vo.getReview_content());
		System.out.println("3. SQL생성 성공!");

		// 4. sql문은 전송
		int row = ps.executeUpdate();
		
		System.out.println("4. SQL문 전송 성공!");
		boolean result = false;
		if(row == 1) {
			result = true;
		}
		dbcp.freeConnection(con,ps);
		return result;

	}
		
		// 전체 검색
			public ArrayList<ReviewProductVO> all() throws Exception {
				con = dbcp.getConnection();
				// 3. sql문을 만든다.(create)
				String sql = "select r.review_num, p.product_id, r.review_content, r.review_score,"
						+ "r.user_id, r.review_date from review r join product p on r.product_id = p.product_id "
						+ "order by r.review_num";
				PreparedStatement ps = con.prepareStatement(sql);
					
				// 4. sql문은 전송
				ResultSet rs = ps.executeQuery();
				System.out.println("4. SQL문 전송 성공.!!");
					
				ArrayList<ReviewProductVO> list = new ArrayList<ReviewProductVO>();
				ProductDAO pdao = new ProductDAO();
				
				while(rs.next()) { 
					ReviewProductVO bag = new ReviewProductVO(); //가방 만들기
					//가방에 넣기
					bag.setReview_num(rs.getInt("review_num"));
					bag.setProduct_name(pdao.productnamesearch(rs.getInt("product_id")));
					bag.setReview_content(rs.getString("review_content"));
					bag.setReview_score(rs.getDouble("review_score"));
					bag.setUser_id(rs.getString("user_id"));
					bag.setReview_date(rs.getDate("review_date"));
					//컨테이너에 가방 넣기
					list.add(bag);

				} 
				dbcp.freeConnection(con,ps,rs);
				return list;
				
			}
			
	

}
