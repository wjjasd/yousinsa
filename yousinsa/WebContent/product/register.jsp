<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

	<div class="container" id="register">
		<div class="row">
			<form method="post" action="registeraction.jsp">
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="2" style="background-color: #eeeeeee; text-align: center;">상품등록 </th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><h3>상품이름</h3></td>
							<td><input type="text" class="form-control" placeholder="상품이름" name="pname" style="width:500px;"></td>
						</tr>
						<tr>
							<td><h3>상품종류</h3></td>
							<td><input type="text" class="form-control" placeholder="상품종류" name="ptitle"></td>
						</tr>
						<tr>
							<td><h3>상품설명</h3></td>
							<td><textarea class="form-control" placeholder="상품설명" name="pexplanation" maxlength="500" style="height:350px;"></textarea>
						</tr>
						<tr>
							<td><h3>상품가격</h3></td>
							<td><input type="text" class="form-control" placeholder="상품가격" name="pprice"></td>
						</tr>
						<tr>
							<td><h3>상품재고</h3></td>
							<td><input type="text" class="form-control" placeholder="상품재고" name="pinventory"></td>
						</tr>
						<tr>
							<td><h3>이미지</h3></td>
							<td><input type="text" class="form-control" placeholder="상품이미지(이미지URL을 넣어주세요)" name="pimage"></td>
					    </tr>
							
					</tbody>
					
				</table>
				<div align ="right">
				<input type="submit" class="btn btn-primary" value="등록">
				</div>
			</form>



		</div>
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