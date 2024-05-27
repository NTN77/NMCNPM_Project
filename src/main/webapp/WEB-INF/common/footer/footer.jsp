<footer>
	<div class="footer-main">
		<div class="container">
			<div class="row">
				<div class="col-lg-4 col-md-12 col-sm-12">
					<div class="footer-top-box">
						<h3><fmt:message>footer.contact</fmt:message></h3>
						<ul class="list-time">
							<li><i class="fa fa-map-marker"></i> <fmt:message>footer.address</fmt:message>:
								456 Truong Chinh Street, Ward 13, Tan Binh District, Ho Chi Minh City, Vietnam</li>
							<li><i class="fa fa-phone-square"></i> <fmt:message>footer.phone</fmt:message>: (+84)
								<a href="tel:+84 384774118">384.774.118</a></li>
							<li><i class="fa fa-envelope"></i> Email: 
								<a href="mailto:thuandangnam@gmail.com">thuandangnam@gmail.com</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-4 col-md-12 col-sm-12">
					<div class="footer-top-box">
						<h3><fmt:message>footer.offer</fmt:message></h3>
						<form id="register-offer" class="newsletter-box" method="POST"
							action="${pageContext.request.contextPath}/SaveEmailOfferServlet">
							<div class="form-group">
								<input id="email-offer" type="email" name="email" placeholder=""
									onchange="changeEmailOfferBorderColor()" /> <i
									class="fa fa-envelope"></i>
							</div>
							<script>
								// Sử dụng JavaScript để chèn nội dung động vào placeholder mà không có dấu ngoặc kép
								var placeholderText = "<fmt:message>footer.email</fmt:message>";
								document.getElementById('email-offer').placeholder = placeholderText;
							</script>
							<button class="btn hvr-hover" type="submit" onclick="registerOffer(event)">
								<fmt:message>footer.register</fmt:message></button>
						</form>
					</div>
				</div>
				<div class="col-lg-4 col-md-12 col-sm-12">
					<div class="footer-top-box">
						<h3><fmt:message>footer.media</fmt:message></h3>
						<ul>
							<li><a href="#" class="social"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
							<li><a href="#" class="social"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
							<li><a href="#" class="social"><i class="fa fa-linkedin" aria-hidden="true"></i></a></li>
							<li><a href="#" class="social"><i class="fa fa-google-plus" aria-hidden="true"></i></a></li>
							<li><a href="#" class="social"><i class="fa fa-rss" aria-hidden="true"></i></a></li>
							<li><a href="#" class="social"><i class="fa fa-pinterest-p" aria-hidden="true"></i></a></li>
							<li><a href="#" class="social"><i class="fa fa-whatsapp" aria-hidden="true"></i></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</footer>

<!-- Start copyright  -->
<div class="footer-copyright">
	<p class="footer-company">All Rights Reserved. &copy; 2024</p>
</div>
<!-- End copyright  -->
<a href="#" id="back-to-top" title="Back to top" style="display: none;">&uarr;</a>