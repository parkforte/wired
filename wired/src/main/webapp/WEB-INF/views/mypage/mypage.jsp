
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
.check-margin {
    margin-top: -17px;
    margin-left: 6px;
}
.check-margin2 {
    margin-top: 13px;
    margin-left: 6px;
}
#t-width {
    width: 3%;
}
</style>


<!--javaScript영역-->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">

	$(function(){
		var isCertification = false;
		$('#edit_submit').click(function() {
			if($('#memPwd').val().length<1){
				alert('비밀번호를 입력하세요');
				$('#memPwd').focus();
				event.preventDefault();
			}else if($('#memPwd').val()!=$('#memPwd2').val()){
				alert('비밀번호가 일치하지 않습니다!');
				$('#memPwd2').focus();
				event.preventDefault();
			}else if(!validate_phone($('#memHp2').val())||
					!validate_phone($('#memHp3').val())){
				alert('전화번호는 숫자만 가능합니다.');
				$('#memHp2').focus();
				event.preventDefault();
			}else if($('#memAddress').val().length<1){
				alert('주소를 입력해주세요.');
				$('#memAddressdetail').focus();
				event.preventDefault();
			}else if($('#memFlag').val()=='N'){
				alert('이메일 인증을 해주세요');
 				$('#memEmail1').focus();
				event.preventDefault();
			}

		});
		var key = "";
		$('#email-btn').click(function(){
			var mail = $('#memEmail1').val();
			if(mail==""){
				alert("메일 주소를 입력해주세요.");
				event.preventDefault();
			}else{
				if($('#memEmail2').val()=='etc'){
					mail = mail+"@"+$('#email3').val();
				}else{
					mail = mail+"@"+$('#memEmail2').val();	//셀렉트 박스에 값들을 더 함
				}

				$.ajax({
					type:"post",
					url:"<c:url value='/CheckMail'/>",
					dataType:"json",
					async:"false",
					data:{
						mail:mail
					},
					success:function(data){
						console.log(data.key);
						key = data.key;
					}
				});
				alert('인증번호가 전송되었습니다.');
				$(".compare").css("display","block");
				$(".compare-text").css("display","block");
				event.preventDefault();
			}

		});

		$(".compare").on("propertychange change keyup paste input", function() {
			if ($(".compare").val() == key) {
				$(".compare-text").text("인증 성공!").css("color", "#28A745");
				isCertification = true;
				$('#memFlag').val('Y');
			} else {
				$(".compare-text").text("불일치!").css("color", "red");
				isCertification = false;
			}
		});

		$('select[name=memEmail2]').change(function() {
			if($('#memEmail2').val()=='etc'){
				$('#email3').css('visibility','visible');
			}
		});

// 		$('#btZipcode').click(function(){
// 			window.open(
// 				"/wired/zipcode/zipcode",
// 				"zipWin",
// 				"left=50, top=20, width=500, height=500, scrollbars=yes,resizable=yes");
// 		});
	});
	function validate_phone(tel){
		var pattern = new RegExp(/^[0-9]*$/g);
		return pattern.test(tel);

	}

	if(Character.compare(vo.getMemFlag(), 'N')==0){
		alert('상세정보를 입력하세요.');
	}
	function btnzipcode(){
		new daum.Postcode({
	        oncomplete: function(data) {

	        	console.log(data);

	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var roadAddr = data.roadAddress; // 도로명 주소 변수
	            var jibunAddr = data.jibunAddress; // 지번 주소 변수
	            // 우편번호와 주소 정보를 해당 필드에 넣는다.

	            $('#memZipcode').val(data.zonecode);
	            if(roadAddr != ''){
	            	$('#memAddress').val(roadAddr);
	            }
	            else if(jibunAddr != ''){
	            	$('#memAddressdetail').val(jibunAddr);
	            }

	        },
	        theme: {
            	bgColor: "#F2F2FC" //바탕 배경색
            }
	    }).open();
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
									id="memId" name="memId" value="${map['MEM_ID'] }">
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
								<input style="display: inline-block" type="Button" value="우편번호 찾기" id="btZipcode"
									onclick="btnzipcode()" title="새창열림" class="btn btn-primary b-radius">
								<br /><span class="sp1">&nbsp;</span>
								<input type="text" name="memAddress" ReadOnly title="주소" id="memAddress"
								class="form-control form-control-user c-size" placeholder="주소" value="${map['MEM_ADDRESS'] }">
								<span class="sp1">&nbsp;</span>
								<input type="text" name="memAddressdetail" title="상세주소" id="memAddressdetail"
									class="form-control form-control-user c-size" placeholder="상세주소" value="${map['MEM_ADDRESSDETAIL'] }">
							</div>
						    <c:set var="etcYn" value=""/>
						    <c:choose>
						    	<c:when test="${map['MEM_EMAIL2'] != 'naver.com' && map['MEM_EMAIL2'] != 'nate.com'
						    		&& map['MEM_EMAIL2'] != 'daum.net' && map['MEM_EMAIL2'] != 'gmail.com'
						    		&& !empty map['MEM_EMAIL2']}">
								    <c:set var="etcYn" value="Y"/>
						    	</c:when>
						    	<c:otherwise>
								    <c:set var="etcYn" value="N"/>
						    	</c:otherwise>
						    </c:choose>
						        <label for="email1">이메일 주소</label>
						    <div class="form-group row" >
						        <input type="text" name="memEmail1"  id="memEmail1" class="form-control  c-size s-half-style"
						        	title="이메일주소 앞자리" value="${map['MEM_EMAIL1']}">
						        <span class="between">@</span>
						        <select class="form-control  c-size s-half-style" name="memEmail2" id="memEmail2"  title="이메일주소 뒷자리">
						            <option value="naver.com"
						            	<c:if test = "${map['MEM_EMAIL2'] == 'naver.com'}">
						            		selected="selected"
						            	</c:if>
						            >naver.com</option>
						            <option value="daum.net"
						            	<c:if test = "${map['MEM_EMAIL2'] == 'daum.net'}">
						            		selected="selected"
						            	</c:if>
						            >daum.net</option>
						            <option value="nate.com"
						            	<c:if test = "${map['MEM_EMAIL2'] == 'nate.com'}">
						            		selected="selected"
						            	</c:if>
						            >nate.com</option>
						            <option value="gmail.com"
						            	<c:if test = "${map['MEM_EMAIL2'] == 'gmail.com'}">
						            		selected="selected"
						            	</c:if>
						            >gmail.com</option>
						            <option value="etc"
						            	<c:if test = "${etcYn == 'Y'}">
						            		selected="selected"
						            	</c:if>
						            >직접입력</option>
						        </select>
						        <input type="text" name="email3" id="email3"
						        	class="form-control  c-size s-half-style" title="직접입력인 경우 이메일주소 뒷자리"
						           	<c:if test = "${etcYn == 'Y'}">
							        	style="visibility:visible;"
							        	value="${map['MEM_EMAIL2']}"
							        </c:if>
						           	<c:if test = "${etcYn != 'Y'}">
						        		style="visibility:hidden;"
							        </c:if>
						        >
						        <button class="btn btn-primary" type="submit" id="email-btn">인증</button>
						        <input type="text" placeholder="인증 키 입력" style="display: none;"
									class="form-control  c-size s-half-style compare"><span class="compare-text"
									style="display: none">불일치</span>
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
									id="memFlag" name="memFlag" ReadOnly value="${map['MEM_FLAG']}">
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