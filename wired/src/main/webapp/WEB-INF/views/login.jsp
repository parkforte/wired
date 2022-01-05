<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- http://localhost:9091/wired/login -->

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Login</title>

    <!-- Custom fonts for this template-->
    <link href='<c:url value="/resources/vendor/fontawesome-free/css/all.min.css"/>' rel="stylesheet" type="text/css">
    <link href='<c:url value="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"/>'
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href='<c:url value="/resources/css/sb-admin-2.min.css"/>' rel="stylesheet">

</head>


<body style="background-color: #F2F2FC;">

    <div class="container">

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-12 col-md-9" style="margin-top: 12%;margin-right: 2%;">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0" style="height: 500px;">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-6 d-none d-lg-block" style="background: white">
                            	<img src='<c:url value="/resources/img/logo/wired_Biglogo.png"/>'
                            		style="width: 437px;margin-left: 6%;margin-top: 5%;">
                            </div>
                            <div class="col-lg-6">
                                <div class="p-5" style="height: 500px;">
                                    <div class="text-center" style="margin-top: 35px;">
                                        <h1 class="h4 text-gray-900 mb-4">Welcome Back!</h1>
                                    </div>
                                    <form class="user" name="frmLogin" method="post" action="<c:url value='/login'/>"
                                    	style="margin-top: 45px;">
                                        <!-- 아이디 -->
		                            	<div class="form-group">
	                                    <input type="text" class="form-control form-control-user c-size" name="memId" id="memId"
	                                        placeholder="Id" value="${cookie.ck_userid.value }">
	                                	</div>
                                        <!-- 비밀번호 -->
		                            	<div class="form-group">
	                                    <input type="password" class="form-control form-control-user c-size" name="memPwd" id="memPwd"
	                                        placeholder="Password">
	                                	</div>
                                        <div class="form-group">
                                            <div class="custom-control custom-checkbox small">
                                                <input type="checkbox" class="custom-control-input" id="customCheck"
                                                	name="chkSave" id="chkSave"
                                                	<c:if test="${!empty cookie.ck_userid }">
                                                		checked="checked"
                                                	</c:if>
                                                	>
                                                <label class="custom-control-label" for="customCheck">Remember
                                                    Me</label>
                                            </div>
                                        </div>
                                        <button type="submit" class="btn btn-primary btn-user btn-block" id="ok_button"
                                        	style="margin-top: 42px;">Login</button>
                                        <%-- <a href='<c:url value="index.html"/>' class="btn btn-primary btn-user btn-block">
                                            Login
                                        </a> --%>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>

    <!-- Bootstrap core JavaScript-->
    <script src='<c:url value="/resources/vendor/jquery/jquery.min.js"/>'></script>
    <script src='<c:url value="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"/>'></script>

    <!-- Core plugin JavaScript-->
    <script src='<c:url value="/resources/vendor/jquery-easing/jquery.easing.min.js"/>'></script>

    <!-- Custom scripts for all pages-->
    <script src='<c:url value="/resources/js/sb-admin-2.min.js"/>'></script>

</body>

</html>