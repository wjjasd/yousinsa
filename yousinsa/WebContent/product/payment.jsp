<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="bean.MemberVO"%>
<%@page import="bean.MemberDAO"%>
<%@page import="bean.ProductVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="bean.ProductDAO"%>
<%@page import="bean.CartVO"%>
<%@page import="bean.CartDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%
//로그인 아이디 체크
String user_id = null;
if (session.getAttribute("user_id") != null) {
	user_id = (String) session.getAttribute("user_id");
	System.out.println(user_id);
}

//결제할 목록 불러오기
CartDAO dao = new CartDAO();
CartVO vo = new CartVO();

ArrayList<CartVO> list = (ArrayList<CartVO>) dao.getUserCart(user_id);
int itemCount = list.size();

//상품정보 가져오기
ProductDAO pdao = new ProductDAO();
ArrayList<ProductVO> productList = new ArrayList<ProductVO>();
for (int i = 0; i < itemCount; i++) {
	productList.add(pdao.productsearch(list.get(i).getProduct_id()));
}

//총 수량, 총 금액 계산
int quantitySum = 0;
int moneySum = 0;
for (int i = 0; i < itemCount; i++) {
	quantitySum += list.get(i).getCart_pcount();
	moneySum += (list.get(i).getCart_pcount() * productList.get(i).getProduct_price());
}
DecimalFormat formatter = new DecimalFormat("###,###");
String moneyFormate = formatter.format(moneySum);

//유저정보검색
MemberDAO mDao = new MemberDAO();
MemberVO mVo = mDao.searchUser(user_id);

String uAddress = mVo.getUser_address();
String adrress[] = uAddress.split(" ");

//오늘날짜획득
Calendar cal = Calendar.getInstance();
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
String datestr = sdf.format(cal.getTime());

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

<script>
	$(function() {
		$("#postcodify_search_button").postcodifyPopUp();

		/* 결제 */
		var IMP = window.IMP; // 생략가능
		IMP.init('imp82542859'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
		$("#checkout").click(function() {
			IMP.request_pay({
				pg : 'inicis', // version 1.1.0부터 지원.
				pay_method : 'card',
				merchant_uid : 'merchant_' + new Date().getTime(),
				name : '유신사:결제테스트',
				amount : <%=moneySum%>,
				buyer_email : 'iamport@siot.do',
				buyer_name : $('#buyer_name').val(),
				buyer_tel : '010-1234-5678',
				buyer_addr : '서울특별시 강남구 삼성동',
				buyer_postcode : '123-456',
				m_redirect_url : 'https://www.yourdomain.com/payments/complete'
			}, function(rsp) {
				if (rsp.success) {
					var msg = '결제가 완료되었습니다.';
					msg += '고유ID : ' + rsp.imp_uid;
					msg += '상점 거래ID : ' + rsp.merchant_uid;
					msg += '결제 금액 : ' + rsp.paid_amount;
					msg += '카드 승인번호 : ' + rsp.apply_num;
					alert(msg);
					var destination1 = $('#post1').val();
					var destination2 = $('#post2').val();
					var destination3 = $('#post3').val();
					
					$.ajax({
						url: "paymentok.jsp",
						data: {
							user_id: '<%=user_id%>',
							price: '<%=moneySum%>',
							date: '<%=datestr%>',
							destination1: destination1,
							destination2: destination2,
							destination3: destination3,
							price: '<%=moneySum%>'
						},
						success : function(result){
							if(result == 'true'){
								window.location.href = 'paymenthistory.jsp';	
							}
						}
					
					})//ajax
				} else {
					var msg = '결제에 실패하였습니다.';
					msg += '에러내용 : ' + rsp.error_msg;
					alert(msg);
				}
			});
		});
	});
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
						href="../member/login.html">로그인</a></li>
					<%
						} else if (user_id.equals("admin")) {
					%>
					<li class="nav-item"><a class="nav-link" id="logout"
						href="../logout.jsp">로그아웃</a></li>
					<li class="nav-item"><a class="nav-link" href="cart.jsp">장바구니</a></li>
					<li class="nav-item"><a class="nav-link"
						href="paymenthistory.jsp">결제내역</a></li>
					<li class="nav-item"><a class="nav-link" href="#">상품등록</a></li>
					<%
						} else {
					%>
					<li class="nav-item"><a class="nav-link" id="logout"
						href="../logout.jsp">로그아웃</a></li>
					<li class="nav-item"><a class="nav-link" href="cart.jsp">장바구니</a></li>
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
			<!-- 결제 -->
			<div
				class="offset-xl-2 col-xl-8 col-lg-12 col-md-12 col-sm-12 col-12 padding">
				<div class="card">
					<div class="card-header p-4">
						<h3 class="mb-0">주문 / 결제하기</h3>
						<div class="float-right"><%=datestr %></div>
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
								<a class="mb-3">To:</a><br /> <input id='buyer_name' type='text'
									value=<%=mVo.getUser_name()%>><br /> <a class="mb-3">연락처:</a><br />
								<input type='text' value=<%=mVo.getUser_contact()%>><br />
								<br> 주소*<br>
								<p class="post1">우편주소</p>
								<input id="post1" value=<%=adrress[0]%> type="text"
									class="postcodify_postcode5" name="userpost1" placeholder=""
									required="" autofocus="" size=10 />
								<button id="postcodify_search_button">검색</button>
								<br />

								<p class="post2">도로명주소</p>
								<input id="post2" value=<%=adrress[1]%> type="text"
									class="postcodify_address" name="userpost2" placeholder=""
									required="" autofocus="" size=30 />

								<p class="post3">상세주소</p>
								<input id="post3" value=<%=adrress[2]%> type="text"
									class="postcodify_details" name="userpost3" placeholder="유저주소"
									required="" autofocus="" style="margin-bottom: 15px;" size=30 />
							</div>
						</div>
						<div class="table-responsive-sm">
							<table class="table table-striped">
								<thead>
									<tr>
										<th class="center">#</th>
										<th>상품명</th>
										<th>옵션</th>
										<th class="right">가격</th>
										<th class="center">수량</th>
										<th class="right">총 금액</th>
									</tr>
								</thead>
								<tbody>
									<%for(int i = 0; i < itemCount; i++) { %>
									<tr>
										<td class="center"><%=i+1 %></td>
										<td class="left strong"><%=productList.get(i).getProduct_name()%></td>
										<td class="left"><%= productList.get(i).getProduct_explanation() %></td>
										<td class="right"><%=formatter.format(productList.get(i).getProduct_price()) %>￦</td>
										<td class="center"><%=list.get(i).getCart_pcount() %></td>
										<td class="right"><%= formatter.format(list.get(i).getCart_pcount() * productList.get(i).getProduct_price())%>￦</td>
									</tr>
									<%} %>
								</tbody>
							</table>
						</div>
						<div class="row">
							<div class="col-lg-4 col-sm-5"></div>
							<div class="col-lg-4 col-sm-5 ml-auto">
								<table class="table table-clear">
									<tbody>
										<tr>
											<td class="left"><strong class="text-dark">총 금액</strong>
											</td>
											<td class="right"><a id='pricesum'><strong
													class="text-dark"><%=moneyFormate %></strong></a> ￦</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<div class="card-footer bg-white">
						<button id="checkout">
							<h3 class="mb-0">결제하기</h3>
						</button>
					</div>
				</div>
			</div>
		</div>
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
	<!-- 주소검색 -->
	<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
	<!-- 아임포트 -->
	<script type="text/javascript"
		src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</body>
</html>