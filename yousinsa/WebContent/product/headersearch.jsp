<%@page import="bean.ProductVO"%>
<%@page import="java.util.List"%>
<%@page import="bean.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%  
    ProductDAO dao = new ProductDAO();
    String search = request.getParameter("search");
	List<ProductVO> list = dao.productsearch(search);
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
<link href="../css/productsearch.css" rel="stylesheet">
<link href="../css/shop-homepage.css" rel="stylesheet">
</head>
<!-- Navigation -->
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
				<li class="nav-item"><a class="nav-link" href="index.jsp">홈<span class="sr-only">(current)</span></a></li>
				<li class="nav-item"><a class="nav-link"
					href="bbs/allreview.jsp">구매후기</a></li>
				<%
					
				%>
				<li class="nav-item"><a class="nav-link" href="../member/login.jsp">로그인</a></li>
				<li class="nav-item"><a class="nav-link" href="#">장바구니</a></li>
				<li class="nav-item"><a class="nav-link" href="#">결제내역</a></li>
				<li class="nav-item"><a class="nav-link" href="#">상품등록</a></li>
			</ul>
		</div>
	</div>
</nav>

<main>
<!-- Page Content -->
<div class="container">

	<div class="row">

		<div class="col-lg-3 ">
       
			<div class="list-group">
				<a href="#" class="list-group-item">전체상품</a> 
				<a href="#" class="list-group-item">상의</a> 
				<a href="#" class="list-group-item">하의</a>
				<a href="#" class="list-group-item">원피스</a> 
				<a href="#" class="list-group-item">신발</a> 
				<a href="#" class="list-group-item">가방</a>
			</div>

		</div>
		
		

		<%
			for (int i = 0; i < list.size(); i++) {
			   ProductVO vo = list.get(i); //검색
		%>
		<div class="col-lg-3 col-md-6 mb-4 mt-3">
			<div class="card h-100">
				<a href="productdetail.jsp"><img class="card-img-top" src=<%=vo.getProduct_image()%> alt=""></a>
				<div class="card-body">
					<h4 class="card-title">
						<a href="productdetail.jsp"><%=vo.getProduct_name()%></a>
					</h4>
					<h5><%=vo.getProduct_price()%>원
					</h5>
					<p class="card-text"><%=vo.getProduct_explanation()%></p>
				</div>
				<div class="card-footer">
					<small class="text-muted"><%=vo.getProduct_title()%> <%=vo.getProduct_inventory()%>개</small>

				</div>
			</div>
		</div>
		<%
			}
		%>
		
		

    </div>
</div>
</main>

     

<!-- /.col-lg-3 -->

<!-- Footer -->

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