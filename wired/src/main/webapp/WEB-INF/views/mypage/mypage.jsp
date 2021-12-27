<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<!-- http://localhost:9091/wired/mypage/mypage -->

<!-- javaScript영역 -->
<script type="text/javascript"
	src='<c:url value="/resources/api/smarteditor/js/service/HuskyEZCreator.js"/>'
	charset="utf-8"></script>
<script type="text/javascript"
	src='<c:url value="//code.jquery.com/jquery-1.11.0.min.js"/>'></script>

<script type="text/javascript">
$(document).ready(function(){
	
	$('ul.tabs li').click(function(){
		var tab_id = $(this).attr('data-tab');

		$('ul.tabs li').removeClass('current');
		$('.tab-content').removeClass('current');

		$(this).addClass('current');
		$("#"+tab_id).addClass('current');
	})

});

</script>
<style type="text/css">
ul.tabs {
	margin: 0px;
	padding: 0px;
	list-style: none;
}

ul.tabs li {
	display: inline-block;
	background: #898989;
	color: white;
	padding: 10px 15px;
	cursor: pointer;
	border-radius: 10px 10px 0 0;
}

ul.tabs li.current {
	background: #e0e0e0;
	color: #222;
}

.tab-content {
	display: none;
	background: #e0e0e0;
	padding: 12px;
}

.tab-content.current {
	display: inherit;
}

.userUpdate {
	
}
</style>
<!-- defaultPage -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">마이페이지</h1>


	<!-- 마이페이지 정보수정 -->
	<div class="mypage">
		<ul class="tabs">
			<li class="tab-link current" data-tab="tab-1">회원정보수정</li>
			<li class="tab-link" data-tab="tab-2">게시판 알림</li>
			<li class="tab-link" data-tab="tab-3">서명관리 (결재)</li>
		</ul>

		<div id="tab-1" class="tab-content current">
			<div class="userUpdate">
				<label for="pwd">비밀번호</label> <input type="text" id="pwd">
			</div>
			<div>
				<label for="pwd2">비밀번호 확인</label> <input type="Password" name="pwd2"
					id="pwd2">
			</div>
			<div class="form-group row">
				<label for="inputPassword" class="col-sm-2 col-form-label">Password</label>
				<div class="col-sm-10">
					<input type="password" class="form-control" id="inputPassword">
				</div>
				<div>
					<label for="name">이메일 1:</label> <input type="text" id="name">
				</div>
				<div>
					<label for="zipcode">주소</label> <input type="text" name="zipcode"
						id="zipcode" ReadOnly title="우편번호" class="width_80"> <input
						type="Button" value="우편번호 찾기" id="btnZipcode" title="새창열림"><br />
					<span class="sp1">&nbsp;</span> <input type="text" name="address"
						ReadOnly title="주소" class="width_350"><br /> <span
						class="sp1">&nbsp;</span> <input type="text" name="addressDetail"
						title="상세주소" class="width_350">
				</div>
			</div>
			<div id="tab-1" class="tab-content mypageUpdate">
				<div></div>
			</div>
			<div id="tab-1" class="tab-content mypageUpdate">
				<div></div>
			</div>

		</div>



	</div>

	<!-- /.container-fluid -->

	<!-- End of Main Content -->
	<%@ include file="../inc/bottom.jsp"%>