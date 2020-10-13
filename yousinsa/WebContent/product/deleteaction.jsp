<%@page import="java.io.PrintWriter"%>
<%@page import="bean.ProductVO"%>
<%@page import="bean.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<%
	ProductVO vo = new ProductVO();
	int pid = Integer.parseInt(request.getParameter("pid"));
	
	
	ProductDAO dao = new ProductDAO();
	boolean result = dao.productdelete(pid);
%>




<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		//로그인 아이디 체크
		String user_id = null;
		if (session.getAttribute("user_id") != null) {
			user_id = (String) session.getAttribute("user_id");
			System.out.println(user_id);
		}

		
			PrintWriter script = response.getWriter();
			if (result == true) {
				script.print("<script>");
				script.println("location.href = 'productregister.jsp'");
				script.println("</script");
			}
		
	%>

</body>
</html>