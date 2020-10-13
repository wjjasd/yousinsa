<%@page import="bean.ProductVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<%
    //로그인 아이디 체크
    String user_id = null;
    if (session.getAttribute("user_id") != null) {
	user_id = (String) session.getAttribute("user_id");
	System.out.println(user_id);
}
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>YOUSINSA STORE</title>
<!-- Bootstrap core CSS -->
<link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="../css/shop-homepage.css" rel="stylesheet">
<link href="../css/register.css" rel="stylesheet">
</head>
<!-- Navigation -->
<header>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
		<div class="container">
			<a class="navbar-brand" href="../index.jsp">YOUSINSA STORE</a>
			<!-- sidebar-search  -->
			<div class="sidebar-search">
				<div>
					<div class="input-group">
						<input type="text" class="form-control search-menu"
							placeholder="Search...">
						<div class="input-group-append">
							<span class="input-group-text"> <a class="fa fa-search"
								aria-hidden="true"> <svg width="1em" height="1em"
										viewBox="0 0 16 16" class="bi bi-search" fill="currentColor"
										xmlns="http://www.w3.org/2000/svg">
  											<path fill-rule="evenodd"
											d="M10.442 10.442a1 1 0 0 1 1.415 0l3.85 3.85a1 1 0 0 1-1.414 1.415l-3.85-3.85a1 1 0 0 1 0-1.415z" />
  											<path fill-rule="evenodd"
											d="M6.5 12a5.5 5.5 0 1 0 0-11 5.5 5.5 0 0 0 0 11zM13 6.5a6.5 6.5 0 1 1-13 0 6.5 6.5 0 0 1 13 0z" />
										</svg>
							</a>
							</span>
						</div>
					</div>
				</div>
			</div>
			<!-- sidebar-search  -->
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link"
						href="../index.jsp">홈<span class="sr-only"></span></a></li>
					<li class="nav-item"><a class="nav-link"
						href="..bbs/allreview.jsp">구매후기</a></li>
					<%
						if (user_id == null) {
					%>
					<li class="nav-item"><a class="nav-link"
						href="member/login.html">로그인</a></li>
					<%
						} else if (user_id.equals("admin")) {
					%>
					<li class="nav-item"><a class="nav-link" id="logout"
						href="../index.jsp">로그아웃</a></li>
					<li class="nav-item"><a class="nav-link"
						href="cart.jsp">장바구니</a></li>
					<li class="nav-item"><a class="nav-link"
						href="paymenthistory.jsp">결제내역</a></li>
					<li class="nav-item active"><a class="nav-link" href="product/productregister.jsp">상품등록</a></li>
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
</header>
<main>

	<div class="container" id="productview">
		<div class="row">
		<div align="right">
				<a href="register.jsp" class="btn btn-primary">상품등록</a>
        </div>
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">상품ID</th>
						<th style="background-color: #eeeeee; text-align: center;">상품이미지</th>
						<th style="background-color: #eeeeee; text-align: center;">상품명</th>
						<th style="background-color: #eeeeee; text-align: center;">가격</th>

					</tr>
				</thead>
				<tbody>
					<%
						ProductDAO dao = new ProductDAO();
						ArrayList<ProductVO> list = dao.getList();
								for (int i = 0; i < list.size(); i++) {
					%>
					<tr>
						<td><%=list.get(i).getProduct_id()%></td>
						<td><img src=<%=list.get(i).getProduct_image()%> style="width:200px; height:150px;"></td>
						<td><a href="productview.jsp?pname=<%=list.get(i).getProduct_name()%>"> <%=list.get(i).getProduct_name()%></a></td>
						<td><%=list.get(i).getProduct_price()%>원</td>
					</tr>
					<%
						} 
					%>

				</tbody>

			</table>
			
			


		</div>
	</div>

</main>



<!-- /.col-lg-3 -->

<footer class="py-5 bg-dark">
	<div class="container">
		<p class="m-0 text-center text-white">Copyright &copy; YOUSINSA
			2020</p>
	</div>
</footer>



<!-- Bootstrap core JavaScript -->
<script src="../vendor/jquery/jquery.min.js"></script>
<script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>




<body>

</body>
</html>