<%@page import="bean.MemberDAO"%><%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%
	String user_id = request.getParameter("user_id");
	String user_password = request.getParameter("user_password");
	MemberDAO dao = new MemberDAO();
	int result = dao.read(user_id, user_password);    
	String logincheck = "잘못된 아이디 혹은 비밀번호 입니다!";
	if(result == 1){
		logincheck = "로그인 성공!";
		session.setAttribute("user_id", user_id);
		response.sendRedirect("../index.jsp");
		}else{%>
	<script>
    	alert("아이디와 비번을 다시 확인해 주세요."); history.go(-1);
    	</script>
    <%}%>