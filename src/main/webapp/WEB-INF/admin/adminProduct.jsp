
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Product" %>
<%@ page import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi-VN">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
    <title>Danh sách sản phẩm</title>
    <link rel="icon" href="https://hoangkimmobile.com/wp-content/uploads/2021/01/logo-Hoang-Kim-Mobile-retina-xam.png"
          sizes="192x192" />

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="./assets/plugins/bootstrap/css/bootstrap.min.css">

    <!-- Fontawesome CSS -->
    <link rel="stylesheet" href="./assets/plugins/fontawesome/css/fontawesome.min.css">
    <link rel="stylesheet" href="./assets/plugins/fontawesome/css/all.min.css">
    <link rel="stylesheet" href="./assets/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

    <!-- Datatables CSS -->
    <link rel="stylesheet" href="./assets/plugins/datatables/datatables.min.css">

    <!-- Animate CSS -->
    <link rel="stylesheet" href="./assets/css/animate.min.css">

    <!-- Main CSS -->
    <link rel="stylesheet" href="./assets/css/admin.css">
<style>
    .modall{
        position: fixed;
        z-index: 1000;
        inset: 0;
        background-color: rgba(0, 0, 0,0.5);
        display: flex;
        align-items: center;
        justify-content: center;
    }
    .modall_container{
        width: 500px;
        padding-top: 20px;
        border-radius: 20px;
        position: relative;
    }
    .btn-cancel{
        position: absolute;
        top: 10px;
        right: 10px;
        cursor: pointer;
        z-index: 1000000;
    }


    .n{
        display: none;
    }
    .b{
        display:block;
    }
    .form {
        height: 18em;
        width: 16em;
        padding: 4%;
        border-radius: 16px;
        background: #e8e8e8;
        box-shadow: 12px 12px 18px #bababa,
        -12px -12px 18px #ffffff;
        display: flex;
        flex-direction: column;
        align-items: stretch;
        justify-content: space-evenly;
    }

    #login-lable {
        height: 15%;
        text-align: center;
        font-size: 34px;
        letter-spacing: 3px;
        font-weight: 600;
        text-shadow: -2px -2px 3px #ffffff ,
        2px 2px 3px #bababa;
        position: relative;
        top: -14px;
    }

    .input {
        height: 16%;
        padding: 1px 8px;
        border: none;
        font-size: 1em;
        letter-spacing: 2px;
        border-radius: 8px;
        background: #f3f3f3;
        box-shadow: inset -2px -2px 4px #ffffff,
        inset 2px 2px 4px rgba(0, 0, 0, 0.356);
        text-decoration: none;
        background: linear-gradient(to right,white, #80808010, white);
        background-size: 200% 200%;
        animation: input 4s infinite;
    }

    .input:focus-visible {
        outline: none;
        background: rgb(241, 241, 241);
    }

    #btn {
        font-size: x-large;
        letter-spacing: 3px;
        color: white;
        font-weight: 700;
        height: 18%;
        background: linear-gradient(144deg,#af40ff,
        #5b42f3 50%,#00ddeb);
        border-radius: 8px;
        border: none;
        box-shadow: inset 1px 3px 3px #ffffffbd,
        inset -4px -4px 3px #00000046;
        background-size: 150% 150%;
        animation: input 5s infinite;
        transition: all 900ms ease-in;
    }

    #btn:hover {
        position: relative;
        bottom: 3px;
        background: linear-gradient(144deg,#9706ff,
        #2f0fff 50%,#18f0ff);
    }

    @keyframes input {
        0% {
            background-position: 0% 50%;
        }

        50% {
            background-position: 100% 50%;
        }

        100% {
            background-position: 0% 50%;
        }
    }


</style>
</head>
<%
    List<Product> products = (List<Product>) request.getAttribute("products");
    if(products == null) {
        products = new ArrayList<>();
    }

%>
<body>
<div class="main-wrapper">
    <jsp:include page="../web/menu.jsp"></jsp:include>
    <div class="page-wrapper">
        <div class="content container-fluid">

            <!-- Page Header -->
            <div class="page-header">
                <div class="row">
                    <div class="col">
                        <h3 class="page-title">Danh sách sản phẩm</h3>
                    </div>
                    <div class="col-auto text-right">
                        <a class="btn btn-primary add-button ml-3" href="${pageContext.request.contextPath}/addNewProduct"><i class="fas fa-plus"></i></a>
                    </div>
                </div>
            </div>
            <!-- /Page Header -->

            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-hover table-center mb-0 datatable">
                                    <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Tên</th>
                                        <th>Mô tả</th>
                                        <th>Giá bán</th>
                                        <th>Ảnh</th>
                                        <th>Loại điện thoại</th>
                                        <th>Thương hiệu</th>
                                        <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1"
                                            aria-label="Sua grade: activate to sort column ascending">Sửa</th>
                                        <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1"
                                            aria-label="Xoa grade: activate to sort column ascending">Xóa</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            for (Product p : products){
                                        %>
                                        <tr>
                                            <td><%= p.getId()%></td>
                                            <td><%= p.getName()%></td>
                                            <td><%= p.getDescription()%></td>
                                             <td class="text-center"><fmt:setLocale value = "vi_Vn"/>
                                            <fmt:formatNumber type="currency"
                                                              value ="<%= p.getPrice() %>" currencySymbol="VNĐ"/> </td>
                                            <td><img src="${pageContext.request.contextPath}/image/<%=p.getSrc() %>" style="width: 50px"></td>
                                            <td><%= p.getType()%></td>
                                            <td><%= p.getBrand()%></td>

                                            <td class="text-center"><a href="${pageContext.request.contextPath}/AdminHomePage?action=updateProduct&id=<%=p.getId()%>" class="btn btn-info"><i class="fa-solid fa-pen-to-square" style="color: #00040a;font-size: 20px"></i></a></td>

                                            <td class="text-center"><a onclick="return handleLinkClick(event , <%= p.getId() %>)" href="${pageContext.request.contextPath }/AdminHomePage?action=delete&id=<%=p.getId()%>" class="btn btn-danger"><i class="fas fa-trash" style="color: #000000;"></i></a></td>
                                        </tr>
                                        <%}%>
<%--                                        Ham xử lí khi bạn xóa sản phẩm--%>
                                        <script type="text/javascript">
                                            function handleLinkClick(event, id) {
                                                var confirmation = confirm("Bạn có chắc chắn muốn xóa sản phẩm này?");
                                                if (confirmation) {
                                                    var linkHref = "${pageContext.request.contextPath }/AdminHomePage?action=delete&id=" + id;
                                                    window.location.href = linkHref;
                                                } else {
                                                }
                                                return false; // Ngăn chặn hành vi mặc định của thẻ <a>
                                            }
                                        </script>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modall n">
        <div class="modall_container bg-white" style="margin: auto; margin-top: 10%">
            <button class="btn btn-link btn-cancel">X</button>
            <div class="content container-fluid">
                <div class="row">
                    <div style="width: 100%" class="">

                        <!-- Page Header -->
                        <div class="page-header">
                            <div class="row">
                                <div class="col">
                                    <h3 class="page-title pl-4">Thêm Sản phẩm</h3>
                                    <ul class="breadcrumb pl-4">
                                        <li class="breadcrumb-item active">Thêm Sản phâm</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <!-- /Page Header -->

<%--                        <div class="card">--%>
<%--                            <div class="card-body">--%>
<%--                                <!-- Form -->--%>
<%--                                <form action="add-admin" method="post" accept-charset="UTF-8" id="login-form">--%>
<%--                                    <div class="form-group row">--%>
<%--                                        <label class="col-form-label col-md-3">Tên người dùng</label>--%>
<%--                                        <div class="col-md-9">--%>
<%--                                            <input type="text" class="form-control" name="username">--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                    <div class="form-group row">--%>
<%--                                        <label class="col-form-label col-md-3">Email</label>--%>
<%--                                        <div class="col-md-9">--%>
<%--                                            <input type="email" class="form-control" name="email">--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                    <div class="form-group row">--%>
<%--                                        <label class="col-form-label col-md-3">Mật khẩu</label>--%>
<%--                                        <div class="col-md-9">--%>
<%--                                            <input id="pass" type="password" required class="form-control" name="pass">--%>
<%--&lt;%&ndash;                                            <label style="color: red" id="pw-notice">Mật khẩu phải dài từ 8 kí tự và chứa cả chữ in hoa và số</label>&ndash;%&gt;--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                    <div class="form-group row">--%>
<%--                                        <label class="col-form-label col-md-3">Điện thoại</label>--%>
<%--                                        <div class="col-md-9">--%>
<%--                                            <input type="tel" class="form-control" name="phone" required>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                    <div class="mt-4">--%>
<%--                                        <button style="width: 100%" class="btn btn-primary btn-save" type="submit">Lưu</button>--%>
<%--                                    </div>--%>
<%--                                </form>--%>

<%--                            </div>--%>
<%--                        </div>--%>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>

<!-- jQuery -->
<script src="./assets/js/jquery-3.5.0.min.js"></script>

<!-- Bootstrap Core JS -->
<script src="./assets/js/popper.min.js"></script>
<script src="./assets/plugins/bootstrap/js/bootstrap.min.js"></script>

<!-- Datatables JS -->
<script src="./assets/plugins/datatables/datatables.min.js"></script>

<!-- Select2 JS -->
<script src="./assets/js/select2.min.js"></script>

<!-- Custom JS -->
<script src="./assets/js/admin.js"></script>

</body>

</html>
