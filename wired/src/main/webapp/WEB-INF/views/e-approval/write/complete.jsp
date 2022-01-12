<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp"%>

<!-- http://localhost:9091/wired/default/defaultPage -->
<!-- 2 load the theme CSS file -->
<link rel="stylesheet"
	href="<c:url value='/resources/api/jsTree/dist/themes/proton/style.min.css' />" />

<style type="text/css">
.f-right {
	float: right;
}

.f-left {
	float: left;
}

.setW20 {
	width: 20%;
}

.setW75 {
	width: 75%;
}

.setMR10 {
	margin-right: 10px;
}

.paper {
	width: 210mm;
	min-height: 297mm;
	padding: 20mm; /* set contents area */
	margin: 10mm auto;
	border-radius: 5px;
	background: #fff;
	box-shadow: 0 0 5px rgba(0, 0, 0, 0.5);
}

.tg {
	border-collapse: collapse;
	border-spacing: 0;
}

.tg td {
	border-color: black;
	border-style: solid;
	border-width: 1px;
	font-family: Arial, sans-serif;
	font-size: 14px;
	overflow: hidden;
	padding: 10px 5px;
	word-break: normal;
}

.tg th {
	border-color: black;
	border-style: solid;
	border-width: 1px;
	font-size: 14px;
	font-weight: normal;
	overflow: hidden;
	word-break: normal;
}

.tg .tg-cly1 {
	text-align: left;
	vertical-align: middle
}

.tg .tg-lboi {
	border-color: inherit;
	text-align: left;
	vertical-align: middle
}

.dnd {
	background-color: silver;
}

.sigTitle {
	height: 20px;
	background-color: pink;
}

.sigImg {
	margin-top:20px;
	background-color: silver;
}

.sigBox {
	height: 70px;
	background-color: silver;
}

.btnMargin {
	margin-left: 40px;
	margin-top: 5px;
}


.bs4-order-tracking {
    margin-bottom: 30px;
    overflow: hidden;
    color: #878788;
    padding-left: 0px;
    margin-top: 30px
}

.bs4-order-tracking li {
    list-style-type: none;
    font-size: 13px;
    width: 25%;
    float: left;
    position: relative;
    font-weight: 400;
    color: #878788;
    text-align: center
}

.bs4-order-tracking li:first-child:before {
    margin-left: 15px !important;
    padding-left: 11px !important;
    text-align: left !important
}

.bs4-order-tracking li:last-child:before {
    margin-right: 5px !important;
    padding-right: 11px !important;
    text-align: right !important
}

.bs4-order-tracking li>div {
    color: #fff;
    width: 29px;
    text-align: center;
    line-height: 29px;
    display: block;
    font-size: 12px;
    background: #878788;
    border-radius: 50%;
    margin: auto
}

.bs4-order-tracking li:after {
    content: '';
    width: 150%;
    height: 2px;
    background: #878788;
    position: absolute;
    left: 0%;
    right: 0%;
    top: 15px;
    z-index: -1
}

.bs4-order-tracking li:first-child:after {
    left: 50%
}

.bs4-order-tracking li:last-child:after {
    left: 0% !important;
    width: 0% !important
}

.bs4-order-tracking li.active {
    font-weight: bold;
    color: #FF73B8
}

.bs4-order-tracking li.active>div {
    background: #FF73B8
}

.bs4-order-tracking li.active:after {
    background: #FF73B8
}

.card-timeline {
    background-color: #fff;
    z-index: 0
}
</style>
<script
	src="<c:url value='/resources/api/jsTree/dist/libs/jquery.js'/> "></script>

<script type="text/javascript">

</script>
<!-- 전자결재HOME -->
<div class="container-fluid">
	<%@ include file="../include/navbar.jsp"%>
	<div class="card card-timeline px-2 border-none">
	    <ul class="bs4-order-tracking">
	        <li class="step active">
	            <div><i class="fas fa-user"></i></div> 문서선택
	        </li>
	        <li class="step active">
	            <div><i class="fas fa-bread-slice"></i></div> 문서작성
	        </li>
	        <li class="step active">
	            <div><i class="fas fa-truck"></i></div> 문서확인
	        </li>
	        <li class="step active">
	            <div><i class="fas fa-birthday-cake"></i></div> 상신완료
	        </li>
	    </ul>
	    <h5 class="text-center"><b>문서를 상신하였습니다.</b></h5>
	</div>


	<div>
		<div class="card shadow mb-4">
			<div class="card-header py-3 ">
				<div class="setW20 f-left">
					<h6 class="m-0 font-weight-bold text-primary">문서작성</h6>
				</div>
			</div>
			<div class="card-body">

			<div class="card">
             <div class="text-right cross"> <i class="fa fa-times"></i> </div>
             <div class="card-body text-center"> <img src="https://i.imgur.com/HGAvgxi.png">
                 <h4>Phrase "Discovery" sent!</h4>
                 <p>문서를 PDF로 출력하시거나 알림메일도 송신 가능합니다.</p>
             </div>
       		  </div>

			</div>

		</div>
	</div>
</div>
<!-- /.container-fluid -->

<%@ include file="../../inc/bottom.jsp"%>