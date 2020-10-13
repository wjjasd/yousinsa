<%@page import="bean.ProductVO"%>
<%@page import="java.util.List"%>
<%@page import="bean.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	ProductDAO dao = new ProductDAO();
    List<ProductVO> title = null;
    String category =  request.getParameter("category");
   
    String all= "전체상품";
    if(category.equals(all)){
    	title = dao.productallselect();
    }else{
    	title = dao.titlesearch(category);
    }
%>

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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('#psearch').click(function() {
			search2 = $('#txtsearch').val()
			location.href = "headersearch.jsp?search=" + search2
		})
		
	})
</script>
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
					<input type="text" id="txtsearch" class="form-control search-menu"
						placeholder="Search...">
					<div class="input-group-append">
						<span class="input-group-text"> <a id="psearch" class="fa fa-search"
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
					<li class="nav-item"><a class="nav-link" href="../index.jsp">홈<span
							class="sr-only">(current)</span></a></li>
					<li class="nav-item"><a class="nav-link"
						href="../bbs/allreview.jsp">구매후기</a></li>
					<%
						if (user_id == null) {
					%>
					<li class="nav-item"><a class="nav-link"
						href="../member/login.html">로그인</a></li>
					<%
						} else if (user_id.equals("admin")) {
					%>
					<li class="nav-item"><a class="nav-link" id="logout"
						href="../logout.jsp">로그아웃</a></li>
					<li class="nav-item"><a class="nav-link"
						href="cart.jsp">장바구니</a></li>
					<li class="nav-item"><a class="nav-link"
						href="paymenthistory.jsp">결제내역</a></li>
					<li class="nav-item"><a class="nav-link" href="#">상품등록</a></li>
					<%
						} else {
					%>
					<li class="nav-item"><a class="nav-link" id="logout"
						href="../logout.jsp">로그아웃</a></li>
					<li class="nav-item"><a class="nav-link"
						href="cart.jsp">장바구니</a></li>
					<li class="nav-item"><a class="nav-link"
						href="paymenthistory.jsp">결제내역</a></li>
					<%
						}
					%>
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
				<a href="categorysearch.jsp?category=전체상품" class="list-group-item">전체상품</a> 
				<a href="categorysearch.jsp?category=상의" class="list-group-item">상의</a> 
				<a href="categorysearch.jsp?category=하의" class="list-group-item">하의</a>
				<a href="categorysearch.jsp?category=원피스" class="list-group-item">원피스</a> 
				<a href="categorysearch.jsp?category=신발" class="list-group-item">신발</a> 
				<a href="categorysearch.jsp?category=가방" class="list-group-item">가방</a>
			</div>

		</div>
		
		

		
		<%
		   for (int i = 0; i < title.size(); i++) {
			     ProductVO vo = title.get(i); //카테고리 
		%>
		<div class="col-lg-3 col-md-6 mb-4 mt-3">
			<div class="card h-100">
				<a href="productdetail.jsp?product_name=<%=vo.getProduct_name()%>"><img style="width:254px; height:200px;" class="card-img-top" src=<%=vo.getProduct_image()%> alt=""></a>
				<div class="card-body">
					<h4 class="card-title">
				        <a href="productdetail.jsp?product_name=<%=vo.getProduct_name()%>"><%=vo.getProduct_name()%></a>
					</h4>
					<h5><%=vo.getProduct_price()%>원</h5>
					<p class="card-text"><%=vo.getProduct_explanation()%></p>
				</div>
				<div class="card-footer">
					<small class="text-muted"><%=vo.getProduct_title()%> 재고: <%=vo.getProduct_inventory()%>개</small>
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