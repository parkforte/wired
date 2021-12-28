<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<!-- http://localhost:9091/wired/mypage/mypage -->

<!-- javaScript영역 -->
<style type="text/css">
.form-row{
	margin:100px;
}

</style>
<script type="text/javascript">

</script>

	<nav>
	  <div class="nav nav-tabs" id="nav-tab" role="tablist">
		   <a class="nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">회원정보수정</a>
		   <a class="nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">게시판 알림</a>
		   <a class="nav-link" id="nav-contact-tab" data-toggle="tab" href="#nav-contact" role="tab" aria-controls="nav-contact" aria-selected="false">서명관리 (결재)</a>
	  </div>
	</nav>
	<div class="tab-content" id="nav-tabContent">
		<!-- 회원정보수정 -->
	<div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
		<form>
			<div class="form-row">
				<label for="inputName" class="col-sm-2 col-form-label">이름</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="inputName">
				</div>
				<label for="inputEmail1" class="col-sm-2 col-form-label">Email1</label>
				<div class="col-sm-10">
					<input type="email" class="form-control" id="inputEmail1">
				</div>
				<label for="inputEmail2" class="col-sm-2 col-form-label">Email2</label>
				<div class="col-sm-10">
					<input type="email" class="form-control" id="inputEmail2">
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
				<div>
				<input type="text" class="form-control" id="inputJoinDate">
				</div>
				<label for="inputResigndate" class="col-sm-2 col-form-label">퇴사일</label>
				<div>
				<input type="text" class="form-control" id="inputResigndate">
				</div>
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
					<input type="text" class="form-control" id="mem_hp1">
				</div>
				<label for="mem_hp2" class="col-sm-2 col-form-label">연락처2</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="mem_hp2">
				</div>
				<label for="mem_hp3" class="col-sm-2 col-form-label">연락처3</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="positionNo">
				</div>
			</div>
		</form>
	</div>
	</div>
	<div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
		<!-- title1 -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">title1</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                            
                            	<p>content</p>
                            
                            </div>
                        </div>
                    </div>
	</div>
	<div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">...</div>
	

           
<%@ include file="../inc/bottom.jsp" %>
			