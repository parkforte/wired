<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>

<!-- http://localhost:9091/wired/mypage/mypage -->

<!-- css -->
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');
#content{
	background-color: #F2F2FC;
}
.form-row {
	margin: 100px;
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

.card-body img {
	margin-left: 30%;
	border: auto;
	width: 400px;
	height: 50%
}

.card-body btn {
	text-align: center;
}


.outer{
	text-align: center;
}
.r-table {
    width: 36%;
    margin-left: 31.5%;
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
label {
    display: inline-block;
    margin-bottom: 0.5rem;
    margin-left: 10px;
}
span{
	margin-bottom: 10px;
}
</style>


<!--javaScript영역-->

<script type="text/javascript"
	src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
<script type="text/javascript">

	$(function(){
		$('#edit_submit').click(function() {
			if($('#memPwd').val().length<1){
				alert('비밀번호를 입력하세요');
				$('#memPwd').focus();
				event.preventDefault();
			}else if($('#memPwd').val()!=$('#memPwd2').val()){
				alert('비밀번호가 일치하지 않습니다!');
				$('#memPwd2').focus();
				event.preventDefault();
			}else if(!validate_phone($('#memHp2').val()) ||
					!validate_phone($('#memHp3').val()) ){
				alert('전화번호는 숫자만 가능합니다.');
				$('#memHp2').focus();
				event.preventDefault();
			}

		});
	});

	if(Character.compare(vo.getMemFlag(), 'N')==0){
		alert('상세정보를 입력하세요.');
	}
</script>

		<!-- myPage -->
		<div class="container-fluid font">
			<div class="card shadow mb-4 r-table">
				<div class="card-body">
					<form class="user" name="frm1" method="post" action="<c:url value='/mypage/mypage'/>">
						<div class="table-responsive">
							<div class="outer" style="text-align: center;">
								<h1 class="h3 mb-2 text-gray-800 h1-style">사원정보수정</h1>
								<p class="mb-4">Edit employee information</p>
							</div>
							<br>
							<br>
							<!-- 이름 -->
							<div class="form-group">
								<label for="name">이름</label>
								<input type="text"
									 class="form-control form-control-user c-size"
									id="memName" name="memName" ReadOnly value="${map['MEM_NAME'] }">
							</div>
							<!-- 아이디 -->
							<div class="form-group">
								<label for="id">아이디</label>
								<input type="text"
									 class="form-control form-control-user c-size"
									id="memId" name="memId" ReadOnly value="${map['MEM_ID'] }">
							</div>
							<!-- 비밀번호 -->
							<div class="form-group">
								<label for="password1">비밀번호</label>
								<input type="Password" class="form-control form-control-user c-size"
									name="memPwd" id="memPwd">
							</div>
							<!-- 비밀번호확인 -->
							<div class="form-group">
								<label for="password2">비밀번호 확인</label>
								<input type="Password" class="form-control form-control-user c-size"
									name="memPwd2" id="memPwd2">
							</div>
							<!-- 연락처 -->
							<label for="hp">연락처</label>
                           	<div class="form-group row">
                               <select name="memHp1" class="form-control  c-size s-half-style" id="memHp1" title="휴대폰 앞자리">
					            <option value="010"
					            	<c:if test="${map['MEM_HP1']=='010' }">
					            		selected="selected"
					            	</c:if>
					            >010</option>
					            <option value="011"
					            	<c:if test="${map['MEM_HP1']=='011' }">
					            		selected="selected"
					            	</c:if>
					            >011</option>
					            <option value="016"
					            	<c:if test="${map['MEM_HP1']=='016' }">
					            		selected="selected"
					            	</c:if>
					            >016</option>
					            <option value="017"
					            	<c:if test="${map['MEM_HP1']=='017' }">
					            		selected="selected"
					            	</c:if>
					            >017</option>
					            <option value="018"
					            	<c:if test="${map['MEM_HP1']=='018' }">
					            		selected="selected"
					            	</c:if>
					            >018</option>
					            <option value="019"
					            	<c:if test="${map['MEM_HP1']=='019' }">
					            		selected="selected"
					            	</c:if>
					            >019</option>
					       	</select>
					        <span>-</span>
					        <input type="text" name="memHp2" id="memHp2" maxlength="4" title="휴대폰 가운데자리"
					        	class="form-control  c-size s-half-style" value="${map['MEM_HP2'] }">
					        <span>-</span>
					        <input type="text" name="memHp3" id="memHp3" maxlength="4" title="휴대폰 뒷자리"
					        	class="form-control  c-size s-half-style" value="${map['MEM_HP3'] }">
                            </div>
							<!-- 주소 -->
							<div class="form-group">
								<label for="zipcode">주소</label><br>
								<input type="text" name="memZipcode" id="memZipcode" title="우편번호" ReadOnly
										style="width: 250px; display: inline-block"
										class="form-control form-control-user c-size" placeholder="우편번호" value="${map['MEM_ZIPCODE'] }">
								<input style="display: inline-block" type="Button" value="우편번호 찾기" id="btnZipcode" title="새창열림" class="btn btn-primary b-radius">
								<br /><span class="sp1">&nbsp;</span>
								<input type="text" name="memAddress" ReadOnly title="주소"
								class="form-control form-control-user c-size" placeholder="주소" value="${map['MEM_ADDRESS'] }">
								<span class="sp1">&nbsp;</span>
								<input type="text" name="memAddressdetail" title="상세주소"
									class="form-control form-control-user c-size" placeholder="상세주소" value="${map['MEM_ADDRESSDETAIL'] }">
							</div>
							<hr>
							<!-- 연봉 -->
							<div class="form-group">
								<label for="memPay">연봉</label>
								<input type="text"
									 class="form-control form-control-user c-size"
									id="memPay" name="memPay" ReadOnly value="${map['MEM_PAY'] }">
							</div>
							<!-- 연차 -->
							<div class="form-group">
								<label for="memHoliday">연차</label>
								<input type="text"
									 class="form-control form-control-user c-size"
									id="memHoliday" name="memHoliday" ReadOnly value="${map['MEM_HOLIDAY'] }">
							</div>
							<!-- 부서 -->
							<div class="form-group">
								<label for="deptName">부서</label>
								<input type="text"
									 class="form-control form-control-user c-size"
									id="deptName" name="deptName" ReadOnly value="${map['DEPT_NAME'] }">
							</div>
							<!-- 직급 -->
							<div class="form-group">
								<label for="posName">직급</label>
								<input type="text"
									 class="form-control form-control-user c-size"
									id="posName" name="posName" ReadOnly value="${map['POS_NAME'] }">
							</div>
							<!-- 인증여부 -->
							<div class="form-group">
								<input type="hidden"
									 class="form-control form-control-user c-size"
									id="memFlag" name="memFlag" ReadOnly value="Y">
							</div>
							<!-- button -->
							<div class="form-group c-size" style="text-align: center;">
								<br>
								<button type="submit" id="edit_submit" data-toggle="modal"
									data-target="#exampleModal" class="btn btn-primary b-radius">등록</button>
								<button type="button" class="btn btn-danger b-radius" onclick="location.href='<c:url value='../index'/>'">취소</button>
							</div>
						</div>
					</form>
				</div>
			</div>

		</div>


<%@ include file="../inc/bottom.jsp" %>
