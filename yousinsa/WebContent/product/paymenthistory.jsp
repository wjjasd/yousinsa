<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
//로그인 아이디 체크
String user_id = null;
try {
	user_id = (String) session.getAttribute("user_id");
	System.out.print(user_id);
} catch (Exception e) {
	user_id = null;
}

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

		/* 검색버튼이벤트처리 */

	})
</script>

<!-- Bootstrap core CSS -->
<link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="../css/shop-homepage.css" rel="stylesheet">
<link href="../css/cart.css" rel="stylesheet">
<link href="../css/paymenthistory.css" rel="stylesheet">
</head>
<body>

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
					<li class="nav-item"><a class="nav-link" href="../index.jsp">홈<span
							class="sr-only">(current)</span></a></li>
					<li class="nav-item"><a class="nav-link"
						href="bbs/allreview.jsp">구매후기</a></li>
					<%
						if (user_id == null) {
					%>
					<li class="nav-item"><a class="nav-link"
						href="member/login.jsp">로그인</a></li>
					<%
						} else if (user_id == "admin") {
					%>
					<li class="nav-item"><a class="nav-link" id="logout"
						href="index.jsp">로그아웃</a></li>
					<li class="nav-item"><a class="nav-link"
						href="cart.jsp">장바구니</a></li>
					<li class="nav-item  active"><a class="nav-link"
						href="paymenthistory.jsp">결제내역</a></li>
					<li class="nav-item"><a class="nav-link" href="#">상품등록</a></li>
					<%
						} else {
					%>
					<li class="nav-item"><a class="nav-link" id="logout"
						href="index.jsp">로그아웃</a></li>
					<li class="nav-item"><a class="nav-link"
						href="cart.jsp">장바구니</a></li>
					<li class="nav-item  active"><a class="nav-link"
						href="paymenthistory.jsp">결제내역</a></li>
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
			<!-- 결제건1 -->
			<div
				class="offset-xl-2 col-xl-8 col-lg-12 col-md-12 col-sm-12 col-12 padding">
				<div class="card">
					<div class="card-header p-4">
						<h3 class="mb-0">결제일 2020.09.28</h3>
						<div class="float-right">결제번호 #BBB10234</div>
					</div>
					<div class="card-body">
						<div class="row mb-4">
							<div class="col-sm-6">
								<h5 class="mb-3">From:</h5>
								<h3 class="text-dark mb-1">YOUSINSA STORE</h3>
								<div>29, Singla Street</div>
								<div>Sikeston,New Delhi 110034</div>
								<div>Email: contact@bbbootstrap.com</div>
								<div>Phone: +91 9897 989 989</div>
							</div>
							<div class="col-sm-6 ">
								<h5 class="mb-3">To:</h5>
								<h3 class="text-dark mb-1">유저이름</h3>
								<div>478, Nai Sadak</div>
								<div>Chandni chowk, New delhi, 110006</div>
								<div>Email: info@tikon.com</div>
								<div>Phone: +91 9895 398 009</div>
							</div>
						</div>
						<div class="table-responsive-sm">
							<table class="table table-striped">
								<thead>
									<tr>
										<th class="center">#</th>
										<th>Item</th>
										<th>Description</th>
										<th class="right">Price</th>
										<th class="center">Qty</th>
										<th class="right">Total</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="center">1</td>
										<td class="left strong">Iphone 10X</td>
										<td class="left">Iphone 10X with headphone</td>
										<td class="right">$1500</td>
										<td class="center">10</td>
										<td class="right">$15,000</td>
									</tr>
									<tr>
										<td class="center">2</td>
										<td class="left">Iphone 8X</td>
										<td class="left">Iphone 8X with extended warranty</td>
										<td class="right">$1200</td>
										<td class="center">10</td>
										<td class="right">$12,000</td>
									</tr>
									<tr>
										<td class="center">3</td>
										<td class="left">Samsung 4C</td>
										<td class="left">Samsung 4C with extended warranty</td>
										<td class="right">$800</td>
										<td class="center">10</td>
										<td class="right">$8000</td>
									</tr>
									<tr>
										<td class="center">4</td>
										<td class="left">Google Pixel</td>
										<td class="left">Google prime with Amazon prime
											membership</td>
										<td class="right">$500</td>
										<td class="center">10</td>
										<td class="right">$5000</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="row">
							<div class="col-lg-4 col-sm-5"></div>
							<div class="col-lg-4 col-sm-5 ml-auto">
								<table class="table table-clear">
									<tbody>
										<tr>
											<td class="left"><strong class="text-dark">Total</strong>
											</td>
											<td class="right"><strong class="text-dark">$20,744,00</strong>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<div class="card-footer bg-white">
						<h3 class="mb-0">배송완료</h3>
					</div>
				</div>
			</div>
			
			<br><!-- 결제건2 -->
			
			<div
				class="offset-xl-2 col-xl-8 col-lg-12 col-md-12 col-sm-12 col-12 padding">
				<div class="card">
					<div class="card-header p-4">
						<h3 class="mb-0">결제일 2020.09.27</h3>
						<div class="float-right">결제번호 #BBB10233</div>
					</div>
					<div class="card-body">
						<div class="row mb-4">
							<div class="col-sm-6">
								<h5 class="mb-3">From:</h5>
								<h3 class="text-dark mb-1">YOUSINSA STORE</h3>
								<div>29, Singla Street</div>
								<div>Sikeston,New Delhi 110034</div>
								<div>Email: contact@bbbootstrap.com</div>
								<div>Phone: +91 9897 989 989</div>
							</div>
							<div class="col-sm-6 ">
								<h5 class="mb-3">To:</h5>
								<h3 class="text-dark mb-1">유저이름</h3>
								<div>478, Nai Sadak</div>
								<div>Chandni chowk, New delhi, 110006</div>
								<div>Email: info@tikon.com</div>
								<div>Phone: +91 9895 398 009</div>
							</div>
						</div>
						<div class="table-responsive-sm">
							<table class="table table-striped">
								<thead>
									<tr>
										<th class="center">#</th>
										<th>Item</th>
										<th>Description</th>
										<th class="right">Price</th>
										<th class="center">Qty</th>
										<th class="right">Total</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="center">1</td>
										<td class="left strong">Iphone 10X</td>
										<td class="left">Iphone 10X with headphone</td>
										<td class="right">$1500</td>
										<td class="center">10</td>
										<td class="right">$15,000</td>
									</tr>
									<tr>
										<td class="center">2</td>
										<td class="left">Iphone 8X</td>
										<td class="left">Iphone 8X with extended warranty</td>
										<td class="right">$1200</td>
										<td class="center">10</td>
										<td class="right">$12,000</td>
									</tr>
									<tr>
										<td class="center">3</td>
										<td class="left">Samsung 4C</td>
										<td class="left">Samsung 4C with extended warranty</td>
										<td class="right">$800</td>
										<td class="center">10</td>
										<td class="right">$8000</td>
									</tr>
									<tr>
										<td class="center">4</td>
										<td class="left">Google Pixel</td>
										<td class="left">Google prime with Amazon prime
											membership</td>
										<td class="right">$500</td>
										<td class="center">10</td>
										<td class="right">$5000</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="row">
							<div class="col-lg-4 col-sm-5"></div>
							<div class="col-lg-4 col-sm-5 ml-auto">
								<table class="table table-clear">
									<tbody>
										<tr>
											<td class="left"><strong class="text-dark">Total</strong>
											</td>
											<td class="right"><strong class="text-dark">$20,744,00</strong>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<div class="card-footer bg-white">
						<h3 class="mb-0">배송완료</h3>
					</div>
				</div>
			</div>

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
	<script src="../vendor/jquery/jquery.min.js"></script>
	<script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>



</body>
</html>