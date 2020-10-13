<%@page import="bean.ProductVO"%>
<%@page import="bean.ProductDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.PaymentDAO"%>
<%@page import="bean.PaymentHistoryVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
//로그인 아이디 체크
String user_id = null;
if (session.getAttribute("user_id") != null) {
	user_id = (String) session.getAttribute("user_id");
	System.out.println(user_id);
}

//결제내역검색
PaymentHistoryVO hisVo = new PaymentHistoryVO();
PaymentDAO dao = new PaymentDAO();
ArrayList<PaymentHistoryVO> list = (ArrayList<PaymentHistoryVO>) dao.gethistory(user_id);
int itemCount = list.size();

//상품정보검색
ProductDAO pdao = new ProductDAO();
ArrayList<ProductVO> productList = new ArrayList<ProductVO>();
for(int i = 0; i < itemCount; i++){
	productList.add(pdao.productsearch(list.get(i).getProduct_id()));
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
						href="../bbs/allreview.jsp">구매후기</a></li>
					<%
						if (user_id == null) {
					%>
					<li class="nav-item"><a class="nav-link"
						href="../member/login.jsp">로그인</a></li>
					<%
						} else if (user_id.equals("admin")) {
					%>
					<li class="nav-item"><a class="nav-link" id="logout"
						href="../logout.jsp">로그아웃</a></li>
					<li class="nav-item"><a class="nav-link" href="cart.jsp">장바구니</a></li>
					<li class="nav-item  active"><a class="nav-link"
						href="paymenthistory.jsp">결제내역</a></li>
					<li class="nav-item"><a class="nav-link" href="#">상품등록</a></li>
					<%
						} else {
					%>
					<li class="nav-item"><a class="nav-link" id="logout"
						href="../logout.jsp">로그아웃</a></li>
					<li class="nav-item"><a class="nav-link" href="cart.jsp">장바구니</a></li>
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
			<div style="margin-left: 0" class="offset-xl-2 col-xl-8 col-lg-12 col-md-12 col-sm-12 col-12 padding">

				<div style="width:150%;" class="card">

					<div class="card-body">


						<div class="table-responsive-sm">
						<h3><%=user_id%>님의 결제내역 (최신순) </h3><br>
							<table class="table table-striped">

								<thead>
									<tr>
										<th class="center">상품코드</th>
										<th class="center">상품명</th>
										<th class="center">주문자</th>
										<th class="center">주문수량</th>
										<th class="center">배송상태</th>
										<th class="center">결제일</th>
									</tr>
								</thead>
								<%
									for (int i = 0; i < list.size(); i++) {
										String delivery = "배송준비중";
										switch(list.get(i).getPayment_delivery()){
										case -1 : delivery = "배송준비중"; break;
										case 0 : delivery = "배송중"; break;
										case 1 : delivery = "배송완료"; break;
										}
								%>
								<tbody>
									<tr>
										<td class="center"><%=list.get(i).getProduct_id()%></td>
										<td class="center"><%=productList.get(i).getProduct_name()%></td>
										<td class="center"><%=list.get(i).getUser_id()%></td>
										<td class="center"><%=list.get(i).getCart_pcount()%></td>
										<td class="center"><%=delivery%></td>
										<td class="center"><%=list.get(i).getPayment_date()%></td>
									</tr>
								</tbody>
								<%
									}
								%>
							</table>

						</div>


					</div>
				</div>


			</div>

			<br>

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