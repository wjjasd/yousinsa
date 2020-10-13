<%@page import="java.util.List"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="bean.ProductVO"%>
<%@page import="bean.ProductDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.CartDAO"%>
<%@page import="com.sun.xml.internal.bind.v2.runtime.Location"%>
<%@page import="com.sun.java.swing.plaf.windows.resources.windows"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
//로그인 아이디 체크
String user_id = null;
if (session.getAttribute("user_id") != null) {
	user_id = (String) session.getAttribute("user_id");
	System.out.println(user_id);
	
}
//가격표시 포멧
DecimalFormat formatter = new DecimalFormat("###,###");

//최근등록상품검색
ProductDAO dao = new ProductDAO();
List<ProductVO> list = dao.recentimgsearch();

//판매량 높은 아이템 6개 검색
CartDAO cDao = new CartDAO();
ArrayList<Integer> mainListPid = (ArrayList<Integer>) cDao.getHeighScoreItems();
//상품정보 검색을 위한 DAO
ProductDAO pdao = new ProductDAO();
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {

		//로그아웃 클릭 이벤트
		$("#logout").click(function() {
			location.href = "logout.jsp"
		})

		//상단 메뉴바 검색아이콘 클릭이벤트
		$('#psearch').click(function() {
			search2 = $('#txtsearch').val()
			location.href = "product/headersearch.jsp?search=" + search2
		})
		//전체상품
		$('#allproduct').click(function() {
			location.href = "product/categorysearch.jsp?category=전체상품"
		})
		//상의
		$('#shirts').click(function() {
			location.href = "product/categorysearch.jsp?category=상의"
		})
		//하의
		$('#pants').click(function() {
			location.href = "product/categorysearch.jsp?category=하의"
		})
		//원피스
		$('#onepieces').click(function() {
			location.href = "product/categorysearch.jsp?category=원피스"
		})
		//신발
		$('#shoes').click(function() {
			location.href = "product/categorysearch.jsp?category=신발"
		})
		//가방
		$('#bags').click(function() {
			location.href = "product/categorysearch.jsp?category=가방"
		})

	})
</script>

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/shop-homepage.css" rel="stylesheet">

</head>

<body>

	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
		<div class="container">
			<a class="navbar-brand" href="#">YOUSINSA STORE</a>
			<!-- sidebar-search  -->
			<div class="sidebar-search">
				<div>
					<div class="input-group">
						<input id="txtsearch" type="text" class="form-control search-menu"
							placeholder="Search...">
						<div class="input-group-append">
							<span class="input-group-text"> <a id="psearch"
								class="fa fa-search" aria-hidden="true"> <svg width="1em"
										height="1em" viewBox="0 0 16 16" class="bi bi-search"
										fill="currentColor" xmlns="http://www.w3.org/2000/svg">
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
						href="index.jsp">홈<span class="sr-only">(current)</span></a></li>
					<li class="nav-item"><a class="nav-link"
						href="bbs/allreview.jsp">구매후기</a></li>
					<%
						if (user_id == null) {
					%>
					<li class="nav-item"><a class="nav-link"
						href="member/login.html">로그인</a></li>
					<%
						} else if (user_id.equals("admin")) {
					%>
					<li class="nav-item"><a class="nav-link" id="logout"
						href="logout.jsp">로그아웃</a></li>
					<li class="nav-item"><a class="nav-link"
						href="product/cart.jsp">장바구니</a></li>
					<li class="nav-item"><a class="nav-link"
						href="product/paymenthistory.jsp">결제내역</a></li>
					<li class="nav-item"><a class="nav-link" href="product/productregister.jsp">상품등록</a></li>
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

	<!-- Page Content -->
	<div class="container">

		<div class="row">

			<div class="col-lg-3">

				<div style="position: fixed; left: 0x; top: 60px; width: 250px; color: blue; cursor: pointer" class="list-group">
					<a id="allproduct" class="list-group-item">전체상품</a> <a id="shirts"
						class="list-group-item">상의</a> <a id="pants"
						class="list-group-item">하의</a> <a id="onepieces"
						class="list-group-item">원피스</a> <a id="shoes"
						class="list-group-item">신발</a> <a id="bags"
						class="list-group-item">가방</a>
				</div>

			</div>
			<!-- /.col-lg-3 -->

			<div class="col-lg-9">
			
				<h3 style="padding-top: 30px">유신사 신상품 프로모션</h3>

				<div style="background-color: gray;" id="carouselExampleIndicators" class="carousel slide my-4"
					data-ride="carousel">
					<ol class="carousel-indicators">
						<li data-target="#carouselExampleIndicators" data-slide-to="0"
							class="active"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
					</ol>
					<div class="carousel-inner" role="listbox">
						<div class="carousel-item active">
							<img style="display:block; margin:0 auto; width:600px; height:400px;" class="d-block img-fluid" src=<%=list.get(0).getProduct_image()%>
								alt="First slide">
						</div>
						<div class="carousel-item">
							<img style="display:block; margin:0 auto; width:600px; height:400px;" style="width:500px; height:400px;" class="d-block img-fluid" src=<%=list.get(1).getProduct_image()%>
								alt="Second slide">
						</div>
						<div class="carousel-item">
							<img style="display:block; margin:0 auto; width:600px; height:400px;" style="width:500px; height:400px;" class="d-block img-fluid" src=<%=list.get(2).getProduct_image()%>
								alt="Third slide">
						</div>
					</div>
					<a class="carousel-control-prev" href="#carouselExampleIndicators"
						role="button" data-slide="prev"> <span
						class="carousel-control-prev-icon" aria-hidden="true"></span> <span
						class="sr-only">Previous</span>
					</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
						role="button" data-slide="next"> <span
						class="carousel-control-next-icon" aria-hidden="true"></span> <span
						class="sr-only">Next</span>
					</a>
				</div>

				<h3 style="padding-bottom: 20px">유신사 TOP 12</h3>
				<div class="row">

					<%
						for (int i = 0; i < mainListPid.size(); i++) {
						ProductVO pVo =  pdao.productsearch(mainListPid.get(i));
					%>
					<!-- item -->
					<div class="col-lg-4 col-md-6 mb-4">
						<div class="card h-100">
							<a href="product/productdetail.jsp?product_name=<%=pVo.getProduct_name()%>">
							<img class="card-img-top" style="width:254px; height:200px;"
								src=<%=pVo.getProduct_image() %> alt=""></a>
							<div class="card-body">
								<h4 class="card-title">
									<a href="product/productdetail.jsp?product_name=<%=pVo.getProduct_name() %>"><%=pVo.getProduct_name() %></a>
								</h4>
								<h5><%=formatter.format(pVo.getProduct_price()) %>￦</h5>
								<p class="card-text"><%=pVo.getProduct_explanation() %></p>
							</div>
						</div>
					</div>
					<!-- item -->
					<%} %>
				</div>
				<!-- /.row -->

			</div>
			<!-- /.col-lg-9 -->

		</div>
		<!-- /.row -->

	</div>
	<!-- /.container -->

	<!-- Footer -->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; YOUSINSA
				2020</p>
		</div>
		<!-- /.container -->
	</footer>

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>



</body>


</html>