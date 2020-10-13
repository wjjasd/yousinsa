
<%@page import="bean.ProductVO"%>
<%@page import="java.util.List"%>
<%@page import="bean.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
		    String pname = request.getParameter("product_name");
			ProductDAO dao = new ProductDAO();
			List<ProductVO> list = dao.productsearch(pname);
			
	%>
	
	<%
    //로그인 아이디 체크
    String user_id = null;
    if (session.getAttribute("user_id") != null) {
	user_id = (String) session.getAttribute("user_id");
	
    }
    %>
	
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>YOUSINSA STORE</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('#btn_direct').click(function() {
			var pid = <%=list.get(0).getProduct_id()%>;
	         var count = $('#quantity2').val();
	         alert("추가완료, 장바구니로 이동합니다");
	         location.href = "cartaction.jsp?pcount="+count+"&pid=" + pid;
		})
		
		$('#psearch').click(function() {
			search2 = $('#txtsearch').val()
			location.href = "headersearch.jsp?search=" + search2
		})
		
		$('#btn_cart').click(function() {
         var pid = <%=list.get(0).getProduct_id()%>;
         var count = $('#quantity2').val();
         alert("추가완료, 장바구니로 이동합니다");
         location.href = "cartaction.jsp?pcount="+count+"&pid=" + pid;

      })
		
	})
</script>

<!-- Bootstrap core CSS -->
<link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="../css/productdetail.css" rel="stylesheet">
<link href="../css/shop-homepage.css" rel="stylesheet">

<!-- Roboto Font -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700&display=swap">
<!-- Font Awesome -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css">

</head>

<body>
<header>
	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
		<div class="container">
			<a class="navbar-brand" href="../index.jsp">YOUSINSA STORE</a>
			<!-- sidebar-search  -->
			<div class="sidebar-search">
				<div>
					<div class="input-group">
						<input type="text" id="txtsearch" class="form-control search-menu" placeholder="Search...">
						<div class="input-group-append">
							<span class="input-group-text">
									<a id="psearch" class="fa fa-search" aria-hidden="true">
										<!--  <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-search" fill="currentColor" xmlns="http://www.w3.org/2000/svg"> 
  											<path fill-rule="evenodd" d="M10.442 10.442a1 1 0 0 1 1.415 0l3.85 3.85a1 1 0 0 1-1.414 1.415l-3.85-3.85a1 1 0 0 1 0-1.415z"/> 
  											<path fill-rule="evenodd" d="M6.5 12a5.5 5.5 0 1 0 0-11 5.5 5.5 0 0 0 0 11zM13 6.5a6.5 6.5 0 1 1-13 0 6.5 6.5 0 0 1 13 0z"/> 
										</svg> -->
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
	</header>
	
	<main>
	<!--Section: Block Content-->
	<%
	  for (int i = 0; i < list.size(); i++) {
	     ProductVO vo = list.get(i); //검색
	%>
<section class="mb-5 mt-4" id="img-section">

  <div class="row">
    <div class="col-lg-4 col-md-6  mb-5 ml-5 mb-md-0">

      <div id="mdb-lightbox-ui"></div>

      <div class="mdb-lightbox">

        <div class="row product-gallery mx-1"> 

          <div class="col-12 mb-5 ml-0" >
            <figure>
             <img src=<%=vo.getProduct_image()%> style="width:400px; height:450px;">
            </figure>
            
          </div>
          </div>
          </div>
        </div>
         
    <div class=" col-md-6 ml-5">

      <h1><%=vo.getProduct_name()%></h1>
      <%-- <p class="mb-2 text-muted text-uppercase small"><%=vo.getProduct_title() %></p>
      <ul id="star" class="rating">
        <li>
          <i class="fas fa-star fa-sm text-primary"></i>
        </li>
        <li>
          <i class="fas fa-star fa-sm text-primary"></i>
        </li>
        <li>
          <i class="fas fa-star fa-sm text-primary"></i>
        </li>
        <li>
          <i class="fas fa-star fa-sm text-primary"></i>
        </li>
        <li>
          <i class="far fa-star fa-sm text-primary"></i>
        </li>
      </ul><br><br> --%>
      
     <!--  <p><span class="mr-1"><strong>상세페이지입니다.</strong></span></p> -->
      <p class="pt-1"><%=vo.getProduct_explanation() %></p>
      <div class="table-responsive">
        <table class="table table-sm table-borderless mb-0">
          <tbody>
            <tr>
              <th class="pl-0 w-25" scope="row"><strong>Title</strong></th>
              <td><%=vo.getProduct_title() %></td>
            </tr>
            <tr>
              <th class="pl-0 w-25" scope="row"><strong>Inventory</strong></th>
              <td><%=vo.getProduct_inventory() %>개</td>
            </tr>
            <tr>
              <th class="pl-0 w-25" scope="row"><strong>Price</strong></th>
              <td><%=vo.getProduct_price() %>원</td>
            </tr>
          </tbody>
        </table>
      </div>
      <hr>
      <div class="table-responsive mb-2">
        <table class="table table-sm table-borderless"
        >
          <tbody>
            <tr>
              <td class="pl-0 pb-0 w-25">Quantity</td>
             <!--  <td class="pb-0">Select size </td> -->
            </tr>
            <tr>
              <td class="pl-0">
                <div class="def-number-input number-input safari_only mb-0">
                 
                  <input id="quantity2" min="0" name="quantity" value="1" type="number">
                  
                </div>
              </td> 
            
              
            </tr>
          </tbody>
        </table>
      </div>
     
      <button type="button" id="btn_direct" class="btn btn-primary btn-md mr-1 mb-2">바로 구매</button>
      <button id="btn_cart" type="button" class="btn btn-light btn-md mr-1 mb-2"><i class="fas fa-shopping-cart pr-2"></i>카트에 담기</button>
    </div>
    </div>
   
    

</section>
<!--Section: Block Content-->
<%
			}
		%>
</main>



	
<!-- Footer -->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; YOUSINSA 2020</p>
		</div>
	</footer> 
	
	
	
	<!-- Bootstrap core JavaScript -->
	<script src="../vendor/jquery/jquery.min.js"></script>
	<script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>

</html>