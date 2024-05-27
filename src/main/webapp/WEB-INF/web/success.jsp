<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
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
	<title>Hoang Kim: Order Success!</title>
	<meta name="keywords" content="">
	<meta name="description" content="">
	<meta name="author" content="">

	<!-- Site Icons -->
	<link rel="shortcut icon" href="https://hoangkimmobile.com/wp-content/uploads/2021/01/logo-Hoang-Kim-Mobile-retina-xam.png" type="image/x-icon">

	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="./css/bootstrap.min.css">
	<!-- Site CSS -->
	<link rel="stylesheet" href="./css/style.css">
	<!-- Responsive CSS -->
	<link rel="stylesheet" href="./css/responsive.css">
	<!-- Custom CSS -->
	<link rel="stylesheet" href="./css/custom.css">

	<!-- Font Awesome CSS links -->
	<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"
	integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

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

	<!-- Start Cart  -->
	<div class="cart-box-main">
		<div class="container">
			<div class="row">
				<div class="col-md-12 col-lg-12">
					<div class="order-box">
						<c:set var="currency" value="$" />
						<div class="title-left">
							<h3><fmt:message>order.success</fmt:message></h3>
						</div>
						<c:set var="currency" value="$"></c:set>
						<div class="d-flex">
							<h4><fmt:message>order.total</fmt:message></h4>
							<div class="ml-auto font-weight-bold">
							${currency}
							<fmt:formatNumber value="${total}"
								maxFractionDigits="2" pattern="#,##0.00">
							</fmt:formatNumber>
							</div>
						</div>
						<hr class="my-1">
						<div class="d-flex">
							<h4><fmt:message>order.discount</fmt:message></h4>
							<div class="ml-auto font-weight-bold">${currency}${discountPrice}</div>
						</div>
						<hr class="my-1">
						<div class="d-flex gr-total">
							<h5><fmt:message>order.grand</fmt:message></h5>
							<div class="ml-auto h5">
							${currency}
							<fmt:formatNumber value="${grandTotal}"
								maxFractionDigits="2" pattern="#,##0.00">
							</fmt:formatNumber>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Cart -->

	<!-- Start Footer  -->
	<%@include file="/WEB-INF/common/footer/footer.jsp"%>
	<!-- End Footer  -->

	<!-- ALL JS FILES -->
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
	<script src="./js/contact-form-script.js"></script>
	<script src="./js/custom.js"></script>
	<script src="./js/offer.js"></script>
</body>
</html>