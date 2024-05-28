<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<!-- Basic -->
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- Mobile Metas -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Site Metas -->
<title>Hoang Kim: Home Page</title>
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="author" content="">

<!-- Site Icons -->
<link rel="shortcut icon" href="https://hoangkimmobile.com/wp-content/uploads/2021/01/logo-Hoang-Kim-Mobile-retina-xam.png"
	type="image/x-icon">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="./css/bootstrap.min.css">
<!-- Site CSS -->
<link rel="stylesheet" href="./css/style.css">
<!-- Responsive CSS -->
<link rel="stylesheet" href="./css/responsive.css">
<!-- Custom CSS -->
<link rel="stylesheet" href="./css/custom.css">

<!-- Font Awesome CSS links -->
<link
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet"
	integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style type="text/css">
.a:hover {
	background-color: gold;
	transition: all 0.2s
}
</style>
</head>
<body>
	<!-- Start Main Top -->
	<%@include file="/WEB-INF/common/header/header.jsp"%>
	<!-- End Main Top -->

	<!-- Start Slider -->
	<%@include file="/WEB-INF/common/header/slider.jsp"%>
	<!-- End Slider -->

	<!-- Start Shop Page  -->
	<div class="shop-box-inner">
		<div class="container" style="max-width: 1400px">
			<div class="row">
				<div
					class="col-xl-9 col-lg-9 col-sm-12 col-xs-12 shop-content-right">
					<div class="right-product-box">
						<div class="product-item-filter row">
							<div class="col-12 text-center text-sm-left">
								<div class="search-product">
									<form
										style="display: flex; align-items: center; width: 100%; gap: 10px; border-style: solid; border-width: 1px; border-color: #ccc; border-radius: 6px; height: 40px"
										method="GET" action="${pageContext.request.contextPath}/SearchServlet">
										<input type="hidden" id="searchTypeValue" name="action" value="" />
										<input
											id="search-panel" style="flex: 1; border: none; padding-left: 12px; margin-right: 10px; outline: none; border-right: 1px solid #ccc" placeholder="" name="name" value="${sessionScope.words}">
										<div class="bc" style="position: relative; margin-right: 60px; cursor: pointer">
											<span id="searchType"><fmt:message>search.type</fmt:message></span>
											<div class="de" style="position: absolute; display: none; z-index: 100000000000; top: 100%; left: 0; right: 0; background: #fff; box-shadow: rgba(149, 157, 165, 0.2) 0px 8px 24px;">
												<p style="width: 100%; text-align: center; cursor: pointer;" class="a">
													<fmt:message>search.name</fmt:message>
												</p>
												<p style="width: 100%; text-align: center; cursor: pointer;" class="a">
													<fmt:message>search.des</fmt:message>
												</p>
												<p style="width: 100%; text-align: center; cursor: pointer;" class="a">
													<fmt:message>search.price</fmt:message>
												</p>
											</div>
										</div>
										<button type="submit"><i class="fa fa-search"></i></button>
									</form>
								</div>
							</div>
						</div>

						<c:choose>
							<c:when test="${param.page eq 'home' }">
								<c:set var="Products" value="${ProductHome }"></c:set>
							</c:when>
							<c:when test="${param.page eq 'search' }">
								<c:set var="Products" value="${ProductSearch }"></c:set>
							</c:when>
						</c:choose>

						

						<c:choose>
							<c:when test="${not empty Products }">
								<c:set var="tablewidth" value="3"></c:set>
								<c:choose>
									<c:when test="${param.lang eq 'en_US' || sessionScope.LANG eq 'en_US'}">
										<c:set var="currency" value="$" />
									</c:when>
									<c:when test="${param.lang eq 'vi_VN' || sessionScope.LANG eq 'vi_VN' }">
										<c:set var="currency" value=" đồng" />
									</c:when>
								</c:choose>
								<table class="responsive-table " style="width: 100%">
									<c:forEach var="prod" items="${Products}" varStatus="status">
										<c:if test="${status.index % tablewidth == 0 }">
											<tr>
										</c:if>
										<td>
											<a
											href="<c:url value="/ProductDetailServlet?productID=${prod.id }"/>">
												<div class="products-single fix" style="padding: 5%">
													<div class="box-img-hover">
														<img src="${prod.src}" class="img-fluid" style="width:212px;height:212px;object-fit:cover" alt="Image">
													</div>
													<div class="why-text">
														<h4>${fn:toUpperCase(prod.type) }</h4>
														<h4>${prod.getName() }</h4>
														<c:choose>
															<c:when test="${param.lang eq 'en_US' || sessionScope.LANG eq 'en_US'}">
																<h5>${currency}
																	<fmt:formatNumber value="${prod.price}" maxFractionDigits="2" pattern="#,##0.00">
																	</fmt:formatNumber>
																</h5>
															</c:when>
															<c:when test="${param.lang eq 'vi_VN' || sessionScope.LANG eq 'vi_VN'}">
																<h5>
																	<fmt:formatNumber value="${prod.vietnamPrice()}" type="number" maxFractionDigits="0" pattern="#,##0"/>${currency}
																</h5>
															</c:when>
														</c:choose>
														<c:url var="addToCart" value="/AddToCartServlet">
															<c:param name="page" value="${param.page}"></c:param>
															<c:param name="action" value="add"></c:param>
															<c:param name="id" value="${prod.id}"></c:param>
														</c:url>
														<!-- Sequence diagram: AddCart - CNPM
     														1: click button "Add To Cart" (is sent by User)
														-->
														<form method="POST" action="${addToCart}">
															<button class="btn btn-success" type="submit" style="width: 100%; margin-top: 10px">
																<fmt:message>product.cart</fmt:message>
															</button>
														</form>
													</div>
												</div>
											</a>
										</td>
									</c:forEach>
								</table>

								<c:choose>
									<c:when test="${param.page eq 'home' }">
										<c:set var="totalPages" value="${totalPageHome}"></c:set>
										<c:set var="currentPage" value="${currentPageHome }"></c:set>
										<c:set var="startPage" value="${startPageHome }"></c:set>
										<c:set var="endPage" value="${endPageHome }"></c:set>
									</c:when>
									<c:when test="${param.page eq 'search' }">
										<c:set var="totalPages" value="${totalPageSearch}"></c:set>
										<c:set var="currentPage" value="${currentPageSearch }"></c:set>
										<c:set var="startPage" value="${startPageSearch }"></c:set>
										<c:set var="endPage" value="${endPageSearch }"></c:set>
									</c:when>
								</c:choose>
								<c:set var="PRODUCTS_PER_PAGE" value="${products_per_page}"></c:set>
								<c:if test="${param.page eq 'home' }">
									<c:set var="pattern" value="ListServlet?"></c:set>
								</c:if>
								<c:if test="${param.page eq 'search' }">
									<c:set var="pattern"
										value="SearchServlet?action=${action }&name=${name }&"></c:set>
								</c:if>

								<c:if test="${currentPage > 1 }">
									<a
										href="<c:url value="${pattern }currentPage=${currentPage - 1}&lang=${sessionScope.LANG}"/>"><fmt:message>pagination.previous</fmt:message></a>
								</c:if>

								<c:if test="${startPage > 2 }">
									<a href="<c:url value="${pattern }currentPage=1&lang=${sessionScope.LANG}"/>">1</a>
									<span>..</span>
								</c:if>

								<c:forEach var="pageNumber" begin="${startPage }" end="${endPage}">
									<c:choose>
										<c:when test="${pageNumber == currentPage }">
											<strong>${pageNumber}</strong>
										</c:when>
										<c:otherwise>
											<a href="<c:url value="${pattern }currentPage=${pageNumber}&lang=${sessionScope.LANG}"/>">${pageNumber}</a>
										</c:otherwise>
									</c:choose>
								</c:forEach>

								<c:if test="${endPage < totalPages}">
									<span>..</span>
									<a
										href="
									<c:url value="${pattern }currentPage=${totalPages }&lang=${sessionScope.LANG}"/>">${totalPages }
									</a>
								</c:if>

								<c:if test="${currentPage < totalPages }">
									<a
										href="
					<c:url value="${pattern }currentPage=${currentPage + 1}&lang=${sessionScope.LANG}"/>"><fmt:message>pagination.next</fmt:message></a>
								</c:if>
							</c:when>

							<c:otherwise>
								<h2>
									<fmt:message>search.notFound</fmt:message>
								</h2>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				<div class="col-xl-3 col-lg-3 col-sm-12 col-xs-12 sidebar-shop-left">
					<div class="product-categori">
						<div class="filter-sidebar-left">
							<div class="title-left">
								<h3>
									<fmt:message>home.ads</fmt:message>
								</h3>
							</div>
							<div
								class="list-group list-group-collapse list-group-sm list-group-tree"
								id="list-group-men" data-children=".sub-men">
								<div class="list-group-collapse sub-men">
									<div class="collapse show" id="sub-men1"
										data-parent="#list-group-men">
										<div class="list-group">
											<img src="./image/iphone1.jpg" alt="ads">
										</div>
										<div class="list-group">
											<img src="./image/iphone2.jpg" alt="ads">
										</div>
										<div class="list-group">
											<img src="./image/iphone3.jpg" alt="ads">
										</div>
										<div class="list-group">
											<img src="./image/iphone4.jpg" alt="ads">
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Shop Page -->

	<!-- Start Footer  -->
	<%@include file="/WEB-INF/common/footer/footer.jsp"%>
	<!-- End Footer  -->

	<!-- ALL JS FILES -->
	<script>
		var placeholderText = "<fmt:message>search.here</fmt:message>";
		document.getElementById('search-panel').placeholder = placeholderText;
		// Chọn phần tử với class "abc"
		var abcElement = document.querySelector('.abc');
		// Chọn phần tử với class "cde"
		var cdeElement = document.querySelector('.cde');
		// Xử lý sự kiện khi hover vào class "abc"
		abcElement.addEventListener("mouseenter", function() {
			// Hiển thị class "cde"
			cdeElement.style.display = 'block';
		});
		// Xử lý sự kiện khi rời khỏi class "abc"
		abcElement.addEventListener("mouseleave", function() {
			// Ẩn class "cde"
			cdeElement.style.display = 'none';
		});
		// Chọn phần tử với class "abc"
		var bcElement = document.querySelector('.bc');
		// Chọn phần tử với class "cde"
		var deElement = document.querySelector('.de');
		// Xử lý sự kiện khi hover vào class "abc"
		bcElement.addEventListener("mouseenter", function() {
			// Hiển thị class "cde"
			deElement.style.display = 'block';
		});
		// Xử lý sự kiện khi rời khỏi class "abc"
		bcElement.addEventListener("mouseleave", function() {
			// Ẩn class "cde"
			deElement.style.display = 'none';
		});
		document.addEventListener('DOMContentLoaded', function () {
		    var searchTypeElement = document.getElementById('searchType');
		    var hiddenInputElement = document.getElementById('searchTypeValue');

		    document.querySelectorAll('.de p').forEach(function (element) {
		        element.addEventListener('click', function () {
		            var selectedValue = this.innerText; // Lấy giá trị văn bản được chọn
		            searchTypeElement.innerHTML = selectedValue; // Cập nhật hiển thị
		            hiddenInputElement.value = selectedValue; // Cập nhật giá trị của trường ẩn
		        });
		    });
		});
	</script>
	<script src="./js/jquery-3.2.1.min.js"></script>
	<script src="./js/popper.min.js"></script>
	<script src="./js/bootstrap.min.js"></script>
	<!-- ALL PLUGINS -->
	<script src="./js/jquery.superslides.min.js"></script>
	<script src="./js/bootstrap-select.js"></script>
	<script src="./js/inewsticker.js"></script>
	<script src="./js/bootsnav.js"></script>
	<script src="./js/images-loded.min.js"></script>
	<script src="./js/isotope.min.js"></script>
	<script src="./js/owl.carousel.min.js"></script>
	<script src="./js/baguetteBox.min.js"></script>
	<script src="./js/form-validator.min.js"></script>
	<script src="./js/contact-form-script.js"></script>
	<script src="./js/custom.js"></script>
	<script src="./js/offer.js"></script>
</body>
</html>