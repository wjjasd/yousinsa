package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.DBConnectionMgr;

//CRUD중심으로 기능을 정의
//데이터와 관련된 작업(Data Access object:DAO)
public class ProductDAO {
	// 기능을 정의할때는 메서드(함수)를 사용
	// create메서드 호출시 입력 값을 받아주는 중간 매개체 역할의 변수
	// =>매개변수(parameter,파라메터)

	PreparedStatement ps;
	Connection con;
	ResultSet rs;
	DBConnectionMgr dbcp;

	public ProductDAO() throws Exception {
		dbcp = DBConnectionMgr.getInstance();
		System.out.println("2.db연결 성공!!");
	}

	

	// 상품 이름 검색
	public List<ProductVO> productsearch(String pname) throws Exception { // 파라미터 = 매개변수
		 con=dbcp.getConnection();
		// 가방을 넣는 컨테이너 역할을 하게 됨.!
		// <>안에는 컨테이너에 무엇을 넣을 지정!
		// 3. sql문을 만든다.
		String sql = "select product_name,product_title,product_explanation,product_price,product_inventory,product_image from product"
				      + " where product_name like '%" + pname + "%'";

		ps = con.prepareStatement(sql);
		// 4. sql문은 전송
		// select의 결과는 검색결과가 담긴 테이블(항목+내용)
		// 내용에는 없을 수도 있고, 많은 수도 있음.
		System.out.println("3.sql생성 성공!!");
		rs = ps.executeQuery();
		System.out.println("4. SQL문 전송 성공.!!");
		List<ProductVO> list = new ArrayList<ProductVO>();// 업캐스팅
		while (rs.next()) { // 결과가 있는지 없는지 체크해주는 메서드
			// Object(vo) Relational DB(row) Mapping(ORM) // row=한 행
			ProductVO bag = new ProductVO();// 가방만들어서,
			bag.setProduct_name(rs.getString("product_name"));
			bag.setProduct_title(rs.getString("product_title"));
			bag.setProduct_explanation(rs.getString("product_explanation"));
			bag.setProduct_price(rs.getInt("product_price"));
			bag.setProduct_inventory(rs.getInt("product_inventory"));
			bag.setProduct_image(rs.getString("product_image"));
			// 컨테이너 넣기
			list.add(bag);
		}
		dbcp.freeConnection(con,ps,rs);
		return list;
		// bag은 참조형 변수, 주소를 전달!
	}
	// 상품 아이디 검색
		public List<ProductVO> productsearch(int pid) throws Exception { // 파라미터 = 매개변수
			 con=dbcp.getConnection();
			// 가방을 넣는 컨테이너 역할을 하게 됨.!
			// <>안에는 컨테이너에 무엇을 넣을 지정!
			// 3. sql문을 만든다.
			String sql = "select product_id,product_name,product_title,product_explanation,product_price,product_inventory,product_image from product"
					      + " where product_id like " + pid + "%";

			ps = con.prepareStatement(sql);
			// 4. sql문은 전송
			// select의 결과는 검색결과가 담긴 테이블(항목+내용)
			// 내용에는 없을 수도 있고, 많은 수도 있음.
			System.out.println("3.sql생성 성공!!");
			rs = ps.executeQuery();
			System.out.println("4. SQL문 전송 성공.!!");
			List<ProductVO> list = new ArrayList<ProductVO>();// 업캐스팅
			while (rs.next()) { // 결과가 있는지 없는지 체크해주는 메서드
				// Object(vo) Relational DB(row) Mapping(ORM) // row=한 행
				ProductVO bag = new ProductVO();// 가방만들어서,
				bag.setProduct_id(rs.getString("product_id"));
				bag.setProduct_name(rs.getString("product_name"));
				bag.setProduct_title(rs.getString("product_title"));
				bag.setProduct_explanation(rs.getString("product_explanation"));
				bag.setProduct_price(rs.getInt("product_price"));
				bag.setProduct_inventory(rs.getInt("product_inventory"));
				bag.setProduct_image(rs.getString("product_image"));
				// 컨테이너 넣기
				list.add(bag);
			}
			dbcp.freeConnection(con,ps,rs);
			return list;
			// bag은 참조형 변수, 주소를 전달!
		}
	
