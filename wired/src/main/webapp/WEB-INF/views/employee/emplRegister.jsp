<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>

<!-- Custom styles for this template-->
<link href="css/sb-admin-2.min.css" rel="stylesheet">

<!-- http://localhost:9091/wired/employee/emplRegister -->

<!-- css영역 -->
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');

.table-center{
	margin-left: 80px;
    margin-right: 80px;
}
.t-padding{
	padding-top: 15px;
}
.b-padding{
	padding-bottom: 15px;
}
.l-padding{
	padding-left: 20px;
}
.br-height{
	line-height: 92%;
}
	
</style>
<!-- javaScript영역 -->
<script type="text/javascript">


</script>

<div class="t-center">
    <h3>사원등록</h3>
</div>

<form>
    <div class="container">
    	<div class="card o-hidden border-0 shadow-lg table-center br-height">
			<div class="row t-padding">
			    <div class="col-md-3 l-padding">
			      <label for="validationServer01">이름</label>
			      <input type="text" class="form-control is-valid" id="validationServer01" placeholder="name" required>
			      <div class="valid-feedback">
			        Looks good!
			      </div>
			    </div>
			    <br>
			</div>
		    <br>
			<div class="row">
			    <div class="col-md-3 l-padding">
			      <label for="validationServer01">비밀번호</label>
			      <input type="text" class="form-control is-valid" id="validationServer01" placeholder="password" required>
			      <div class="valid-feedback">
			        Looks good!
			      </div>
			    </div>
			    <div class="col-md-3 l-padding">
			      <label for="validationServer03">비밀번호확인</label>
			      <input type="text" class="form-control is-invalid" id="validationServer03" aria-describedby="validationServer03Feedback" placeholder="password" required>
			      <div id="validationServer03Feedback" class="invalid-feedback">
			        Please.
			      </div>
			    </div>
		    </div>
		    <br>
		    <div class="row">
			    <div class="col-md-3 l-padding">
			      <label for="validationServer01">생년월일</label>
			      <input type="text" class="form-control is-valid" id="validationServer01" placeholder="생년월일 6자리" required>
			      <div class="valid-feedback">
			        Looks good!
			      </div>
			    </div>
			</div>
			<br>
			<div class="row">
			    <div class="col-md-3 l-padding">
			    	<label>직급</label>
					<select class="custom-select mr-sm-2" id="inlineFormCustomSelect">
			        <option selected>선택하세요</option>
			        <option value="1">부장</option>
			        <option value="2">팀장</option>
			        <option value="3">대리</option>
			        <option value="3">주임</option>
			        <option value="3">사원</option>
			      	</select>
			    </div>
			</div>
	      	<br>
	      	
			<div class="col-md-3 b-padding l-padding">
			<!-- Button trigger modal -->
				<button class="btn btn-primary" type="button" data-toggle="modal" data-target="#exampleModal">등록</button>
				<button type="button" class="btn btn-danger">취소</button>
				<button type="button" class="btn btn-info">목록</button>
			</div>


			<!-- Modal -->
			<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog modal-dialog-centered">
			    <div class="modal-content">
			      <div class="modal-header">
			      	<h5 class="modal-title" id="exampleModalLabel">사원등록</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body">
			        등록하시겠습니까?
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
			        <button type="submit" class="btn btn-primary">등록</button>
			      </div>
			    </div>
			  </div>
			</div>
		</div>
	</div>
</form>
<%@ include file="../inc/bottom.jsp" %>
