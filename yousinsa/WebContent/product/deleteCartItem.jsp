<%@page import="bean.CartDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int cid = Integer.parseInt(request.getParameter("cid"));
	CartDAO dao = new CartDAO();
	dao.deleteItem(cid);
	response.sendRedirect("cart.jsp");
%>