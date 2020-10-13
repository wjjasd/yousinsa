<%@page import="java.io.PrintWriter"%>
<%@page import="bean.ProductVO"%>
<%@page import="bean.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
	request.setCharacterEncoding("UTF-8");
%>



<%
    
	ProductVO vo = new ProductVO();
	int pid = Integer.parseInt(request.getParameter("product_id"));
	String pname = request.getParameter("product_name");
    String ptitle = request.getParameter("product_title");
	String pexp = request.getParameter("product_explanation");
	int pprice = Integer.parseInt(request.getParameter("product_price"));
	int pinventory = Integer.parseInt(request.getParameter("product_inventory"));
	
	vo.setProduct_id(pid);
	vo.setProduct_name(pname);
	vo.setProduct_title(ptitle);
	vo.setProduct_explanation(pexp);
	vo.setProduct_price(pprice);
	vo.setProduct_inventory(pinventory);
	
	

	ProductDAO dao = new ProductDAO();
	boolean result = dao.productupdate(vo);
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

	if (vo.getProduct_name() == null || vo.getProduct_title() == null || vo.getProduct_explanation() == null
			|| Integer.toString(vo.getProduct_price()) == null || Integer.toString(vo.getProduct_inventory()) == null) {

		PrintWriter script = response.getWriter();
		script.print("<script>");
		script.println("alert('수정이 안된 사항이 있습니다.')");
		
		script.println("history.back()");
		script.println("</script");
	} else {
		PrintWriter script = response.getWriter();
		if (result == true) {
			script.print("<script>");
			script.println("location.href = 'productregister.jsp'");
			script.println("</script");
		}
	}
	%>

</body>
</html>