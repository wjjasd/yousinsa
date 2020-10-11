<%@page import="bean.ProductVO"%>
<%@page import="java.util.List"%>
<%@page import="bean.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
	String pname = request.getParameter("produt_name");
	ProductDAO dao = new ProductDAO();
	List<ProductVO> list = dao.productsearch(pname);
	
%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>YOUSINSA STORE</title>
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
						<input type="text" class="form-control search-menu" placeholder="Search...">
						<div class="input-group-append">
							<span class="input-group-text">
									<a class="fa fa-search" aria-hidden="true">
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
					<li class="nav-item"><a class="nav-link" href="../index.jsp">홈</a></li>
					<li class="nav-item"><a class="nav-link" href="bbs/allreview.jsp">구매후기</a></li>
					<%
						
					%>
					<li class="nav-item"><a class="nav-link" href="member/login.jsp">로그인</a></li>
					<li class="nav-item"><a class="nav-link" href="#">장바구니</a></li>
					<li class="nav-item"><a class="nav-link" href="#">결제내역</a></li>
					<li class="nav-item"><a class="nav-link" href="#">상품등록</a></li>
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
    <div class="col-lg-3 col-md-6 mb-4 ml-5 mb-md-0">

      <div id="mdb-lightbox-ui"></div>

      <div class="mdb-lightbox">

        <div class="row product-gallery mx-1">

          <div class="col-12 mb-0 ml-3" >
            <figure class="view overlay rounded z-depth-1 main-img" >
             
                <img src=<%=vo.getProduct_image()%> class="img-fluid z-depth-1">
             
            </figure>
            <!-- <figure class="view overlay rounded z-depth-1" style="visibility: hidden;">
              <a href="https://mdbootstrap.com/img/Photos/Horizontal/E-commerce/Vertical/12a.jpg"
                data-size="710x823">
                <img src="https://mdbootstrap.com/img/Photos/Horizontal/E-commerce/Vertical/12a.jpg"
                  class="img-fluid z-depth-1">
              </a>
            </figure>
            <figure class="view overlay rounded z-depth-1" style="visibility: hidden;">
              <a href="https://mdbootstrap.com/img/Photos/Horizontal/E-commerce/Vertical/13a.jpg"
                data-size="710x823">
                <img src="https://mdbootstrap.com/img/Photos/Horizontal/E-commerce/Vertical/13a.jpg"
                  class="img-fluid z-depth-1">
              </a>
            </figure>
            <figure class="view overlay rounded z-depth-1" style="visibility: hidden;">
              <a href="https://mdbootstrap.com/img/Photos/Horizontal/E-commerce/Vertical/14a.jpg"
                data-size=710x823">
                <img src="https://mdbootstrap.com/img/Photos/Horizontal/E-commerce/Vertical/14a.jpg"
                  class="img-fluid z-depth-1">
              </a>
            </figure> -->
          </div>
          
          
          <!-- pictures --> 
          <div class="col-12 ml-3">
            <div class="row">
              <div class="col-3">
                <div class="view overlay rounded z-depth-1 gallery-item">
                  <img src="https://mdbootstrap.com/img/Photos/Horizontal/E-commerce/Vertical/12a.jpg"
                    class="img-fluid">
                  <div class="mask rgba-white-slight"></div>
                </div>
              </div>
               <div class="col-3">
                <div class="view overlay rounded z-depth-1 gallery-item">
                  <img src="https://mdbootstrap.com/img/Photos/Horizontal/E-commerce/Vertical/13a.jpg"
                    class="img-fluid">
                  <div class="mask rgba-white-slight"></div>
                </div>
              </div>
              <div class="col-3">
                <div class="view overlay rounded z-depth-1 gallery-item">
                  <img src="https://mdbootstrap.com/img/Photos/Horizontal/E-commerce/Vertical/14a.jpg"
                    class="img-fluid">
                  <div class="mask rgba-white-slight"></div>
                </div>
              </div>
              <div class="col-3">
                <div class="view overlay rounded z-depth-1 gallery-item">
                  <img src="https://mdbootstrap.com/img/Photos/Horizontal/E-commerce/Vertical/15a.jpg"
                    class="img-fluid">
                  <div class="mask rgba-white-slight"></div>
                </div>
              </div>
            </div>
          </div>
        </div>

      </div>

    </div>
    <div class="col-md-6 ml-5">

      <h5>Fantasy T-shirt</h5>
      <p class="mb-2 text-muted text-uppercase small">Shirts</p>
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
      </ul><br><br>
      
      <p><span class="mr-1"><strong>$12.99</strong></span></p>
      <p class="pt-1">Lorem ipsum dolor sit amet consectetur adipisicing elit. Numquam, sapiente illo. Sit
        error voluptas repellat rerum quidem, soluta enim perferendis voluptates laboriosam. Distinctio,
        officia quis dolore quos sapiente tempore alias.</p>
      <div class="table-responsive">
        <table class="table table-sm table-borderless mb-0">
          <tbody>
            <tr>
              <th class="pl-0 w-25" scope="row"><strong>Model</strong></th>
              <td>Shirt 5407X</td>
            </tr>
            <tr>
              <th class="pl-0 w-25" scope="row"><strong>Color</strong></th>
              <td>Black</td>
            </tr>
            <tr>
              <th class="pl-0 w-25" scope="row"><strong>Delivery</strong></th>
              <td>USA, Europe</td>
            </tr>
          </tbody>
        </table>
      </div>
      <hr>
      <div class="table-responsive mb-2">
        <table class="table table-sm table-borderless">
          <tbody>
            <tr>
              <td class="pl-0 pb-0 w-25">Quantity</td>
              <td class="pb-0">Select size</td>
            </tr>
            <tr>
              <td class="pl-0">
                <div class="def-number-input number-input safari_only mb-0">
                 <!-- <button onclick="this.parentNode.querySelector('input[type=number]').stepDown()" 
                 class="minus"></button> -->
                  <input class="quantity" min="0" name="quantity" value="1" type="number">
                  <!-- <button onclick="this.parentNode.querySelector('input[type=number]').stepUp()"
                    class="plus"></button> -->
                </div>
              </td> 
              <td>
                <div class="mt-1">
                  <div class="form-check form-check-inline pl-0">
                    <input type="radio" class="form-check-input" id="small" name="materialExampleRadios"
                      checked>
                    <label class="form-check-label small text-uppercase card-link-secondary"
                      for="small">Small</label>
                  </div>
                  <div class="form-check form-check-inline pl-0">
                    <input type="radio" class="form-check-input" id="medium" name="materialExampleRadios">
                    <label class="form-check-label small text-uppercase card-link-secondary"
                      for="medium">Medium</label>
                  </div>
                  <div class="form-check form-check-inline pl-0">
                    <input type="radio" class="form-check-input" id="large" name="materialExampleRadios">
                    <label class="form-check-label small text-uppercase card-link-secondary"
                      for="large">Large</label>
                  </div>
                </div>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
      <button type="button" class="btn btn-primary btn-md mr-1 mb-2">이전 페이지</button>
      <button type="button" class="btn btn-light btn-md mr-1 mb-2"><i
          class="fas fa-shopping-cart pr-2"></i>Add to cart</button>
    </div>
  </div>

</section>
<!--Section: Block Content-->
<%
			}
		%>
</main>


<br><br><br><br>
	
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