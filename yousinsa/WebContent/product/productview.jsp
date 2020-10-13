<%@page import="java.util.List"%>
<%@page import="bean.ProductVO"%>
<%@page import="bean.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<%
		    String pname = request.getParameter("pname");
			ProductDAO dao = new ProductDAO();
			List<ProductVO> list = dao.productsearch2(pname);
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


<!-- Custom styles for this template -->
<link href="../css/shop-homepage.css" rel="stylesheet">
<link href="../css/register.css" rel="stylesheet">
</head>
<!-- Navigation -->
<header>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
		<div class="container">
			<a class="navbar-brand" href="#">YOUSINSA STORE</a>
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
					<li class="nav-item active"><a class="nav-link"
						href="index.jsp">홈<span class="sr-only">(current)qwe</span></a></li>
					<li class="nav-item"><a class="nav-link"
						href="bbs/allreview.jsp">구매후기</a></li>
					<%
						
					%>
					<li class="nav-item"><a class="nav-link"
						href="member/login.jsp">로그인</a></li>
					<li class="nav-item"><a class="nav-link" href="#">장바구니</a></li>
					<li class="nav-item"><a class="nav-link" href="#">결제내역</a></li>
					<li class="nav-item"><a class="nav-link" href="#">상품등록</a></li>
				</ul>
			</div>
		</div>
	</nav>
</header>
<main>
   <%
	  for (int i = 0; i < list.size(); i++) {
	     ProductVO vo = list.get(i); //검색
	%>

	<div class="container" id="productview">
		<div class="row">
			
				<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd; width:600px;">
					<thead>
						<tr>
							<th colspan="2" style="background-color: #eeeeeee; text-align: center;">상품정보</th>
						</tr>
					</thead>
					<tbody>
					    <tr>
							<td><h4>상품아이디</h4></td>
							<td> <%=vo.getProduct_id() %></td>
						</tr>
						<tr>
							<td><h4>상품이름</h4></td>
							<td> <%=vo.getProduct_name() %></td>
						</tr>
						<tr>
							<td><h4>상품종류</h4></td>
							<td><%=vo.getProduct_title() %></td>
						</tr>
						<tr>
							<td><h4>상품설명</h4></td>
							<td><%=vo.getProduct_explanation()%></td>
						</tr>
						<tr>
							<td><h4>상품가격</h4></td>
							<td><%=vo.getProduct_price() %>원</td>
						</tr>
						<tr>
							<td><h4>상품재고</h4></td>
							<td><%=vo.getProduct_inventory()%>개</td>
						</tr>
						<tr>
							<td><h4>이미지</h4></td>
							<td><img src=<%=vo.getProduct_image()%> style="width:350px; height:200px;"></td>
					    </tr>
							
					</tbody>
					
					
				</table>
				
	 </div>
		        <a href="productregister.jsp" class="btn btn-primary" >목록</a>
				<a href="update.jsp?pname=<%= vo.getProduct_name() %>" class="btn btn-primary" >수정</a>
				<a onclick="return confirm('정말로 삭제하시겠습니까?')" href="deleteaction.jsp?pid=<%= vo.getProduct_id() %>" class="btn btn-primary" >삭제</a>
					
				<%
	                }
				%>
	
	</div>

</main>



<!-- /.col-lg-3 -->

<footer class="py-5 bg-dark">
	<div class="container">
		<p class="m-0 text-center text-white">Copyright &copy; YOUSINSA 2020</p>
	</div>
</footer>



<!-- Bootstrap core JavaScript -->
<script src="../vendor/jquery/jquery.min.js"></script>
<script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>




<body>

</body>
</html>