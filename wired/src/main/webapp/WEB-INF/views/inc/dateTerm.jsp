<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/jquery-ui.min.css"/>

<script type="text/javascript"
	src="<c:url value='/resources/js/jquery-ui.min.js'/>"></script>

	<script type="text/javascript">
	$(function() {
		$('#startDay').datepicker({
			dateFormat:'yy-mm-dd',
			changeYear:true,
			dayNamesMin:['일','월','화','수','목','금','토'],
			monthNames:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월',]
		});
		$('#endDay').datepicker({
			dateFormat:'yy-mm-dd',
			changeYear:true,
			dayNamesMin:['일','월','화','수','목','금','토'],
			monthNames:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월',]
		});

	});

	$.setDate = function(term, type){
		//endDay 기준으로 7일을 빼거나 1개월이나 3개월을 빼서 startDay에 셋팅
		//var d = new Date(년, 월, 일);
		var arr=$('#endDay').val().split('-');	//2022-01-05
		var d = new Date(arr[0], arr[1]-1, arr[2]);	//월 0~11

		$('#startDay').val(findDate(d));
	}

	function findDate(date){
		return date.getFullYear() + "-" + formatDate(date.getMonth() +1) + "-"
			+ formatDate(date.getDate());
	}

	function formatDate(d){
		if(d<10){
			d="0"+d;
		}
		return d;
	}
	</script>

	<input type="text" name="useRegdate" id="startDay" class="form-control">
	~
	<input type="text" name="returnRegdate" id="endDay" class="form-control">