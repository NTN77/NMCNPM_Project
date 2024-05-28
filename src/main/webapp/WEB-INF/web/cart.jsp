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
    <title>Hoang Kim: Cart</title>
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

<!-- Start Cart  -->
<div class="cart-box-main">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="table-main table-responsive">
                    <c:choose>
                        <c:when test="${not empty cart.items }">
                            <table class="table">
                                <thead>
                                <tr>
                                    <th><fmt:message>cart.image</fmt:message></th>
                                    <th><fmt:message>cart.product.name</fmt:message></th>
                                    <th><fmt:message>cart.price</fmt:message></th>
                                    <th><fmt:message>cart.quantity</fmt:message></th>

                                </tr>
                                </thead>
                                <c:forEach var="product" items="${cart.items}">
                                    <tbody>
                                    <tr>
                                        <td class="thumbnail-img"><a
                                                href="<c:url value="/ProductDetailServlet?productID=${product.id }"/>">
                                            <img class="img-fluid" src="${product.src}" alt="" />
                                        </a></td>
                                        <td class="name-pr">${product.name}</td>
                                        <td class="price-pr">
                                            <c:choose>
                                                <c:when test="${param.lang eq 'en_US' || sessionScope.LANG eq 'en_US'}">
                                                    <p>$<fmt:formatNumber value="${product.price}" maxFractionDigits="2" pattern="#,##0.00"></fmt:formatNumber></p>
                                                </c:when>
                                            <c:when test="${param.lang eq 'vi_VN' || sessionScope.LANG eq 'vi_VN'}">
                                                <h5><fmt:formatNumber value="${product.vietnamPrice()}" type="number" maxFractionDigits="0" pattern="#,##0"/> đồng</h5>
                                            </c:when>
                                        </c:choose>
                                        </td>
                                        <td class="quantity-box">
                                            <div style="display: flex; align-items: center;">
                                                <div>
                                                    <c:url var="updateProductQuantity" value="/AddToCartServlet">
                                                        <c:param name="action" value="updateQuantity"></c:param>
                                                        <c:param name="id" value="${product.id}"></c:param>
                                                    </c:url>
                                                    <!-- Sequence diagram: UpdateQuantity - CNPM
                                                          2: click button "Update" (is sent by User)
                                                    -->
                                                    <form style="width:120px" method="POST" action="${updateProductQuantity}">
                                                        <input style="width:50px" class="number-input" type="number" min="0"
                                                               name="pQuantity" value="${product.number}"
                                                               data-product-id="${product.id}">
                                                        <button class="stepper-button" type="submit">
                                                            <fmt:message>cart.update</fmt:message>
                                                        </button>
                                                    </form>
                                                </div>
                                                <div>
                                                    <c:url var="deleteURL" value="/AddToCartServlet">
                                                        <c:param name="action" value="delete"></c:param>
                                                        <c:param name="id" value="${product.id}"></c:param>
                                                    </c:url>
                                                    <!-- Sequence diagram: RemoveItem - CNPM
                                                          3: click button "Delete" (is sent by User)
                                                    -->
                                                    <form method="POST" action="${deleteURL}">
                                                        <button class="btn btn-danger" type="submit">
                                                            <fmt:message>cart.delete</fmt:message>
                                                        </button>
                                                    </form>
                                                </div>
                                            </div>
                                        </td>

                                    </tr>
                                    </tbody>
                                </c:forEach>
                            </table>
                            <div>
                                <c:choose>
                                    <c:when test="${param.lang eq 'en_US' || sessionScope.LANG eq 'en_US'}">
                                        <h3><fmt:message>cart.total</fmt:message>:
                                            $<fmt:formatNumber value="${sessionScope.cart.getTotalAmount()}" maxFractionDigits="2" pattern="#,##0.00"></fmt:formatNumber></h3>
                                    </c:when>
                                    <c:when test="${param.lang eq 'vi_VN' || sessionScope.LANG eq 'vi_VN'}">
                                        <h3><fmt:message>cart.total</fmt:message>:
                                            <fmt:formatNumber value="${sessionScope.cart.getVNTotalAmount()}" type="number" maxFractionDigits="0" pattern="#,##0"/> đồng</h3>
                                    </c:when>
                                </c:choose>
                                <form>
                                    <input id="hidden" type="hidden" name="action" value="checkout">
                                    <button class="btn btn-success" type="submit">
                                        <fmt:message>cart.checkout</fmt:message>
                                    </button>
                                </form>
                            </div>
                        </c:when>

                        <c:otherwise>
                            <div class="center-vertical">
                                <div class="report">
                                    <c:if test="${account != null }">
                                        <h2 class="title" style="text-align: center">
                                            <fmt:message>cart.empty.user</fmt:message>
                                                ${account.name }
                                            <fmt:message>cart.empty.oi</fmt:message>
                                        </h2>
                                    </c:if>
                                    <c:if test="${account == null }">
                                        <h2 class="title" style="text-align: center">
                                            <fmt:message>cart.empty</fmt:message>
                                        </h2>
                                    </c:if>
                                    <img style="position: relative; top: 50%; left: 31.5%;"
                                         src="./image/hungry.jpg" />
                                </div>
                            </div>
                        </c:otherwise>
                    </c:choose>
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
<script src="./js/cart.js"></script>
<script src="./js/offer.js"></script>
</body>
</html>