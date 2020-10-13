<%@page import="bean.CartDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    //로그인 아이디 체크
    String user_id = null;
    if (session.getAttribute("user_id") != null) {
	user_id = (String) session.getAttribute("user_id");
	
    }
    %>
    
    <%
           int pid = Integer.parseInt(request.getParameter("pid"));
           int pcount = Integer.parseInt(request.getParameter("pcount"));
           CartDAO dao = new CartDAO();
           boolean result = dao.addItem(user_id, pid, pcount);
           if(result){
        	   response.sendRedirect("cart.jsp");
           }else{%>
        	 
        	  <script> alert("아이디와 비번을 다시 확인해 주세요."); history.go(-1);</script>
        	   
          <% }
           
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>