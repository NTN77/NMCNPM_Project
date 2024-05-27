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
	<title>Hoang Kim: Register</title>
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
						<h2><fmt:message>register.signup</fmt:message></h2>
						<c:if test="${not empty error_register  }">
							<p style="color: red">${error_register }</p>
						</c:if>
						<form id="form-register" method="POST" action="${pageContext.request.contextPath}/RegisterServlet">
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<input type="text" class="form-control" id="email"
											name="email" placeholder=""
											onchange="changeEmailBorderColor()">
									</div>
								</div>
								<div class="col-md-12">
									<div class="form-group">
										<input type="password" placeholder=""
											id="password" class="form-control" name="password"
											onchange="changePasswordBorderColor()">
									</div>
								</div>
								<div class="col-md-12">
									<div class="form-group">
										<input type="password" placeholder=""
											id="repeat-password" class="form-control"
											name="repeat-password" onchange="changePasswordBorderColor()">
									</div>
								</div>
								<div class="col-md-12">
									<div class="form-group">
										<input type="text" class="form-control" id="name" name="name"
											placeholder="" onchange="changeEmailBorderColor()">
									</div>
								</div>
								<div class="col-md-12">
									<div class="form-group">
										<input type="text" class="form-control" id="address"
											name="address" placeholder=""
											onchange="changeEmailBorderColor()">
									</div>
								</div>
								<div class="col-md-12">
									<div class="form-group">
										<input type="text" class="form-control" id="phone"
											name="phone" placeholder=""
											onchange="changeEmailBorderColor()"> 
											<span id="error-phone"></span>
									</div>
								</div>
								<div class="col-lg-12">
									<p>
										<fmt:message>register.account</fmt:message> <a
											style="text-decoration: none; color: blue"
											class="register-link"
											href="${pageContext.request.contextPath}/LoginServlet"><fmt:message>register.signin</fmt:message></a>
									</p>
								</div>
								<div class="col-md-12">
									<div class="submit-button text-center">
										<button type="submit" class="btn hvr-hover"
											onclick="register(event)"><fmt:message>register.button</fmt:message></button>
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
		var placeholderText1 = "<fmt:message>register.email</fmt:message>";
		document.getElementById('email').placeholder = placeholderText1;
		var placeholderText2 = "<fmt:message>register.password</fmt:message>";
		document.getElementById('password').placeholder = placeholderText2;
		var placeholderText3 = "<fmt:message>register.repeat</fmt:message>";
		document.getElementById('repeat-password').placeholder = placeholderText3;
		var placeholderText4 = "<fmt:message>register.name</fmt:message>";
		document.getElementById('name').placeholder = placeholderText4;
		var placeholderText5 = "<fmt:message>register.address</fmt:message>";
		document.getElementById('address').placeholder = placeholderText5;
		var placeholderText6 = "<fmt:message>register.phone</fmt:message>";
		document.getElementById('phone').placeholder = placeholderText6;
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
	<script src="./js/register.js"></script>
	<script src="./js/offer.js"></script>
</body>
</html>