<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<!-- http://localhost:9091/wired/default/defaultPage -->
<!-- 2 load the theme CSS file -->
<link rel="stylesheet"
	href="<c:url value='/resources/api/jsTree/dist/themes/proton/style.min.css' />" />

<style type="text/css">
.f-right{
	float: right;
}

.f-left{
	float:left;
}

.setW20 {
	width: 20%;
}

.setW75 {
	width: 75%;
}

.setMR10 {
	margin-right: 10px;
}

.paper {
	width: 210mm;
	min-height: 297mm;
	padding: 20mm; /* set contents area */
	margin: 10mm auto;
	border-radius: 5px;
	background: #fff;
	box-shadow: 0 0 5px rgba(0, 0, 0, 0.5);
}

.tg {
	border-collapse: collapse;
	border-spacing: 0;
}

.tg td {
	border-color: black;
	border-style: solid;
	border-width: 1px;
	font-family: Arial, sans-serif;
	font-size: 14px;
	overflow: hidden;
	padding: 10px 5px;
	word-break: normal;
}

.tg th {
	border-color: black;
	border-style: solid;
	border-width: 1px;
	font-size: 14px;
	font-weight: normal;
	overflow: hidden;
	padding: 10px 5px;
	word-break: normal;
}

.tg .tg-cly1 {
	text-align: left;
	vertical-align: middle
}

.tg .tg-lboi {
	border-color: inherit;
	text-align: left;
	vertical-align: middle
}

.dnd{
	background-color: silver;
}

.sigBox{
	width: 50px;
	height: 50px;
}
</style>
<link rel="stylesheet" href="https://unpkg.com/dropzone@5/dist/min/dropzone.min.css" type="text/css" />
<script
	src="<c:url value='/resources/api/jsTree/dist/libs/jquery.js'/> "></script>
<script src="<c:url value='/resources/api/jsTree/dist/jstree.min.js'/> "></script>
<script src="https://unpkg.com/dropzone@5/dist/min/dropzone.min.js"></script>

<script type="text/javascript">
	$(function() {
		$('#jstree').jstree({
			'core' : {
				'themes' : {
					'name' : 'proton',
					'responsive' : true
				}
			}
		});

		$('form[name=frmWrite]').submit(function(){
			$('.infobox').each(function(idx, item){
				if($(this).val().length<1){
					alert($(this).prev().html() + "을(를) 입력하세요");
					$(this).focus();
					event.preventDefault();
					return false;  //each 탈출
				}
			});
		});

		$('#btList').click(function(){
			location.href="<c:url value='/board/boardList'/>";
		});
		function save(){
			oEditors.getById["txtContent"].exec("UPDATE_CONTENTS_FIELD", []);
		    		//스마트 에디터 값을 텍스트컨텐츠로 전달
			var content = document.getElementById("smartEditor").value;
			alert(document.getElementById("txtContent").value);
		    		// 값을 불러올 땐 document.get으로 받아오기
			return;
		}

		$("div#myId").dropzone({ url: "/file/post" });
	});


