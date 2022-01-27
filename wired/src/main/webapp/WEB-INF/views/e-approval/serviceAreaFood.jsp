<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Custom styles for this template-->
<link
	href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css"
	rel="stylesheet">
<!-- 부트스트랩 version 4.6.0 -->
<!-- 부트스트랩 icon -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/mainstyle.css" />
<style type="text/css">
body {
	margin: 5px;
	padding: 5px;
}

caption {
	visibility: hidden;
}

p {
	font-size: 1.0em;
}

#divZip table {
	width: 430px;
	margin: 15px 0;
}

.blue {
	color: #006AD5;
}

#divPage {
	text-align: center;
}

.center {
	margin: 0 auto;
}

.f-right {
	float: right;
}
</style>

<script type="text/javascript"
	src="<c:url value='/resources/js/jquery-3.6.0.min.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/resources/js/paging.js'/>"></script>
<script type="text/javascript">
	var count=0;

	$(function(){
		$('#serviceAreaName').focus();

		$('#frm').submit(function(){
			if($('#serviceAreaName').val()==''){
				alert('휴게소명을 입력하세요');
				$('#serviceAreaName').focus();
				return false;
			}

			$.send(1);

			event.preventDefault();
		});

	});

	$.send = function(curPage){
		$('#currentPage').val(curPage);

		$.ajax({
			url : "<c:url value='/e-approval/ajaxServiceAreaFood'/>",
			type:"post",
			data:$("#frm").serializeArray(),
			dataType:"json",
			success:function(res){
				count=res.count;

				if(res!=null){
					makeList(res);
				}
			},
			error:function(xhr, status, error){
				alert("error : " + error);
			}
		});
	}

	function makeList(jsonStr){
		if(count==0){
			$('#divCount').html("");
			$('#divZip').html("<p style='text-align:center'>검색된 내용이 없습니다.</p>");

			return;
		}

		$('#divCount').html("<b><p style='text-align:center'>휴게소 검색 결과 ("+ count +"건)</p></b>");

		var str="<table class='box2' style='width:100%'>";
		str+="<tr><th style='width:20%'>휴게소코드</th>";
		str+="<th style='width:20%'>휴게소명(방향)</th>";
		str+="<th style='width:20%'>노선명</th>";
		str+="<th style='width:20%'>메뉴명</th>";
		str+="<th style='width:20%'>가격</th></tr>";

		$(jsonStr.list).each(function(idx, item){
			var serviceAreaCode2 = this.serviceAreaCode2;
			var serviceAreaName=this.serviceAreaName;
			var routeName=this.routeName;
			var batchMenu=this.batchMenu;
			var salePrice=this.salePrice;

			str += "<tr>";
			str += "<td>"+serviceAreaCode2+"</td>";
			str += "<td>"+serviceAreaName+"</td>";
			str += "<td>"+routeName+"</td>";
			str += "<td>"+batchMenu+"</td>";
			str += "<td>"+salePrice+"</td>";
			str += "</tr>";
		});

		str+="</table>";

		$('#divZip').html(str);
	}
</script>

</head>
<body>
	<form name="frm" id="frm" method="post">
		<div class="jumbotron">
			<h1 class="display-4">휴게소별 대표메뉴 검색</h1>
			<p class="lead">휴게소 이름을 입력하세요.</p>
			<hr class="my-4">
			<p>검색어 예 : 여주, 화성, 선산</p>
			<div class="input-group input-group-sm mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text" id="inputGroup-sizing-sm">검색어</span>
				</div>
				<input type="text" name="serviceAreaName" id="serviceAreaName" class="form-control"
					aria-label="Sizing example input"
					aria-describedby="inputGroup-sizing-sm">
			</div>
			<button type="submit" class="btn btn-primary f-right">찾기</button>
			<!-- 요청 변수 설정 (현재 페이지) -->
			<input type="hidden" name="pageNo" id="pageNo" value="1" />
			<!-- 요청 변수 설정 (페이지당 출력 개수) -->
			<input type="hidden" name="numOfRows" id="numOfRows" value="5" />
			<!-- 요청 변수 설정 (승인키) -->
			<input type="hidden" name="confmKey"
				value="4810167219" />
			<input type="hidden" name="type" value="json" />
		</div>
	</form>
	<div class="center">
		<div id="divCount"></div>
		<div id="divZip"></div>
		<div id="divPage"></div>
	</div>
</body>
</html>