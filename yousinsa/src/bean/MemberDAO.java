package bean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.DBConnectionMgr;

//CRUD중심으로 기능을 정의
//데이터와 관련된 작업(Data Access Object: DAO)
public class MemberDAO {
	DBConnectionMgr dbcp;
	Connection con;

	public MemberDAO() throws Exception {
		dbcp = DBConnectionMgr.getInstance();
		//여기에서 연결
		System.out.println("2. db연결 성공!");
	}
	
	
	// 회원가입
	public boolean create(MemberVO vo) throws Exception {
		con = dbcp.getConnection();
		// 3. sql문을 만든다.(create)
		String sql = "insert into member values (?,?,?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, vo.getUser_id());
		ps.setString(2, vo.getUser_password());
		ps.setString(3, vo.getUser_name());
		ps.setString(4, vo.getUser_email());
		ps.setString(5, vo.getUser_contact());
		ps.setString(6, vo.getUser_address());
		System.out.println("3. SQL생성 성공!");

		// 4. sql문은 전송
		int row = ps.executeUpdate();
		
		System.out.println("4. SQL문 전송 성공!");
		boolean result = false;
		if(row == 1) {
			result = true;
		}
		dbcp.freeConnection(con, ps);
		return result;

	}
	   //user_id로 유저정보 검색
	   public MemberVO searchUser(String user_id) throws Exception {
	      con = dbcp.getConnection();
	      
	      MemberVO vo = new MemberVO();
	      // 3. sql문을 만든다.(create)
	      String sql = "select * from member where user_id = ?";
	      PreparedStatement ps = con.prepareStatement(sql);
	      ps.setString(1, user_id);

	      // 4. sql문은 전송
	      ResultSet rs = ps.executeQuery();
	      System.out.println("4. SQL문 전송 성공.!!");
	      
	      if (rs.next()) { 
	         vo.setUser_id(rs.getString("user_id"));
	         vo.setUser_password(rs.getString("user_password"));
	         vo.setUser_name(rs.getString("user_name"));
	         vo.setUser_address(rs.getString("user_address"));
	         vo.setUser_contact(rs.getString("user_contact"));
	         vo.setUser_email(rs.getString("user_email"));
	         System.out.println("검색결과가 있어요.");
	      } else {
	         System.out.println("검색결과가 없어요.");
	      }
	      
	      dbcp.freeConnection(con, ps, rs);
	      return vo;
	   }
	
	// id중복체크
	public int read(String user_id) throws Exception {
		con = dbcp.getConnection();
		// 3. sql문을 만든다.(create)
		String sql = "select * from member where user_id = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, user_id);

		// 4. sql문은 전송
		ResultSet rs = ps.executeQuery();
		System.out.println("4. SQL문 전송 성공.!!");
		int result = 0;// 없음.
		if (rs.next()) { 
			System.out.println("검색결과가 있어요.");
			result = 1; // 있음.

		} else {
			System.out.println("검색결과가 없어요.");
		}
		
		dbcp.freeConnection(con, ps, rs);
		return result;
		// 0이 넘어가면, 검색결과 없음.
		// 1이 넘어가면, 검색결과 있음.
	}

	// id, pw맞는지 로그인 처리
	public int read(String user_id, String user_password) throws Exception {
		con = dbcp.getConnection();
		// 3. sql문을 만든다.(create)
		String sql = "select * from member where user_id = ? and user_password = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, user_id);
		ps.setString(2, user_password);

		// 4. sql문은 전송
		ResultSet rs = ps.executeQuery();
		System.out.println("4. SQL문 전송 성공.!!");
		
		int result = 0;// 로그인이 not!인 상태!
		if (rs.next()) { // 결과가 있는지 없는지 체크해주는 메서드
			System.out.println("로그인 ok.");
			result = 1; // 있음.
		} else {
			System.out.println("로그인 not.");
		}
		
		dbcp.freeConnection(con, ps, rs);
		
		return result;
		// 0면 로그인not.
		// 1면 로그인ok.
	}
	


	
}
