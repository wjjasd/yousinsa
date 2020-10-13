<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="bean.ReviewProductVO"%>
<%@page import="bean.ReviewDAO"%>
<%@page import="bean.ReviewVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="bean.ProductDAO"%>
<%@page import="java.util.List"%>
<%@page import="bean.CartVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.CartDAO"%>
	
<%
//로그인 아이디 체크
	String user_id = null;
	if (session.getAttribute("user_id") != null) {
		user_id = (String) session.getAttribute("user_id");
		System.out.println(user_id);
}

%>

<%

	CartDAO cdao = new CartDAO();
	List<CartVO> clist = cdao.getNotReviewedItems(user_id);
	
%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>YOUSINSA</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">

	$(function() {

		/* 검색버튼이벤트처리 */
		
	})
	$(function() {
		
	$('#create').click(function(){
				$.ajax({
					url: "dyreviewwrite.jsp",
					data: {
						user_id: $('#user_id').text(),
						product: $('#product').val(),
						star: $('#star').val(),
						review_content: $('#review_content').val(),
					},
					success : function(check){
						document.location.href="allreview.jsp";
					}
				
				})//ajax
			});//click
	});//function


	</script>


<!-- Bootstrap core CSS -->
<link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="../css/reviewwrite.css" rel="stylesheet">

</head>

<body>

	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
		<div class="container">
			<a class="navbar-brand" href="#">YOUSINSA STORE</a>
			
				<div class="sidebar-search">
					<div>
						<div class="input-group">
							<input type="text" class="form-control search-menu"
								placeholder="Search...">
							<div class="input-group-append">
								<span class="input-group-text">
									<a class="fa fa-search" aria-hidden="true">
										<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-search" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  											<path fill-rule="evenodd" d="M10.442 10.442a1 1 0 0 1 1.415 0l3.85 3.85a1 1 0 0 1-1.414 1.415l-3.85-3.85a1 1 0 0 1 0-1.415z"/>
  											<path fill-rule="evenodd" d="M6.5 12a5.5 5.5 0 1 0 0-11 5.5 5.5 0 0 0 0 11zM13 6.5a6.5 6.5 0 1 1-13 0 6.5 6.5 0 0 1 13 0z"/>
										</svg>
									</a>
								</span>
							</div>
						</div>
					</div>
				</div>
			
			
			
			
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item">
						<a class="nav-link" href="../index.jsp">홈<span class="sr-only">(current)</span></a>
					</li>
					<li class="nav-item active"><a class="nav-link" href="allreview.jsp">구매후기</a></li>
						<%
						if (user_id == null) {
					%>
					<li class="nav-item"><a class="nav-link"
						href="../member/login.html">로그인</a></li>
					<%
						} else if (user_id.equals("admin")) {
					%>
					<li class="nav-item"><a class="nav-link" id="logout"
						href="index.jsp">로그아웃</a></li>
					<li class="nav-item"><a class="nav-link"
						href="product/cart.jsp">장바구니</a></li>
					<li class="nav-item"><a class="nav-link"
						href="product/paymenthistory.jsp">결제내역</a></li>
					<li class="nav-item"><a class="nav-link" href="#">상품등록</a></li>
					<%
						} else {
					%>
					<li class="nav-item"><a class="nav-link" id="logout"
						href="logout.jsp">로그아웃</a></li>
					<li class="nav-item"><a class="nav-link"
						href="product/cart.jsp">장바구니</a></li>
					<li class="nav-item"><a class="nav-link"
						href="product/paymenthistory.jsp">결제내역</a></li>
					<%
						}
					%>
				</ul>
			</div>
		</div>
	</nav>
	
	


	<div class="container">
	
		<div class="row">

		<table class="table table-striped" style="text-align:center; border:1px solid #dddddd; margin-top: 70px;">
		
		
		<tr>			
			<td class="col1"><b>상품명</b></td>
			<td class="selec" >
				<div>
				<select id="product" style="display: block; margin: 0 auto; text-align:center;">
			<% 
				ProductDAO pdao = new ProductDAO();
				for(int i = 0; i < clist.size(); i++){
				CartVO cvo = clist.get(i);
			%>
			
				<option style="text-align:center;" value="<%=(String)pdao.productnamesearch(cvo.getProduct_id()) %>">
				<%=(String)pdao.productnamesearch(cvo.getProduct_id()) %></option>
					<% } %>
					</select>
				</div>
			</td>
			
		</tr>
		

		
		
		<tr>
			<td class="col1"><b>작성자</b></td>
			<td class="col2"><div id="user_id" style=" border:0; outlnie:0; text-align: center; display: block; margin: 0 auto" ><%= session.getAttribute("user_id")%></div></td>
		</tr>
		
			
		
		<tr>	
			<td class="col1"><b>별점*</b></td>
	  		<td class="score">
	  		<input id="star" style="width: 300px; display: block; margin: 0 auto; text-align:center;" type="text" placeholder="0.5단위로 평가해주세요.ex)4.5"/>
	  		</td>
		</tr>

		<tr>
			<td class="col1"><b>내용*</b></td>
		    <td class="col2"><textarea class="review" id="review_content" required="" autofocus="" style="margin-left: 210px;"></textarea></td>
		</tr>
		
		<tr>
			<td class="col1"></td>
		    <td><input class="btn btn-primary pull-right" id="create" style="float: right; margin-right:20px;"type="submit"></td>
		    
    	</tr>
    	
</table>

			</div>
			</div>

	<!-- Page Content -->




			

	<!-- Footer -->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; YOUSINSA 2020</p>
		</div>
		<!-- /.container -->
	</footer>

	<!-- Bootstrap core JavaScript -->
	<script src="../vendor/jquery/jquery.min.js"></script>
	<script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	
	

</body>


</html>