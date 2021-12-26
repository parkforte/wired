<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>

<!-- Custom styles for this template-->
<link href="css/sb-admin-2.min.css" rel="stylesheet">

<!-- http://localhost:9091/wired/employee/emplRegister -->

<!-- css영역 -->
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');

</style>
<!-- javaScript영역 -->
<script type="text/javascript">


</script>

<body class="bg-gradient-primary font">

    <div class="container">

        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">사원등록</h1>
                            </div>
                            <form class="user">
                                <div class="form-group row">
                                    <div class="col-sm-3 mb-0 mb-sm-0">
                                        <input type="text" class="form-control form-control-user" id="name"
                                            placeholder="이름">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-3 sm-0 mb-sm-0">
                                        <input type="text" class="form-control form-control-user" id="id"
                                            placeholder="아이디">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-3">
                                        <input type="password" class="form-control form-control-user"
                                            id="inputPassword" placeholder="비밀번호">
                                    </div>
                                    <div class="col-sm-3">
                                        <input type="password" class="form-control form-control-user"
                                            id="repeatPassword" placeholder="비밀번호 확인">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-3">
                                        <input type="text" class="form-control form-control-user" id="hp1"
                                            placeholder="연락처1">
                                    </div>
                                    <div class="col-sm-3">
                                        <input type="text" class="form-control form-control-user" id="hp2"
                                            placeholder="연락처2">
                                    </div>
                                    <div class="col-sm-3">
                                        <input type="text" class="form-control form-control-user" id="hp3"
                                            placeholder="연락처3">
                                    </div>
                                </div>
                                <div class="form-group row">
                                	<div class="col-sm-9">
                                    <input type="email" class="form-control form-control-user" id="email"
                                        placeholder="이메일">
                                    </div>    
                                </div>
                                
                                <a href="login.html" class="btn btn-primary btn-user btn-block">
                                    등록
                                </a>
                             </form>
                        </div>
            </div>
        </div>

    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>

</body>
<%@ include file="../inc/bottom.jsp" %>
			