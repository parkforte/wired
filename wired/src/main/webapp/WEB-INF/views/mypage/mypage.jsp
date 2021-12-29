<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<!-- http://localhost:9091/wired/mypage/mypage -->


<style type="text/css">
.form-row{
	margin:100px;
}
.signFile{
	width: 500px;
}
#nav-contact{
	width: 700px;
	margin:0 auto; 
}
.card-body img{
	margin-left: 30%;
	border: auto;
	width: 400px;
	height: 50%

}
.card-body btn{
	text-align: center;
}

<!-- javaScript영역 -->
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
    <script type="text/javascript">
    $(function() {
        $("#filename").on('change', function(){
            readURL(this);
        });
    });
    
        function readURL(input) {
            if (input.files && input.files[0]) {
               var reader = new FileReader();
               reader.onload = function (e) {
                  $('#preImage').attr('src', e.target.result);
                  $('#preImage').show();
               }
               reader.readAsDataURL(input.files[0]);
            } else {
          	  $('#preImage').css('display','none')
            }
        }
    </script>
	
	<!-- Page Heading -->
   <h1 class="h3 mb-2 text-gray-800">마이페이지</h1>

	
	<nav>
	  <div class="nav nav-tabs" id="nav-tab" role="tablist">
		   <a class="nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">회원정보수정</a>
		   <a class="nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">게시판 알림</a>
		   <a class="nav-link" id="nav-contact-tab" data-toggle="tab" href="#nav-contact" role="tab" aria-controls="nav-contact" aria-selected="false">서명관리 (결재)</a>
	  </div>
	</nav>
	<div class="tab-content" id="nav-tabContent">
		<!-- 회원정보수정 -->
	<div class="tab-pane fade  show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
		<form style="width: 1000px;">
			<div class="form-row">
				<label for="inputName" class="col-sm-2 col-form-label">성명</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="inputName">
				</div>
				<label for="inputEmail1" class="col-sm-2 col-form-label">Email</label>
				<div class="col-sm-10">
					<input type="email" class="form-control" id="inputEmail1" title="이메일주소 앞자리">@
					<select name="email2" id="email2" title="이메일주소 뒷자리">
						<option value="naver.com">naver.com</option>
						<option value="hanmail.net">hanmail.net</option>
						<option value="nate.com">nate.com</option>
						<option value="gmail.com">gmail.com</option>
						<option value="etc">직접입력</option>
					</select> <input type="text" name="email3" id="email3"
						title="직접입력인 경우 이메일주소 뒷자리" style="visibility: hidden">
				</div>
				<label for="inputPassword" class="col-sm-2 col-form-label">password</label>
				<div class="col-sm-10">
					<input type="password" class="form-control" id="inputEmail3">
				</div>
				<label for="inputZipcode" class="col-sm-2 col-form-label">우편번호</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="inputZipcode">
				</div>
				<label for="inputAddress" class="col-sm-2 col-form-label">주소</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="inputAddress">
				</div>
				<label for="inputAddress" class="col-sm-2 col-form-label">상세주소</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="inputAddress">
				</div>
				<label for="inputJoinDate" class="col-sm-2 col-form-label">입사일</label>
				<div class="col-sm-10">
				<input type="text" class="form-control" id="inputJoinDate">
				</div>
				<label for="inputResigndate" class="col-sm-2 col-form-label">퇴사일</label>
				<div class="col-sm-10">
				<input type="text" class="form-control" id="inputResigndate">
				</div >
				<label for="positionNo" class="col-sm-2 col-form-label">직급번호</label>
				<div class="col-sm-10">
				<input type="text" class="form-control" id="positionNo">
				</div>
				<label for="pay" class="col-sm-2 col-form-label">연봉</label>
				<div class="col-sm-10">
				<input type="text" class="form-control" id="pay">
				</div>
				<label for="holiday" class="col-sm-2 col-form-label">연차</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="holiday">
				</div>
				<label for="useholiday" class="col-sm-2 col-form-label">사용연차</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="useholiday">
				</div>
				<label for="mem_hp1" class="col-sm-2 col-form-label">연락처1</label>
				<div class="col-sm-10">
					<select name="hp1" id="hp1" title="휴대폰 앞자리" class="form-control" style="width:80px">
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="016">016</option>
						<option value="017">017</option>
						<option value="018">018</option>
						<option value="019">019</option>
					</select> - <input type="text" name="hp2" id="hp2" maxlength="4"
						title="휴대폰 가운데자리"  class="form-control" style="width:80px">- <input type="text"
						name="hp3" id="hp3" maxlength="4" title="휴대폰 뒷자리" class="form-control" style="width:80px">
				</div>
				<label for="mem_hp2" class="col-sm-2 col-form-label">연락처2</label>
				<div class="col-sm-10">
					<select name="hp1" id="hp1" title="휴대폰 앞자리">
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="016">016</option>
						<option value="017">017</option>
						<option value="018">018</option>
						<option value="019">019</option>
					</select> - <input type="text" name="hp2" id="hp2" maxlength="4"
						title="휴대폰 가운데자리" class="width_80">- <input type="text"
						name="hp3" id="hp3" maxlength="4" title="휴대폰 뒷자리" class="width_80">
				</div>
				<label for="mem_hp3" class="col-sm-2 col-form-label">연락처3</label>
				<div class="col-sm-10">
					<select name="hp1" id="hp1" title="휴대폰 앞자리">
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="016">016</option>
						<option value="017">017</option>
						<option value="018">018</option>
						<option value="019">019</option>
					</select> - <input type="text" name="hp2" id="hp2" maxlength="4"
						title="휴대폰 가운데자리" style="width:80px">- <input type="text"
						name="hp3" id="hp3" maxlength="4" title="휴대폰 뒷자리" class="width_80">
				</div>
			</div>
		</form>
	</div>
	</div>
	<!--게시판 알림-->
	<div class="tab-pane fade " id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
	
	</div>
<div class="tab-pane fade " id="nav-contact" role="tabpanel"
	aria-labelledby="nav-contact-tab">
	<!--서명관리 (결재) -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">결재 서명 파일 업로드</h6>
		</div>
		<div class="card-body">

			<h3>전자 서명</h3>
			<div class="signFile d-flex justify-content-md-center">
				<img class="card-img" id="preImage"/>
			</div>

			<hr>
			<form method="post" enctype="multipart/form-data" name="noticeForm">
				<input type='file' id="filename" name="filename" />

			</form>
			<hr>
			<br>
			<div style="text-align:center;">
			<button type="button" data-toggle="modal" data-target="#exampleModal"
				class="btn btn-primary b-radius">등록하기</button>
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





<%@ include file="../inc/bottom.jsp" %>
			