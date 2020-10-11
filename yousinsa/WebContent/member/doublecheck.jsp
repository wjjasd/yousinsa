<%@page import="bean.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%
    
    String user_id = request.getParameter("user_id");
    MemberDAO dao = new MemberDAO();
    int result = dao.read(user_id);
    
    String idcheck2 = "<font color=red size=2>중복된 아이디가 있습니다!</font>";
    if(result == 0){
    	 idcheck2 = "<font color=green size=2>사용 가능한 아이디입니다!</font>";
    }
    	    
    if(user_id.length() == 0){
    	idcheck2 = "";
    }else if(user_id.length() > 12){
    	idcheck2 = "<font color=red size=2>11자 이하로 만들어주세요!</font>";
    }else if(user_id.length() < 5){
    	idcheck2 = "<font color=red size=2>5자 이상으로 만들어주세요!</font>";
    }
    %><%= idcheck2 %>