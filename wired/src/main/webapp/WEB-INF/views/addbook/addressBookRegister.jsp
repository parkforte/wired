<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- http://localhost:9091/wired/addbook/addressbookRegister -->

<!-- css영역 -->
<style type="text/css">
@import
	url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap')
	;

.outer {
	text-align: center;
}

.r-table {
	width: 36%;
	margin-left: 31.5%;
}

#content {
	background-color: #F2F2FC;
}

.form-control {
	width: 98%;
}

.c-size {
	margin-left: 5px;
}

.s-half-style {
	width: 30.8%;
}

.half-style {
	width: 47.5%;
}

span {
	padding-top: 11px;
	padding-left: 5px;
}

.rank-margin {
	margin-top: 16px;
}

.form-group.row.rank-margin {
	margin-top: 16px;
}
</style>

<!-- javaScript영역 -->
<script type="text/javascript">
	$(function() {
		 $('#first_button').click(function() {
			if($('#addrName').val().length<1){
				alert('이름을 입력하세요');
				$('#addrName').focus();
				event.preventDefault();
			}else if($('#addrTel').val().length<1){
				alert('연락처를 입력하세요');
				$('#addrTel').focus();
				event.preventDefault();
			}
		 });
	});


</script>

<!-- emplRegister -->
<div class="container-fluid font">
	<!-- Page Heading -->
	<!-- title1 -->
	<div class="card shadow mb-4 r-table">
		<div class="card-body">
			<form name="frm1" class="user" method="post"
				action="<c:url value='/addbook/addressBookRegister'/>">
				<div class="table-responsive">
					<div class="outer">
						<h1 class="h3 mb-2 text-gray-800 h1-style">연락처 등록</h1>
						<p class="mb-4">AddressBook registration</p>
					</div>
					<!-- 이름 -->
					<div class="form-group">
						<input type="text" class="form-control form-control-user c-size"
							name="addbookName" id="addbookName" placeholder="이름">
					</div>
					<!-- 연락처 -->
					<div class="form-group">
						<input type="text" class="form-control form-control-user c-size"
							name="addbookTel" id="addbookTel" placeholder="연락처">
					</div>
					<!-- 이메일 -->
					<div class="form-group">
						<input type="text" class="form-control form-control-user c-size"
							name="addbookEmail" id="addbookEmail" placeholder="이메일">
					</div>
					<!-- 회사명 -->
					<div class="form-group">
						<input type="text" class="form-control form-control-user c-size"
							name="addbookComname" id="addbookComname" placeholder="회사명">
					</div>
					<!-- 부서명 -->
					<div class="form-group">
						<input type="text" class="form-control form-control-user c-size"
							name="addbookDept" id="addbookDept" placeholder="부서명">
					</div>
					<!-- 직급 -->
					<div class="form-group">
						<input type="text" class="form-control form-control-user c-size"
							name="addbookRank" id="addbookRank" placeholder="직급">
					</div>
					<!-- memNO갖고올거임 -->
						<input type="hidden" name="memNo" value="${sessionScope.memNo }">
					<div class="form-group c-size" style="text-align: center;">
						<br>
						<button type="submit" class="btn btn-primary b-radius"
							id="first_button">등록</button>
						<button type="button" class="btn btn-danger b-radius"
							onclick="location.href='<c:url value='addressBookList'/>'">취소</button>
					</div>
				</div>
			</form>
		</div>
	</div>

</div>
<!-- Modal -->

<!-- /.container-fluid -->

<%@ include file="../inc/bottom.jsp"%>
