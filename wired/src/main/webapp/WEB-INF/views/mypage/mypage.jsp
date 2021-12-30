<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>

<!-- http://localhost:9091/wired/mypage/mypage -->

<!-- css -->
<style type="text/css">
.form-row {
	margin: 100px;
}

.signFile {
	width: 500px;
}

#nav-contact {
	width: 700px;
	margin: 0 auto;
}

.card-body img {
	margin-left: 30%;
	border: auto;
	width: 400px;
	height: 50%
}

.card-body btn {
	text-align: center;
}

<!--회원정보수정-->

@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');
.outer{
	text-align: center;
}
.r-table {
    width: 45%;
    margin-left: 25%;
}

.form-control {
	width: 98%;
}
.c-size {
    margin-left: 5px;
}
.s-half-style{
	width: 30.8%;
}
.half-style{
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


<!--javaScript영역-->

<script type="text/javascript"
	src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
<script type="text/javascript">

	//전자서명(결재) - jquery
	$(function() {
		$("#filename").on('change', function() {
			readURL(this);
		});
	});
	//전자서명(결재) - jquery
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#preImage').attr('src', e.target.result);
				$('#preImage').show();
			}
			reader.readAsDataURL(input.files[0]);
		} else {
			$('#preImage').css('display', 'none')
		}
	}
</script>

<!-- tab 상단 -->
<nav>
	<div class="nav nav-tabs" id="nav-tab" role="tablist">
		<a class="nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">사원정보수정</a>
		<a class="nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">게시판 알림</a>
		<a class="nav-link" id="nav-contact-tab" data-toggle="tab" href="#nav-contact" role="tab" aria-controls="nav-contact" aria-selected="false">서명관리(결재)</a>
	</div>
</nav>

<!-- tab 내용  -->
<div class="tab-content" id="nav-tabContent">

	<!-- 회원정보수정 -->
	<div class="tab-pane fade show active" id="nav-home" role="tabpanel"aria-labelledby="nav-home-tab">

		<div class="container-fluid font">
			<div class="card shadow mb-4 r-table">
				<div class="card-body">
					<form class="user">
						<div class="table-responsive">
							<div class="outer" style="text-align: center;">
								<h1 class="h3 mb-2 text-gray-800 h1-style">사원정보수정</h1>
								<p class="mb-4">Edit employee information</p>
							</div>
							<br>
							<br>
							<!-- 이름 -->
							<div class="form-group">
								<label for="name">이름 </label>
								<input type="text" ReadOnly style="width: 200px;" class="form-control form-control-user c-size" id="name">
							</div>
							<!-- 비밀번호 -->
							<div class="form-group">
								<label for="password1">비밀번호 </label>
								<input type="text" class="form-control form-control-user c-size"
									id="password1" style="width: 200px;">
							</div>
							<!-- 비밀번호확인 -->
							<div class="form-group">
								<label for="password2">비밀번호 확인</label>
								<input type="text" class="form-control form-control-user c-size"
									id="password2" style="width: 200px;">
							</div>
							<!-- 연락처 -->
							<div class="form-group">
								<label for="phoneNumber">연락처</label><br>
								<input type="text"
									class="form-control form-control-user c-size s-half-style"
									id="hp1" style="width: 100px; display: inline-block"> 
								<span>-</span> 
								<input type="text"
									class="form-control form-control-user c-size s-half-style"
									id="hp2" style="width: 100px;  display: inline-block"> 
								<span>-</span> 
								<input type="text"
									class="form-control form-control-user c-size s-half-style"
									id="hp3" style="width: 100px;  display: inline-block">
							</div>
							<!-- 주소 -->
							<div class="form-group">
								<label for="zipcode">주소</label><br>
								<input type="text" name="zipcode" id="zipcode" title="우편번호"
										style="width: 200px; display: inline-block" class="form-control form-control-user c-size" placeholder="우편번호"> 
								<input style="display: inline-block" type="Button" value="우편번호 찾기" id="btnZipcode" title="새창열림" class="btn btn-primary b-radius">
								<br /><span class="sp1">&nbsp;</span>
								<input type="text" name="address" title="주소" class="form-control form-control-user c-size" placeholder="주소">
								<span class="sp1">&nbsp;</span>
								<input type="text" name="addressDetail" title="상세주소"
									class="form-control form-control-user c-size" placeholder="상세주소">
							</div>
							<hr>
							<!-- 연봉 -->
							<div class="form-group">
								<label for="salary">연봉</label>
								<input type="text" style="width: 200px; text-align:center; " 
									 class="form-control form-control-user c-size half-style"
									id="salary" ReadOnly> 
							</div>
							<!-- 연차 -->
							<div class="form-group">
								<label for="salary">연차</label>
								<input type="text" style="width: 200px; "
									class="form-control form-control-user c-size half-style"
									id="annual" ReadOnly>
							</div>
							<!--사용연차 -->
							<div class="form-group">
								<label for="salary">사용연차</label>
								<input type="text" style="width: 200px; "
									class="form-control form-control-user c-size half-style"
									id="useAnnual" ReadOnly>
							</div>
							<!-- 부서 -->
							<div class="form-group">
								<label for="salary">부서</label>
								<input type="text" style="width: 200px; "
									class="form-control form-control-user c-size half-style"
									id="jumin1" ReadOnly> 
							</div>
							<!-- 직급 -->
							<div class="form-group">
								<label for="salary">직급</label>
								<input type="text" style="width: 200px; "
									class="form-control form-control-user c-size half-style"
									id="jumin2" ReadOnly>
							</div>
							<!-- button -->
							<div class="form-group c-size" style="text-align: center;">
								<br>
								<button type="button" data-toggle="modal"
									data-target="#exampleModal" class="btn btn-primary b-radius">등록</button>
								<button type="button" class="btn btn-danger b-radius">취소</button>
							</div>
						</div>
					</form>
				</div>
			</div>

		</div>
	</div>



	<!-- 게시판 알림 -->
	<div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab"></div>
	
	
	
	<!-- 전자서명 (결재) -->
	<div class="tab-pane fade" id="nav-contact" role="tabpanel"
		aria-labelledby="nav-contact-tab">

		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">결재 서명 파일 업로드</h6>
			</div>
			<div class="card-body">
				<h3>전자 서명</h3>
				<div class="signFile d-flex justify-content-md-center">
					<img class="card-img" id="preImage" />
				</div>

				<hr>
				<form method="post" enctype="multipart/form-data" name="noticeForm">
					<input type='file' id="filename" name="filename" />

				</form>
				<hr>
				<br>
				<div style="text-align: center;">
					<button type="button" data-toggle="modal"
						data-target="#exampleModal" class="btn btn-primary b-radius">등록하기</button>
				</div>


				<!-- Modal -->
				<div class="modal fade" id="exampleModal" tabindex="-1"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">결재서명등록</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">등록하시겠습니까?</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary b-radius"
									data-dismiss="modal">취소</button>
								<button type="submit" class="btn btn-primary b-radius">확인</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<%@ include file="../inc/bottom.jsp" %>
			