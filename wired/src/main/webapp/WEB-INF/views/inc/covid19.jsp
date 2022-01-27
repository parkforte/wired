<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
.contentTr{
	font-size: 0.95em;
}
</style>
<script type="text/JavaScript" src="<c:url value='/resources/js/jquery-3.6.0.min.js'/>" ></script>

<script language="javascript">
$(function(){
	//오늘
	var today = new Date();
	var year = today.getFullYear();
	var month = ('0' + (today.getMonth() + 1)).slice(-2);
	var day = ('0' + today.getDate()).slice(-2);

	//어제
	var yesterday = new Date();
	yesterday.setDate(yesterday.getDate()-1);
	var yy = yesterday.getFullYear();
	var mm = ('0' + (yesterday.getMonth() + 1)).slice(-2);
	var dd = ('0' + yesterday.getDate()).slice(-2);

	$('.startCd').val(year+month+day);
	$('.endCd').val(year+month+day);
	$.ajax({
		data: $("#form").serialize(),
		type: "post",
		url: "<c:url value='/sample/covid19'/>",
		dataType:"xml",
		success: function(xmlStr){
			$("#list").html("");
			var errCode = $(xmlStr).find("errorCode").text();
			var errDesc = $(xmlStr).find("errorMessage").text();
			if(errCode == "0"){
				alert(errCode+"="+errDesc);
			}else{
				if(xmlStr != null){
					makeList(xmlStr);
				}
			}
		},
		error: function(xhr, status, error){
			alert("에러발생");
		}
	});
	$('.tDate').after($('.startCd').val());
});

function makeList(xmlStr){
	var htmlStr = "";
	htmlStr += "<table class='table table-bordered' id='dataTable' width='100%' cellspacing='0'>";
		htmlStr += "<tr>";
		htmlStr += "<th>시도명</th>";
		htmlStr += "<th>사망자 수</th>";
		htmlStr += "<th>확진자 수</th>";
		htmlStr += "<th>전일대비 증감 수</th>";
		htmlStr += "<th>격리 해제 수</th>";
		htmlStr += "<th>지역발생 수</th>";
		htmlStr += "<th>해외유입 수</th>";
// 		htmlStr += "<th>기준일시</th>";
		htmlStr += "</tr>";
		if($(xmlStr).find("item").find('gubun').text().length<1){
			$('.startCd').val(yy+mm+dd);
			$('.endCd').val(yy+mm+dd);
		}
	$(xmlStr).find("item").each(function(){
		htmlStr += "<tr class='contentTr'>";
		htmlStr += "<td>"+$(this).find('gubun').text()+"</td>";		//시도명
		htmlStr += "<td>"+$(this).find('deathCnt').text()+"</td>";	//사망자 수
		htmlStr += "<td>"+$(this).find('defCnt').text()+"</td>";	//확진자 수
		htmlStr += "<td>"+$(this).find('incDec').text()+"</td>";	//전일대비 증감 수
		htmlStr += "<td>"+$(this).find('isolClearCnt').text()+"</td>";	//격리 해제 수
		htmlStr += "<td>"+$(this).find('localOccCnt').text()+"</td>";	//지역발생 수
		htmlStr += "<td>"+$(this).find('overFlowCnt').text()+"</td>";	//해외유입 수
// 		htmlStr += "<td>"+$(this).find('stdDay').text()+"</td>";	//기준일시
		htmlStr += "</tr>";
	});
	htmlStr += "</table>";
	$("#list").html(htmlStr);
}

//특수문자, 특정문자열(sql예약어의 앞뒤공백포함) 제거
function checkSearchedWord(obj){
	if(obj.value.length >0){
		//특수문자 제거
		var expText = /[%=><]/ ;
		if(expText.test(obj.value) == true){
			alert("특수문자를 입력 할수 없습니다.") ;
			obj.value = obj.value.split(expText).join("");
			return false;
		}

		//특정문자열(sql예약어의 앞뒤공백포함) 제거
		var sqlArray = new Array(
			//sql 예약어
			"OR", "SELECT", "INSERT", "DELETE", "UPDATE", "CREATE", "DROP", "EXEC",
             		 "UNION",  "FETCH", "DECLARE", "TRUNCATE"
		);

		var regex;
		for(var i=0; i<sqlArray.length; i++){
			regex = new RegExp( sqlArray[i] ,"gi") ;

			if (regex.test(obj.value) ) {
			    alert("\"" + sqlArray[i]+"\"와(과) 같은 특정문자로 검색할 수 없습니다.");
				obj.value =obj.value.replace(regex, "");
				return false;
			}
		}
	}
	return true ;
}


</script>
<body>
<span class="font-weight-bold text-primary tDate">Date: </span>
	<form name="form" id="form" method="post">
		<input type="hidden" name="serviceKey" id="serviceKey"
		value="OfEsOtklGh4oLrpA3fUlfsQgL59MCNhIwILKKSsJT5zJeCFmSaEiYZrO85uoZYaJO4HvxSEQ9Jagb5OraOJgCQ%3D%3D"/>
		<input type="hidden" name="pageNo" value="1"/>
		<input type="hidden" name="numOfRows" value="10"/>
		<input type="hidden" name="startCreateDt" class="startCd" value="20210101"/>
		<input type="hidden" name="endCreateDt" class="endCd" value="20210101"/>
		<div id="list"></div><!-- 검색 결과 리스트 출력 영역 -->
	</form>
</body>
</html>