		//상품 카테고리 검색
	public List<ProductVO> titlesearch(String ptitle) throws Exception { // 파라미터 = 매개변수
		con=dbcp.getConnection();
		// 가방을 넣는 컨테이너 역할을 하게 됨.!
		// <>안에는 컨테이너에 무엇을 넣을 지정!
		// 3. sql문을 만든다.
		String sql = "select product_name,product_title,product_explanation,product_price,product_inventory,product_image from product"
				      + " where product_title like '" + ptitle + "%'";

		ps = con.prepareStatement(sql);
		// 4. sql문은 전송
		// select의 결과는 검색결과가 담긴 테이블(항목+내용)
		// 내용에는 없을 수도 있고, 많은 수도 있음.
		System.out.println("3.sql생성 성공!!");
		rs = ps.executeQuery();
		System.out.println("4. SQL문 전송 성공.!!");
		List<ProductVO> list = new ArrayList<ProductVO>();// 업캐스팅
		while (rs.next()) { // 결과가 있는지 없는지 체크해주는 메서드
			// Object(vo) Relational DB(row) Mapping(ORM) // row=한 행
			ProductVO bag = new ProductVO();// 가방만들어서,
			bag.setProduct_name(rs.getString("product_name"));
			bag.setProduct_title(rs.getString("product_title"));
			bag.setProduct_explanation(rs.getString("product_explanation"));
			bag.setProduct_price(rs.getInt("product_price"));
			bag.setProduct_inventory(rs.getInt("product_inventory"));
			bag.setProduct_image(rs.getString("product_image"));
			// 컨테이너 넣기
			list.add(bag);
		}
		dbcp.freeConnection(con,ps,rs);
		return list;
		// bag은 참조형 변수, 주소를 전달!
	}

	
	// product 관리자(admin) CRUD

	public boolean productcreate(ProductVO bag) throws Exception {
		con=dbcp.getConnection();

		String sql = "insert into product values(?,?,?,?,?,?)";
		ps = con.prepareStatement(sql);
		ps.setString(1, bag.getProduct_name());
		ps.setString(2, bag.getProduct_title());
		ps.setString(3, bag.getProduct_explanation());
		ps.setInt(4, bag.getProduct_price());
		ps.setInt(5, bag.getProduct_inventory());
		ps.setString(6, bag.getProduct_image());
		System.out.println("3.sql생성 성공!!");
		// 4.sql문은 전송
		int row = ps.executeUpdate();
		System.out.println("4.sql문 전송 성공!!");
		boolean result = false;
		if (row == 1) {
			result = true;
		}
		dbcp.freeConnection(con,ps);
		return result;
	}
	