</script>
<!-- 전자결재HOME -->
<div class="container-fluid">
<%@ include file="include/navbar.jsp"%>
	<div>
		<!-- title1 -->
		<div class="card shadow mb-4 setW20 setMR10 f-left">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">문서양식</h6>
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<div id="jstree">
						<c:if test="${!empty formList }">
						<c:forEach var="formVo" items="${formList }">
							<ul>
								<li>${formVo.typeNo}-${formVo.formName }</li>
							</ul>
						</c:forEach>
						</c:if>
					</div>
				</div>
			</div>
		</div>
		<div class="card shadow mb-4">
			<div class="card-header py-3 ">
				<div class="setW20 f-left"><h6 class="m-0 font-weight-bold text-primary">문서작성</h6></div>
				<div class="f-right">
                                     <a href="#" class="btn btn-primary btn-icon-split btn-sm">
                                        <span class="icon text-white-50">
                                            <i class="fas fa-flag"></i>
                                        </span>
                                        <span class="text">Export to Excel</span>
                                    </a>
                                     <a href="#" class="btn btn-primary btn-icon-split btn-sm">
                                        <span class="icon text-white-50">
                                            <i class="fas fa-flag"></i>
                                        </span>
                                        <span class="text">Print to pdf</span>
                                    </a>
                                     <a href="#" class="btn btn-primary btn-icon-split btn-sm">
                                        <span class="icon text-white-50">
                                            <i class="fas fa-flag"></i>
                                        </span>
                                        <span class="text">결재선선택</span>
                                    </a>
                                     <a href="#" class="btn btn-primary btn-icon-split btn-sm">
                                        <span class="icon text-white-50">
                                            <i class="fas fa-flag"></i>
                                        </span>
                                        <span class="text">임시저장</span>
                                    </a>
				<a href="#" class="btn btn-success btn-icon-split btn-sm">
                                        <span class="icon text-white-50">
                                            <i class="fas fa-check"></i>
                                        </span>
                                        <span class="text">상신하기</span>
                                    </a>
                                    </div>
			</div>
			<div class="card-body">
				<div class="table-responsive">


						<div class="paper">
							<div class="content">

								<table class="tg" style="table-layout: fixed; width: 100%;">
									<thead>
										<tr>
											<th class="tg-lboi text-center" colspan="3" rowspan="5"><h3>품의서</h3></th>
											<th class="tg-lboi" colspan="3" rowspan="5"><img src="<c:url value='/resources/img/logo/wired_logo.png'/>"></th>
											<th class="tg-lboi">결재선3</th>
											<th class="tg-lboi">결재선2</th>
											<th class="tg-lboi">결재선1</th>
										</tr>
										<tr>
											<th class="tg-lboi" rowspan="3"></th>
											<th class="tg-lboi" rowspan="3"></th>
											<th class="tg-lboi" rowspan="3"><div class="sigBox" ><img src="<c:url value='/resources/img/signature_img.png'/>"></div></th>
										</tr>
										<tr>
										</tr>
										<tr>
										</tr>
										<tr>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td class="tg-lboi">기안부서</td>
											<td class="tg-lboi" colspan="2"></td>
											<td class="tg-lboi">기안일</td>
											<td class="tg-lboi" colspan="2"></td>
											<td class="tg-lboi">문서번호</td>
											<td class="tg-lboi" colspan="2"></td>
										</tr>
										<tr>
											<td class="tg-lboi">기안자</td>
											<td class="tg-lboi" colspan="2"></td>
											<td class="tg-lboi">보존년한</td>
											<td class="tg-lboi" colspan="2"></td>
											<td class="tg-lboi">비밀등급</td>
											<td class="tg-lboi" colspan="2"></td>
										</tr>
										<tr>
											<td class="tg-lboi">제목</td>
											<td class="tg-lboi" colspan="8"><input class="form-control" type="text" placeholder="Default input"></td>
										</tr>
										<tr>
											<td class="tg-0lax" colspan="9" rowspan="14"><textarea
													id="txtContent" rows="20" cols="100" style="width: 100%;"
													class="infobox"></textarea> <!-- textarea 밑에 script 작성하기 -->
												<script type="text/javascript"
													src='<c:url value="/resources/api/smarteditor/js/service/HuskyEZCreator.js"/>'
													charset="utf-8"></script> <script id="smartEditor"
													type="text/javascript">
													var oEditors = [];
													nhn.husky.EZCreator.createInIFrame({
													    oAppRef: oEditors,
													    elPlaceHolder: "txtContent",  //textarea ID 입력
													    sSkinURI: "<c:url value='/resources/api/smarteditor/SmartEditor2Skin.html'/>",  //martEditor2Skin.html 경로 입력
													    fCreator: "createSEditor2",
													    htParams : {
													   	// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
													       bUseToolbar : true,
														// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
														bUseVerticalResizer : false,
														// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
														bUseModeChanger : false
													    }
													});
												</script></td>
										</tr>
									</tbody>
									<tfoot>
										<tr>
											<td class="tg-0lax">파일첨부</td>
											<td class="tg-0lax dnd" colspan="8"><form action="/file-upload"
      class="dropzone"
      id="my-awesome-dropzone"></form></td>
										</tr>
									</tfoot>
								</table>

							</div>
						</div>
				</div>
			</div>

		</div>
	</div>
</div>
<!-- /.container-fluid -->

<%@ include file="../inc/bottom.jsp"%>