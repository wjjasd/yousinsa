<%@page import="bean.CartDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int pid = Integer.parseInt(request.getParameter("pid"));
	String userId = (String)session.getAttribute("user_id");
	CartDAO dao = new CartDAO();
	dao.deleteItem(userId, pid);
	response.sendRedirect("cart.jsp");
%>