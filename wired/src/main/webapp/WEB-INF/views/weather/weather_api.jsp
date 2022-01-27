<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/weather-icons.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/weather-icons-wind.css">
<style>

.cicon {
    margin-left: 6px;
    margin-top: -3px;

}
.f-left.col-lg-8col-ms-6 {
    margin-left: 16px;
}

.ctemp.col-xl-3.col-lg-3.f-left {
	text-align: center;
}

.czone.col-xl-2.col-lg-2.f-left {
    margin-top: 6px;
    margin-left: 3px;
    text-align: center;
}

.wind.col-xl-3.col-lg-3.f-left {
	text-align: center;
}
.humidity.col-xl-3.col-lg-3.f-left {
	text-align: center;
}


</style>
<script type="text/javascript"
	src="<c:url value='/resources/js/jquery-ui.min.js'/>"></script>
<script type="text/javascript">

	/*
	$getJSON('파일경로', function(data){
		//date로 할일
	});
	*/


	$(function () {
		$.getJSON('https://api.openweathermap.org/data/2.5/weather?id=1835848&appid=32c269e94d28a8060f43243d6c6dad5e&units=metric', function(data){
			//data로 할일...
			var $zone = data.name
			var $minTemp = data.main.temp_min;
			var $maxTemp = data.main.temp_max;
			var $cTemp = data.main.temp;
			var $now = new Date($.now());
			var $wIcon = data. weather[0].icon;
			var $wind = data.wind.speed;
			var $country = data.sys.country;
			var $clouds = data.clouds.all;
			var $humidity = data.main.humidity;
			$('.czone').append($zone);
			$('.ctemp').append($cTemp+'°C');
			$('.clowtemp').append($minTemp);
			$('.chightemp').append($maxTemp);
			$('.wind').append($wind+'m/s');
			$('.humidity').append($humidity+'%');
			$('.cloud').append($clouds+'%');
			$('.cicon').append('<img src="http://openweathermap.org/img/w/'+$wIcon+'.png">')
		});

	});
</script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>




</head>
<body>
<c:set var="now" value="<%=new java.util.Date()%>"></c:set>
<div class="f-left col-lg-8col-ms-6">
	<h2> <fmt:formatDate value="${now }" pattern="yyyy-MM-dd HH:mm"/></h2>
</div>
<div class="cicon col-xl-2 col-lg-2 f-left"></div>
<div class="czone col-xl-2 col-lg-2 f-left"></div>
<div class="ctemp col-xl-3 col-lg-3 f-left"><i class="wi wi-thermometer"></i>&nbsp;</div>
<!-- <div class="clowtemp">최저 온도 : </div> -->
<!-- <div class="chightemp">최고온도 : </div> -->
<div class="wind col-xl-3 col-lg-3 f-left"><i class="wi wi-strong-wind"></i>&nbsp;</div>
<div class="humidity col-xl-3 col-lg-3 f-left"><i class="wi wi-humidity"></i>&nbsp;</div>
<div class="cloud col-xl-3 col-lg-3 f-left"><i class="wi wi-cloud"></i>&nbsp;</div>
<!-- HTML -->

</body>
</html>