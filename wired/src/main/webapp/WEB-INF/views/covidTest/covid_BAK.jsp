<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="<c:url value='/resources/js/paging.js'/>"></script>
<script type="text/JavaScript" src="<c:url value='/resources/js/jquery-3.6.0.min.js'/>" ></script>
<script type="text/javascript">

// function getCovidLoc(){

// }

	var totalCount=0;

// 	$(function () {
// 		$('#form').submit(function(){
// 			$.send(1);
// 		});
// 	}
	$.send = function(curPage){
		$('#currentPage').val(curPage);
		$.ajax({
			 url :"<c:url value='/covidTest/getCovidApi'/>"
			,type:"post"
			,data:$("#form").serialize()
			,dataType:"xml"
			,success:function(xmlStr){
				$("#list").html("");
				totalCount= $(xmlStr).find("totalCount").text();
				alert(totalCount);
				var resultCode = $(xmlStr).find("resultCode").text();
				var resultMsg = $(xmlStr).find("resultMsg").text();
				if(resultCode != "00"){
					alert(resultCode+"="+resultMsg);
				}else{
					if(xmlStr != null){
						makeList(xmlStr);
						pageMake();
					}
				}
			}
		    ,error: function(xhr,status, error){
		    	alert("에러발생");
		    }
		});
	}
	$(function () {
		$.ajax({
			 url :"<c:url value='/covidTest/getCovidApi'/>"
			,type:"post"
			,data:$("#form").serialize()
			,dataType:"xml"
			,success:function(xmlStr){
				$("#list").html("");
				totalCount= $(xmlStr).find("totalCount").text();
				alert(totalCount);
				var resultCode = $(xmlStr).find("resultCode").text();
				var resultMsg = $(xmlStr).find("resultMsg").text();
				if(resultCode != "00"){
					alert(resultCode+"="+resultMsg);
				}else{
					if(xmlStr != null){
						makeList(xmlStr);
						pageMake();
					}
				}
			}
		    ,error: function(xhr,status, error){
		    	alert("에러발생");
		    }
		});

	});


	function getCovidLoc() {
		//적용예 (api 호출 전에 검색어 체크)
		if (!checkSearchedWord(document.form.keyword)) {
			return ;
		}
	}

	function makeList(xmlStr){
		var htmlStr = "";
		htmlStr += "<table>";
		$(xmlStr).find("item").each(function () {
			htmlStr += "<tr>";
	// 		htmlStr += "<td>"+$(this).find('adtFrDd').text()+"</td>";
	// 		htmlStr += "<td>"+$(this).find('hospTyTpCd').text()+"</td>";
			htmlStr += "<td>"+$(this).find('sgguNm').text()+"</td>";
			htmlStr += "<td>"+$(this).find('sidoNm').text()+"</td>";
	// 		htmlStr += "<td>"+$(this).find('spclAdmTyCd').text()+"</td>";
			htmlStr += "<td>"+$(this).find('telno').text()+"</td>";
			htmlStr += "<td>"+$(this).find('yadmNm').text()+"</td>";
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

	function enterSearch() {
		var evt_code = (window.netscape) ? ev.which : event.keyCode;
		if (evt_code == 13) {
			event.keyCode = 0;
			getCovidLoc();
		}
	}
	//페이징 처리
	function pageMake(){
		var blockSize=10;
		pagination($('#currentPage').val(),$('#countPerPage').val(),
				blockSize, totalCount);

		//이전블럭
		var str="";
		if(firstPage>1){

			str+="<a href='#' onclick='$.send("+(firstPage-1)+")'>";
		    str+="<img src='<c:url value='/resources/img/first.JPG' />'>	</a>";
		}

		<!-- [1][2][3][4][5][6][7][8][9][10] -->
		for(var i= firstPage;i<=lastPage;i++){
			if (i==currentPage){
				str+="<span style='color:lightpink;font-weight:bold'>"+i+"</span>";
			}else{
				str+="<a href='#' onclick='$.send("+i+")'>["+
					i + "]</a>";
			}
		}//for

		if(lastPage<totalPage){
			str+="<a href='#' onclick='$.send("+(lastPage+1)+")'>";
			str+="<img src='<c:url value='/resources/img/last.JPG' />'></a>";
		}

		$("#divPage").html(str);
		<!--  페이지 번호 끝 -->
	}
// //페이징 처리
// function pageMake(){
// 	var blockSize=10;
// 	pagination($('#currentPage').val(),$('#countPerPage').val(),
// 			blockSize, totalCount);

// 	//이전블럭
// 	var str="";
// 	str+="<li class='page-item ";
// 	if(firstPage>1){
// 		str+="disabled";
// 	}
// 		str+="'><a class='page-link' href='#' onclick='$.send("+(firstPage-1)+")'>Previous</a></li>";

// 	<!-- [1][2][3][4][5][6][7][8][9][10] -->
// 	for(var i= firstPage;i<=lastPage;i++){
// 		str+="<li";
// 		if (i==currentPage){
// 			str+=" class='page-item active' aria-current='page'";
// 		}else{
// 			str+=" class='page-item'";
// 		}
// 		str+="><a class='page-link' href='#' onclick='$.send("+i+")'>"+${i }+"</a></li>";
// 	}//for

// 	str+="<li class='page-item ";
// 	if(lastPage==totalPage){
// 		str+="disabled";
// 	}
// 		str+="'><a class='page-link' href='#' onclick='$.send("+(lastPage+1)+")'>Next</a></li>";

// 	$("#divPage").html(str);
// 	<!--  페이지 번호 끝 -->
// }
</script>
<title>covid</title>
</head>
<body>
<form name="form" id="form" method="post">
	<input type="hidden" name="currentPage" id="currentPage" value="1" /> <!-- 요청 변수 설정 (현재 페이지. currentPage : n > 0) -->
	<input type="hidden" name="countPerPage" id="countPerPage" value="6" /><!-- 요청 변수 설정 (페이지당 출력 개수. countPerPage 범위 : 0 < n <= 100) -->
	<input type="text" name="confmKey" id="confmKey" style="width:250px;display:none" value="9IUykXyrRwvsL7v0igtLr3Ao59h2dJHJkYUaBFbWTIqAardx4MkGTMUH4SL0iD%2BPR5UewoJvl%2B7PrzYojx4hZg%3D%3D"/><!-- 요청 변수 설정 (승인키) -->
	<input type="text" name="keyword" value="" onkeydown="enterSearch();"/>요청 변수 설정 (키워드)
	<input type="button" onClick="getCovidLoc();" value="주소검색하기"/>
</form>
	<div class="center">
		<div id="divCount"></div>
		<div id="list"></div>
		<div id="divPage"></div>
	</div>
</body>
</html>