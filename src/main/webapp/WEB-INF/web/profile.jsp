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
<title>Hoang Kim: Profile</title>
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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
	integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
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

	<!-- Start Contact Us  -->
	<div class="contact-box-main">
		<div class="container" style="width: 50vw; margin: 0 auto;">
			<div class="row">
				<div class="col-lg-12 col-sm-12">
					<div class="contact-form-right">
						<c:if test="${not empty success  }">
							<h3 style="color: green">${success }</h3>
						</c:if>
						<h2><fmt:message>profile.title</fmt:message></h2>
						<c:if test="${not empty error  }">
							<p style="color: red">${error }</p>e
						</c:if>
						<div id="imageContainer" style="width: 200px; height: 200px; border-radius: 50%; border: 2px dashed #ccc; margin: 0 auto; overflow: hidden; background-size: cover; background-position: center center;">
							<c:if test="${not empty sessionScope.account.photo}">
								<img src="${pageContext.request.contextPath}/uploads/${sessionScope.account.photo}" style="width:100%;height: 100%;object-fit:cover;">
							</c:if>
						</div>
						<div style="display: flex; justify-content: center; margin: 12px 0;"></div>
						<form id="contactForm" method="POST" enctype="multipart/form-data" action="${pageContext.request.contextPath}/SaveProfileServlet?email=${sessionScope.account.email}">
							<div class="row">
								<!-- <input id="hidden" type="hidden" name="email" value="${sessionScope.account.email}" /> -->
								<div class="col-md-12">
									<div style="display: flex;align-items: center;gap:10px"  class="form-group">
									<a style="white-space: nowrap; width: 200px"><fmt:message>register.name</fmt:message></a>
										<input type="text" class="form-control" id="name" name="name"
											placeholder="" onchange="changeEmailBorderColor()" required=""
											value="${sessionScope.account.name }">
									</div>
								</div>
								<div class="col-md-12">
									<div style="display: flex;align-items: center;gap:10px" class="form-group">
									<a style="white-space: nowrap;width: 200px"><fmt:message>register.address</fmt:message></a>
										<input type="text" class="form-control" id="address"
											name="address" placeholder=""
											onchange="changeEmailBorderColor()" required=""
											value="${sessionScope.account.address }">
									</div>
								</div>
								<div class="col-md-12">
									<div style="display: flex;align-items: center;gap:10px" class="form-group">
									<a style="white-space: nowrap;width: 200px"><fmt:message>register.phone</fmt:message></a>
										<input type="text" class="form-control" id="phone"
											name="phone" placeholder=""
											onchange="changeEmailBorderColor()" required=""
											value="${sessionScope.account.phone }"> 
											<span id="error-phone"></span>
									</div>
								</div>
								<div class="col-md-12">
									<div style="display: flex;align-items: center;gap:10px" class="form-group"> 
									<a style="white-space: nowrap;width: 200px"><fmt:message>profile.avatar</fmt:message></a>
										<input type="file" class="form-control" id="photo"
											name="photo" placeholder=""
											onchange="changeEmailBorderColor()">
									</div>
								</div>
								<div class="col-md-12" style="display: flex;align-items: center;gap:15px;justify-content: center;">
								<div>
									<div class="submit-button">
										<button type="submit" class="btn hvr-hover" name="action" value="save">
										<fmt:message>profile.save</fmt:message></button>
										<span id="error"></span>
										<div class="clearfix"></div>
									</div>
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
		var placeholderText4 = "<fmt:message>register.name</fmt:message>";
		document.getElementById('name').placeholder = placeholderText4;
		var placeholderText5 = "<fmt:message>register.address</fmt:message>";
		document.getElementById('address').placeholder = placeholderText5;
		var placeholderText6 = "<fmt:message>register.phone</fmt:message>";
		document.getElementById('phone').placeholder = placeholderText6;
		var placeholderText7 = "<fmt:message>profile.photo</fmt:message>";
		document.getElementById('photo').placeholder = placeholderText7;

		document.getElementById('fileInput').addEventListener('change', function(event) {
	    	const file = event.target.files[0];
	   	 	if (file) {
	        const reader = new FileReader();
	        reader.onload = function(e) {
	            const imageContainer = document.getElementById('imageContainer');
	            imageContainer.style.backgroundImage = `url('${e.target.result}')`;
	        };
	        reader.readAsDataURL(file);
	    }
	});
	</script>
	<script src="./js/jquery-3.2.1.min.js"></script>
	<script src="./js/popper.min.js"></script>
	<script src="./js/bootstrap.min.js"></script>
	<!--ALL PLUGINS  -->
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