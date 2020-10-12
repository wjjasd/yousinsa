<%@page import="java.util.Dictionary"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="bean.ProductVO"%>
<%@page import="bean.ProductDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.CartVO"%>
<%@page import="bean.CartDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
//로그인 아이디 체크
String user_id = null;
try {
	user_id = (String)session.getAttribute("user_id");
} catch (Exception e) {
	user_id = null;
}

//장바구니 목록 불러오기
CartDAO dao = new CartDAO();
CartVO vo = new CartVO();

ArrayList<CartVO> list = (ArrayList<CartVO>)dao.getUserCart(user_id);
int itemCount = list.size();

//상품정보 가져오기
ProductDAO pdao = new ProductDAO();
ArrayList<ProductVO> productList = new ArrayList<ProductVO>();
for(int i = 0; i < itemCount; i++){
	productList.add(pdao.productsearch(list.get(i).getProduct_id()));
}

//총 수량, 총 금액 계산
int quantitySum = 0;
int moneySum = 0;
for(int i = 0; i < itemCount; i++){
	quantitySum += list.get(i).getCart_pcount();
	moneySum += (list.get(i).getCart_pcount() * productList.get(i).getProduct_price());
}
DecimalFormat formatter = new DecimalFormat("###,###");
String moneyFormate = formatter.format(moneySum);
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
<!-- 결제API -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<!-- 결제API -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script type="text/javascript">
	function checkout() {
		//vo에 결제할 상품 정보 담아서 결제 페이지로 전달
		location.href = 'payment.jsp';
	}
</script>

<!-- Bootstrap core CSS -->
<link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="../css/shop-homepage.css" rel="stylesheet">
<link href="../css/cart.css" rel="stylesheet">
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
						href="../bbs/allreview.jsp">구매후기</a></li>
					<%
						if (user_id == null) {
					%>
					<li class="nav-item"><a class="nav-link"
						href="../member/login.html">로그인</a></li>
					<%
						} else if (user_id == "admin") {
					%>
					<li class="nav-item"><a class="nav-link" id="logout"
						href="../logout.jsp">로그아웃</a></li>
					<li class="nav-item active"><a class="nav-link"
						href="cart.jsp">장바구니</a></li>
					<li class="nav-item"><a class="nav-link"
						href="paymenthistory.jsp">결제내역</a></li>
					<li class="nav-item"><a class="nav-link" href="#">상품등록</a></li>
					<%
						} else {
					%>
					<li class="nav-item"><a class="nav-link" id="logout"
						href="../logout.jsp">로그아웃</a></li>
					<li class="nav-item  active"><a class="nav-link"
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

	<!-- Page Content -->
	<div class="container">

		<div class="row">

			<div class="col-lg-3">

				<!-- Card -->
				<div class="card mb-3">
					<div class="card-body">

						<h5 class="mb-3">주문</h5>
						<hr>

						<ul class="list-group list-group-flush">
							<li
								class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 pb-0">
								총 상품 수량: <span><%= quantitySum %></span>개
							</li>
							<li
								class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 mb-3">
								<div>
									<strong>총 결제 금액:</strong> <strong>
										<p class="mb-0">(including VAT)</p>
									</strong>
								</div> <span><strong><%=moneyFormate %></strong></span>원
							</li>
						</ul>

						<button type="button"
							class="btn btn-primary btn-block waves-effect waves-light"
							onclick="checkout()">주문하기</button>

					</div>
				</div>

			</div>
			<!-- /.col-lg-3 -->

			<div class="col-lg-9">

				<!-- Card -->
				<div class="card wish-list mb-3">
					<div class="card-body">

						<h5 class="mb-4">
							Cart (<span><%=itemCount %></span> 품목)
						</h5>
						<% for(int i = 0; i < itemCount; i++) {%>
						<div class="row mb-4">
							<div class="col-md-5 col-lg-3 col-xl-3">
								<div class="view zoom overlay z-depth-1 rounded mb-3 mb-md-0">
									<img class="img-fluid w-100"
										src=<%=productList.get(i).getProduct_image()%>
										alt="Sample">
								</div>
							</div>
							<div class="col-md-7 col-lg-9 col-xl-9">
								<div>
									<div class="d-flex justify-content-between">
										<div>
											
											<h5 id='product'><%=productList.get(i).getProduct_name()%></h5>
											<p class="mb-3 text-muted text-uppercase small">상품번호 -
												<%= list.get(i).getProduct_id() %></p>
											<p class="mb-2 text-muted text-uppercase small">
												<%= productList.get(i).getProduct_explanation() %></p>
											
										</div>
										<div>
											<div class="def-number-input number-input safari_only mb-0 w-100">
												<p>수량: <%= list.get(i).getCart_pcount() %> 개</p>
											</div>
										</div>
									</div>
									<div class="d-flex justify-content-between align-items-center">
										<div>
											<a href="deleteCartItem.jsp?cid=<%=list.get(i).getCart_id()%>" type="button"
												class="card-link-secondary small text-uppercase mr-3"><i
												class="fas fa-trash-alt mr-1"></i> 항목 삭제하기 </a>
										</div>
										<p class="mb-0">
											<span><strong>가격: <a id='price'>
												<%= list.get(i).getCart_pcount() %>개 x <%=formatter.format(productList.get(i).getProduct_price()) %> ￦
												= <%= formatter.format(list.get(i).getCart_pcount() * productList.get(i).getProduct_price())%></a> ￦
											</strong></span>
										</p>
									</div>
								</div>
							</div>
							
						</div>
						<hr>
						<%} %>

						<p class="text-primary mb-0">
							<i class="fas fa-info-circle mr-1"></i> Do not delay the
							purchase, adding items to your cart does not mean booking them.
						</p>

					</div>
				</div>
				<!-- Card -->

				<!-- Card -->
				<div class="card mb-3">
					<div class="card-body">

						<h5 class="mb-4">Expected shipping delivery</h5>

						<p class="mb-0">Thu., 12.03. - Mon., 16.03.</p>
					</div>
				</div>
				<!-- Card -->

				<!-- Card -->
				<div class="card mb-3">
					<div class="card-body">

						<h5 class="mb-4">We accept</h5>

						<img class="mr-2" width="45px"
							src="https://mdbootstrap.com/wp-content/plugins/woocommerce-gateway-stripe/assets/images/visa.svg"
							alt="Visa"> <img class="mr-2" width="45px"
							src="https://mdbootstrap.com/wp-content/plugins/woocommerce-gateway-stripe/assets/images/amex.svg"
							alt="American Express"> <img class="mr-2" width="45px"
							src="https://mdbootstrap.com/wp-content/plugins/woocommerce-gateway-stripe/assets/images/mastercard.svg"
							alt="Mastercard">
					</div>
				</div>
				<!-- Card -->

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
	<script src="../vendor/jquery/jquery.min.js"></script>
	<script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>




</body>
</html>