	// 전체 검색
		public List<ProductVO> productallselect() throws Exception {
			con=dbcp.getConnection();
			// 가방을 넣는 컨테이너 역할을 하게 됨.!
			// <>안에는 컨테이너에 무엇을 넣을 지정!
			// 3. sql문을 만든다.
			String sql = "select product_name,product_title,product_explanation,product_price,product_inventory,product_image from product";

			ps = con.prepareStatement(sql);
			// 4. sql문은 전송
			// select의 결과는 검색결과가 담긴 테이블(항목+내용)
			// 내용에는 없을 수도 있고, 많은 수도 있음.
			System.out.println("3.sql생성 성공!!");
			rs = ps.executeQuery();
			System.out.println("4. SQL문 전송 성공.!!");
			List<ProductVO> list = new ArrayList<ProductVO>();// 업캐스팅
			while (rs.next()) { // 결과가 있는지 없는지 체크해주는 메서드
				// Object(vo) Relational DB(row) Mapping(ORM) // row=한 행
				ProductVO bag = new ProductVO();// 가방만들어서,
				bag.setProduct_name(rs.getString("product_name"));
				bag.setProduct_title(rs.getString("product_title"));
				bag.setProduct_explanation(rs.getString("product_explanation"));
				bag.setProduct_price(rs.getInt("product_price"));
				bag.setProduct_inventory(rs.getInt("product_inventory"));
				bag.setProduct_image(rs.getString("product_image"));
				// 컨테이너 넣기
				list.add(bag);
			}
			dbcp.freeConnection(con,ps,rs);
			return list;
			// bag은 참조형 변수, 주소를 전달!
		}
		//조건이름 전체 검색
		public List<ProductVO> productallselect(String name) throws Exception {
			con=dbcp.getConnection();
			// 가방을 넣는 컨테이너 역할을 하게 됨.!
			// <>안에는 컨테이너에 무엇을 넣을 지정!
			// 3. sql문을 만든다.
			String sql = "select product_name,product_title,product_explanation,product_price,product_inventory,product_image from product"
					+ "where product_name";

			ps = con.prepareStatement(sql);
			// 4. sql문은 전송
			// select의 결과는 검색결과가 담긴 테이블(항목+내용)
			// 내용에는 없을 수도 있고, 많은 수도 있음.
			System.out.println("3.sql생성 성공!!");
			rs = ps.executeQuery();
			System.out.println("4. SQL문 전송 성공.!!");
			List<ProductVO> list = new ArrayList<ProductVO>();// 업캐스팅
			while (rs.next()) { // 결과가 있는지 없는지 체크해주는 메서드
				// Object(vo) Relational DB(row) Mapping(ORM) // row=한 행
				ProductVO bag = new ProductVO();// 가방만들어서,
				bag.setProduct_name(rs.getString("product_name"));
				bag.setProduct_title(rs.getString("product_title"));
				bag.setProduct_explanation(rs.getString("product_explanation"));
				bag.setProduct_price(rs.getInt("product_price"));
				bag.setProduct_inventory(rs.getInt("product_inventory"));
				bag.setProduct_image(rs.getString("product_image"));
				// 컨테이너 넣기
				list.add(bag);
			}
			dbcp.freeConnection(con,ps,rs);
			return list;
			// bag은 참조형 변수, 주소를 전달!
		}

	public boolean productupdate(ProductVO bag) throws Exception {
		con=dbcp.getConnection();

		String sql = "update product set product_title=?,product_explanation=?,product_price=?,product_inventory=?,produt_image=?"
				      + "where product_name=?";
		ps = con.prepareStatement(sql);
		ps.setString(1, bag.getProduct_title());
		ps.setString(2, bag.getProduct_explanation());
		ps.setInt(3, bag.getProduct_price());
		ps.setInt(4, bag.getProduct_inventory());
		ps.setString(5, bag.getProduct_image());
		ps.setString(6, bag.getProduct_name());

		System.out.println("3.sql생성 성공!!");
		// 4.sql문은 전송
		int row = ps.executeUpdate();
		System.out.println("4.sql문 전송 성공!!");
		dbcp.freeConnection(con,ps);
		boolean result = false;
		if (row == 1) {
			result = true;
		}
		return result;
	}

	// delete

	public boolean productdelete(String pid) throws Exception {
		con=dbcp.getConnection();

		String sql = "delete from product where product_id=?";
		ps = con.prepareStatement(sql);
		ps.setString(1, pid);
		System.out.println("3.SQL생성 성공");

		int row = ps.executeUpdate();
		System.out.println("4.SQL 전송 성공");
		dbcp.freeConnection(con,ps);
		boolean result = false;
		if (row == 1) {
			result = true;
		}
		return result;

	}

	

}
