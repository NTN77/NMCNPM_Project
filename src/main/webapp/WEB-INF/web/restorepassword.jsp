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
	<title>Hoang Kim: Restore Password</title>
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

	<!-- Start Contact Us  -->
	<div class="contact-box-main">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-sm-12">
					<div class="contact-form-right">
						<h3><fmt:message>restore.fill</fmt:message></h3>
						<c:choose>
							<c:when test="${not empty param.email}">
								<c:set var="email" value="${param.email}" />
								<form id="contactForm" method="POST" action="${pageContext.request.contextPath}/RestorePasswordServlet?email=${email }">
							</c:when>
							<c:otherwise>
								<c:set var="email" value="" />
								<form id="contactForm" method="POST" action="${pageContext.request.contextPath}/RestorePasswordServlet">
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${not empty error}">
								<c:set var="error" value="${error }" />
							</c:when>
							<c:otherwise>
								<c:set var="error" value="" />
							</c:otherwise>
						</c:choose>
						<c:if test="${not empty error  }">
							<p style="color: red">${error }</p>
						</c:if>				
							<div class="row">
								<!--  <input id="hidden" type="hidden" name="email" value="${email}" /> -->
								<div class="col-md-12">
									<div class="form-group">
										<input type="password" placeholder=""
											id="password" class="form-control" name="password" onchange="changePasswordBorderColor()"
											required="">
									</div>
								</div>
								<div class="col-md-12">
									<div class="submit-button text-center">
										<button type="submit" class="btn hvr-hover" 
										onclick="restore(event)"><fmt:message>restore.button</fmt:message></button>
										<span id="error"></span>
										<div class="clearfix"></div>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Contact Us  -->

	<!-- Start Footer  -->
	<%@include file="/WEB-INF/common/footer/footer.jsp"%>
	<!-- End Footer  -->

	<!-- ALL JS FILES -->
	<script>
		var placeholderText2 = "<fmt:message>register.password</fmt:message>";
		document.getElementById('password').placeholder = placeholderText2;
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
	<script src="./js/contact-form-script.js"></script>
	<script src="./js/custom.js"></script>
	<script src="./js/login.js"></script>
	<script src="./js/offer.js"></script>
</body>
</html>