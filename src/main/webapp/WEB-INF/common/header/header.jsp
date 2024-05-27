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
	<fmt:setLocale value="${sessionScope.LANG}" />
	<fmt:setBundle basename="i18n.lang" />
	<div
		style="display: flex; justify-content: end; top: 0; position: sticky; z-index: 1000">
		<div class="abc"
			style="position: relative; z-index: 10000000000; margin-right: 60px; cursor: pointer">
			<b style="font-weight: bold; color: #000; font-size: 12px"><fmt:message>menu.select</fmt:message></b>
			<div class="cde"
				style="position: absolute; display: none; top: 100%; left: 0; right: 0; background: #fff; box-shadow: rgba(149, 157, 165, 0.2) 0px 8px 24px;">
				<p style="width: 100%; text-align: center; cursor: pointer;"
					class="a">
					<a href="#" class="lang-link" data-lang="en_US"><fmt:message>menu.english</fmt:message></a>
				</p>
				<p style="width: 100%; text-align: center; cursor: pointer;"
					class="a">
					<a href="#" class="lang-link" data-lang="vi_VN"><fmt:message>menu.vnese</fmt:message></a>
				</p>
			</div>
		</div>
	</div>
	<header class="main-header">
		<!-- Start Navigation -->
		<nav
			class="navbar navbar-expand-lg navbar-light bg-light navbar-default bootsnav">
			<div class="container">
				<!-- Start Header Navigation -->
				<div class="navbar-header">
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#navbar-menu" aria-controls="navbars-rs-food"
						aria-expanded="false" aria-label="Toggle navigation">
						<i class="fa fa-bars"></i>
					</button>
					<a class="navbar-brand" href="${pageContext.request.contextPath}/ListServlet"><img
					 style="width:50px;height:50px"
						src="https://hoangkimmobile.com/wp-content/uploads/2021/01/logo-Hoang-Kim-Mobile-retina-xam.png" class="logo" alt=""><br />
						<h1>
							<b>Hoang Kim Mobile</b>
						</h1> </a>
				</div>
				<!-- End Header Navigation -->

				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse" id="navbar-menu">
					<ul class="nav navbar-nav mr-auto" data-in="fadeInDown"
						data-out="fadeOutUp">
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/ListServlet"><fmt:message>menu.home</fmt:message></a></li>
						<li class="dropdown"><a href="#"
							class="nav-link dropdown-toggle arrow" data-toggle="dropdown"><fmt:message>menu.products</fmt:message><i
								class="fa fa-caret-down"></i></a>
							<ul class="dropdown-menu" style="background-color: white;">
								<li><a href="${pageContext.request.contextPath}/SearchServlet?action=Search+by+brand&name=apple">Apple</a></li>
								<li><a href="${pageContext.request.contextPath}/SearchServlet?action=Search+by+brand&name=samsung">Samsung</a></li>
							</ul></li>
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/AboutUsServlet"><fmt:message>menu.about</fmt:message></a></li>
					</ul>
					<c:choose>
						<c:when test="${sessionScope.isLoggedIn eq 'true' }">
							<ul class="nav navbar-nav ml-auto" data-in="fadeInDown"
								data-out="fadeOutUp">


								<li class="dropdown"><a href="#"
									class="nav-link dropdown-toggle arrow" data-toggle="dropdown">${sessionScope.account.name}
										<i class="fa fa-caret-down"></i>
								</a>
									<ul class="dropdown-menu" style="background-color: white;">
										<li><a href="${pageContext.request.contextPath}/SaveProfileServlet"><fmt:message>menu.profile</fmt:message></a></li>
										<li><a href="${pageContext.request.contextPath}/LogoutServlet"><fmt:message>menu.signOut</fmt:message></a></li>
									</ul></li>

							</ul>
						</c:when>
						<c:otherwise>
							<ul class="nav navbar-nav ml-auto" data-in="fadeInDown"
								data-out="fadeOutUp">


								<li class="nav-item"><a href="${pageContext.request.contextPath}/LoginServlet"> <i
										class="fa fa-sign-in"></i> <fmt:message>menu.login</fmt:message>
								</a></li>
								<li class="nav-item"><a href="${pageContext.request.contextPath}/RegisterServlet"> <i
										class="fa fa-user-plus"></i> <fmt:message>menu.register</fmt:message>
								</a></li>
							</ul>
						</c:otherwise>
					</c:choose>
				</div>
				<!-- /.navbar-collapse -->
				<!-- Start Attribute Navigation -->
				<div class="attr-nav">
					<ul>
						<li class="side-menu"><a href="${pageContext.request.contextPath}/AddToCartServlet"> <i
								class="fa fa-shopping-bag"></i> <span class="badge">${sessionScope.cart.items.size()}</span>
								<p>
									<fmt:message>menu.cart</fmt:message>
								</p>
						</a></li>
					</ul>
				</div>
				<!-- End Attribute Navigation -->
			</div>
		</nav>
		<!-- End Navigation -->
	</header>
	<!-- End Footer  -->

	<!-- ALL JS FILES -->
	<script>
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
		function updateLangParam(url, newLang) {
		    var urlObj = new URL(url);
		    urlObj.searchParams.set('lang', newLang); // Đặt hoặc cập nhật tham số 'lang'
		    return urlObj.href;
		}

		document.addEventListener('DOMContentLoaded', function() {
		    var langLinks = document.querySelectorAll('a.lang-link');

		    langLinks.forEach(function(link) {
		        link.addEventListener('click', function(e) {
		            e.preventDefault(); // Ngăn chặn hành động mặc định của thẻ <a>
		            var newLang = this.getAttribute('data-lang');
		            window.location.href = updateLangParam(window.location.href, newLang);
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