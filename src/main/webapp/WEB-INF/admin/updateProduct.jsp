
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Product" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dao.IProductDAO" %>
<%@ page import="dao.impl.ProductDAO" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="vi-VN">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
    <link rel="icon" href="https://hoangkimmobile.com/wp-content/uploads/2021/01/logo-Hoang-Kim-Mobile-retina-xam.png"
          sizes="192x192" />

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="./assets/plugins/bootstrap/css/bootstrap.min.css">

    <!-- Fontawesome CSS -->
    <link rel="stylesheet" href="./assets/plugins/fontawesome/css/fontawesome.min.css">
    <link rel="stylesheet" href="./assets/plugins/fontawesome/css/all.min.css">
    <link rel="stylesheet" href="./assets/css/font-awesome.min.css">

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
    <% Product product = (Product) request.getAttribute("product1");
        IProductDAO productDAO = new ProductDAO();
        DecimalFormat df = new DecimalFormat("########");

    %>
</head>
<body>
<div class="main-wrapper">
    <div class="page-wrapper">
        <div class="content container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="col-md-8 d-flex justify-content-center">
                                <h2 class="m-3 pl-lg-3 w-0">Nhập Dữ Liệu Điện Thoại</h2>
                            </div>
                            <form action="${pageContext.request.contextPath}/updateProduct?id=<%=product.getId()%>" method="post" enctype="multipart/form-data">
                                <div class="card-body p-4" >
                                    <div class="row">
                                        <div class="col-md-6 ml-5">
                                            <div class="form-group">
                                                <label >Tên Sản Phẩm (*)</label>
                                                <input type="text" class="form-control"  name="name" placeholder="" required="required" value="<%=product.getName()%>">
                                            </div>
                                        </div>
                                        <div class="col-md-6 ml-5">
                                            <div class="form-group">
                                                <label for="inputDescription">Thêm mô tả (*)</label>
                                                <textarea name="description" id="inputDescription" class="form-control" rows="4" style="height: 122px;"
                                                          ><%= product.getDescription() %></textarea>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6 ml-5">
                                        <div class="form-group">
                                            <label for="price">Giá tiền (*)</label>
                                            <input type="number" class="form-control" id="price" name="price" placeholder="" required="required"
                                                   value="<%=product.getPrice()%>">
                                        </div>
                                    </div>
                                    <div class="col-md-8 ml-5">
                                        <label>Nhập ảnh hãng xe (*)</label> <br>
                                        <input type="file" name="src" id="input" value="<%=product.getSrc()%>">
                                        <div id="src"></div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6 ml-5">
                                        <div class="form-group">
                                            <label for="type">Loại sản phẩm (*)</label>
                                            <input type="text" class="form-control" id="type" name="type" placeholder="" required="required"
                                                   value="<%=product.getType()%>">
                                        </div>
                                    </div>
                                    <div class="col-md-6 ml-5">
                                        <div class="form-group">
                                            <label for="price">Thương hiệu sản phẩm (*)</label>
                                            <input type="text" class="form-control" id="brand" name="brand" placeholder="" required="required"
                                                   value="<%=product.getBrand()%>">
                                        </div>
                                    </div>

                                </div>

                                <div class="row">
                                    <!-- /.card-body -->
                                    <div class="card-footer  ml-5">
                                        <button type="submit" class="btn btn-primary">Sửa </button>
                                    </div>
                                </div>
                            </form>
                        </div>
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


</body>

</html>
