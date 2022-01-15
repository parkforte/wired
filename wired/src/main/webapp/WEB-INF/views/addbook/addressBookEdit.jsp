<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<!-- http://localhost:9091/wired/addbook/addressBookEdit -->

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
	margin-bottom: 10px;
}

.rank-margin {
	margin-top: 16px;
}

.form-group.row.rank-margin {
	margin-top: 16px;
}

label {
	display: inline-block;
	margin-bottom: 0.5rem;
	margin-left: 10px;
}

label#memHoliday {
	margin-left: 45%;
}

label#posNo {
	margin-left: 45%;
}

.payhol_m {
	margin-bottom: 2.5%;
}

.rank_m {
	margin-top: -3%;
}

.form-group.row.b-margin {
	margin-bottom: 3%;
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
<!-- addressbookRegister -->
<form name="frm" class="user" method="post"
	action="<c:url value='/addbook/addressBookEdit'/>">
	<div class="container-fluid font">
		<!-- Page Heading -->
		<!-- title1 -->
		<div class="card shadow mb-4 r-table">
			<div class="card-body">
				<div class="table-responsive">
					<div class="outer">
						<h1 class="h3 mb-2 text-gray-800 h1-style">연락처 수정</h1>
						<p class="mb-4">AddressBook Modify</p>
					</div>
					<!-- 이름 -->
					<div class="form-group">
						<input type="text" class="form-control form-control-user c-size"
							name="addrbookName" id="addrbookName" value="${addressBookVo.addrbookName }">
					</div>
					<!-- 연락처 -->
					<div class="form-group">
						<input type="text" class="form-control form-control-user c-size"
							name="addrbookTel" id="addrbookTel" value="${addressBookVo.addrbookTel }">
					</div>
					<!-- 이메일 -->
					<div class="form-group">
						<input type="text" class="form-control form-control-user c-size"
							name="addrbookEmail" id="addrbookEmail" value="${addressBookVo.addrbookEmail }">
					</div>
					<!-- 회사명 -->
					<div class="form-group">
						<input type="text" class="form-control form-control-user c-size"
							name="addrbookComname" id="addrbookComname" value="${addressBookVo.addrbookComname }">
					</div>
					<!-- 부서명 -->
					<div class="form-group">
						<input type="text" class="form-control form-control-user c-size"
							name="addrbookDept" id="addrbookDept" value="${addressBookVo.addrbookDept }">
					</div>
					<!-- 직급 -->
					<div class="form-group">
						<input type="text" class="form-control form-control-user c-size"
							name="addrbookRank" id="addrbookRank" value="${addressBookVo.addrbookRank }">
					</div>
					<input type="hidden" name="addrbookNo" value="${param.addrbookNo }">
					<input type="hidden" name="memNo" value="${addressBookVo.memNo }">
					<div class="form-group c-size" style="text-align: center;">
						<br>
						<button type="button" class="btn btn-success "
							data-toggle="modal" data-target="#exampleModal">수정</button>
						<button type="button" class="btn btn-danger "
							onclick="location.href='<c:url value='/addbook/addressBookList'/>'">취소</button>
					</div>
				</div>

			</div>
		</div>

	</div>
	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">연락처 수정</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">수정하시겠습니까?</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary "
						data-dismiss="modal">취소</button>
					<button type="submit" id="addEdit_submit"
						class="btn btn-primary ">확인</button>
				</div>
			</div>
		</div>
	</div>
</form>
<!-- /.container-fluid -->

<%@ include file="../inc/bottom.jsp"%>
