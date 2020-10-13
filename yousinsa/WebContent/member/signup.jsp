<%@page import="bean.MemberVO"%>
<%@page import="bean.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
   	// 1. VO를 만들어서
   	MemberVO vo = new MemberVO();

   	// 2. 전달되는 값 받은 다음, VO에 넣어야 한다.
   	String user_id = request.getParameter("user_id");
   	String user_password = request.getParameter("user_password");
   	String user_name = request.getParameter("user_name");
   	String user_email = request.getParameter("user_email");
   	String user_contact = request.getParameter("user_contact");
   	String user_address = request.getParameter("user_address");
   	String user_address2 = request.getParameter("user_address2");
   	user_address2 = user_address2.replaceAll("\\s", "");
   	String user_address3 = request.getParameter("user_address3");

   	String user_address_total = user_address + " " + user_address2 + " "+ user_address3;
   	
   	vo.setUser_id(user_id);
   	vo.setUser_password(user_password);
   	vo.setUser_name(user_name);
   	vo.setUser_email(user_email);
   	vo.setUser_contact(user_contact);
   	vo.setUser_address(user_address_total);


   	// 3. DAO이용해서, insert처리함.
   	MemberDAO dao = new MemberDAO();
   	boolean result = dao.create(vo);

   	// 4. 처리결과를 client에게 알려주어야 함.
   	String check = "회원가입 실패!!";
   	if (result) {
   		check = "유신사 가입을 축하드립니다!^^";
   	}

   %><%= check %>

