<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- http://localhost:9091/wired/employee/emplRegister -->

<!-- css영역 -->
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');
.outer{
	text-align: center;
}
.r-table {
    width: 36%;
    margin-left: 31.5%;
}
#content{
	background-color: #F2F2FC;
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

<!-- javaScript영역 -->
<script type="text/javascript">
	$(function() {
		 $('#first_button').click(function() {
			if($('#memName').val().length<1){
				alert('이름을 입력하세요');
				$('#memName').focus();
				event.preventDefault();
			}else if($('#memPwd1').val().length<1){
				alert('비밀번호를 입력하세요');
				$('#memPwd1').focus();
				event.preventDefault();
			}else if($('#memPwd1').val()!=$('#memPwd2').val()){
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

</script>

               <!-- emplRegister -->
                <div class="container-fluid font">
	                    <!-- Page Heading -->
	                    <!-- title1 -->
	                    <div class="card shadow mb-4 r-table">
	                        <div class="card-body">
	                        <form name="frm1" class="user" method="post" action="<c:url value='/employee/emplRegister'/>">
	                            <div class="table-responsive">
				                    <div class="outer">
					                    <h1 class="h3 mb-2 text-gray-800 h1-style">사원등록</h1>
					                    <p class="mb-4">Employee registration</p>
									</div>
	                            	<!-- 이름 -->
	                            	<div class="form-group">
                                    <input type="text" class="form-control form-control-user c-size" name="memName" id="memName"
                                        placeholder="이름">
                                	</div>
	                            	<!-- 비밀번호 -->
	                            	<div class="form-group">
                                    <input type="password" class="form-control form-control-user c-size" name="memPwd" id="memPwd1"
                                        placeholder="비밀번호 입력">
                                	</div>
	                            	<!-- 비밀번호확인 -->
	                            	<div class="form-group">
                                    <input type="password" class="form-control form-control-user c-size" name="memPwd" id="memPwd2"
                                        placeholder="비밀번호 재입력">
                                	</div>
                                	<!-- 연락처 -->
	                            	<div class="form-group row">
	                                <select name="memHp1" class="form-control  c-size s-half-style" id="memHp1" title="휴대폰 앞자리">
							            <option value="010">010</option>
							            <option value="011">011</option>
							            <option value="016">016</option>
							            <option value="017">017</option>
							            <option value="018">018</option>
							            <option value="019">019</option>
							       	</select>
							        <span>-</span>
							        <input type="text" name="memHp2" id="memHp2" maxlength="4" title="휴대폰 가운데자리"
							        	class="form-control  c-size s-half-style">
							        <span>-</span>
							        <input type="text" name="memHp3" id="memHp3" maxlength="4" title="휴대폰 뒷자리"
							        	class="form-control  c-size s-half-style">
                                	</div>
                                	<hr>
                                	<!-- 연봉,연차 -->
	                            	<div class="form-group row">
	                                <input type="text" class="form-control form-control-user c-size half-style" name="memPay" id="memPay"
	                                    placeholder="연봉">
	                                <span></span>
	                                <input type="text" class="form-control form-control-user c-size half-style" name="memHoliday" id="memHoliday"
	                                    placeholder="연차">
                                	</div>
                                	<!-- 부서,직급 -->
	                            	<div class="form-group row rank-margin">
	                                <select id="inputState deptNo" class="form-control  c-size half-style" name="deptNo" >
								        <option>부서</option>
								        <option value="1">인사팀</option>
								        <option value="2">재무팀</option>
								        <option value="3">영업1팀</option>
								        <option value="4">영업2팀</option>
								        <option value="5">영업3팀</option>
								        <option value="6">운영1팀</option>
								        <option value="7">운영2팀</option>
								        <option value="8">운영3팀</option>
								        <option value="9">백앤드팀</option>
								        <option value="10">프론트팀</option>
								        <option value="11">디자인팀</option>
								    </select>
	                                <span></span>
	                                <select id="inputState posNo" class="form-control  c-size half-style" name="posNo" >
								        <option>직급</option>
								        <option value="1">사원</option>
								        <option value="2">주임</option>
								        <option value="3">대리</option>
								        <option value="4">과장</option>
								        <option value="5">부장</option>
								    </select>

                                	</div>
                                	<!-- 권한 -->
	                            	<div class="form-group">
                                    <select id="inputState ranksNo" class="form-control c-size rank-margin" name="ranksNo">
								        <option>권한</option>
								        <option value="1">일반</option>
								        <option value="2">팀장이상</option>
								        <option value="3">관리자</option>
								    </select>
								    </div>
	                                <div class="form-group c-size">
	                                <br>
	                                    <button type="submit" class="btn btn-primary b-radius" id="first_button">등록</button>
	                                    <button type="button" class="btn btn-danger b-radius">취소</button>
	                                    <button type="button" class="btn btn-secondary b-radius">목록</button>
                                	</div>
	                            </div>
	                          </form>
	                        </div>
						</div>

                </div>
                <!-- Modal -->
			<!-- <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
			        <button type="button" class="btn btn-secondary b-radius" data-dismiss="modal" >취소</button>
			        <button type="submit" class="btn btn-primary b-radius" id="regi_submit">확인</button>
			      </div>
			    </div>
			  </div>
			</div> -->
                <!-- /.container-fluid -->

<%@ include file="../inc/bottom.jsp" %>
