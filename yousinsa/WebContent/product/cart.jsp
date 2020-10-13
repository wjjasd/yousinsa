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
				<div style="position: fixed; left: 0x; top: 80px; width: 250px" class="card mb-3">
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

						<h5 class="mb-4">배송</h5>
						<p class="mb-0">평균소요기간 1~2 일</p>
						
					</div>
				</div>
				<!-- Card -->

				<!-- Card -->
				<div class="card mb-3">
					<div class="card-body">

						<h5 class="mb-4">결제가능 수단</h5>

						<img class="mr-2" width="45px" src="https://mdbootstrap.com/wp-content/plugins/woocommerce-gateway-stripe/assets/images/visa.svg"
							alt="Visa"> 
							
						<img class="mr-2" width="45px"
							src="https://mdbootstrap.com/wp-content/plugins/woocommerce-gateway-stripe/assets/images/amex.svg"
							alt="American Express"> 
							
						<img class="mr-2" width="45px"
							src="https://mdbootstrap.com/wp-content/plugins/woocommerce-gateway-stripe/assets/images/mastercard.svg"
							alt="Mastercard">
							
						<img class="mr-2" width="45px"
							src="data:image/png;base64,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"
							alt="Kakao">
							
						<img class="mr-2" width="45px"
							src="data:image/jpeg;base64,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"
							alt="Naver">
							
						<img class="mr-2" width="45px"
							src="data:image/jpeg;base64,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"
							alt="Payco">
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