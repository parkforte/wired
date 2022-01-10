<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp"%>

<!-- http://localhost:9091/wired/default/defaultPage -->
<!-- 2 load the theme CSS file -->
<link rel="stylesheet"
	href="<c:url value='/resources/api/jsTree/dist/themes/proton/style.min.css' />" />

<style type="text/css">
.f-right {
	float: right;
}

.f-left {
	float: left;
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

.dnd {
	background-color: silver;
}

.sigTitle {
	width: 50px;
	height: 20px;
	background-color: pink;
}

.sigImg {margin-top20px;
	width: 50px;
	height: 50px;
	background-color: silver;
}

.sigBox {
	padding: 0;
	width: 50px;
	height: 70px;
	background-color: silver;
}

.btnMargin {
	margin-left: 40px;
	margin-top: 5px;
}

.bs4-order-tracking {
	margin-bottom: 30px;
	overflow: hidden;
	color: #878788;
	padding-left: 0px;
	margin-top: 30px
}

.bs4-order-tracking li {
	list-style-type: none;
	font-size: 13px;
	width: 33%;
	float: left;
	position: relative;
	font-weight: 400;
	color: #878788;
	text-align: center
}

.bs4-order-tracking li:first-child:before {
	margin-left: 15px !important;
	padding-left: 11px !important;
	text-align: left !important
}

.bs4-order-tracking li:last-child:before {
	margin-right: 5px !important;
	padding-right: 11px !important;
	text-align: right !important
}

.bs4-order-tracking li>div {
	color: #fff;
	width: 29px;
	text-align: center;
	line-height: 29px;
	display: block;
	font-size: 12px;
	background: #878788;
	border-radius: 50%;
	margin: auto
}

.bs4-order-tracking li:after {
	content: '';
	width: 150%;
	height: 2px;
	background: #878788;
	position: absolute;
	left: 0%;
	right: 0%;
	top: 15px;
	z-index: -1
}

.bs4-order-tracking li:first-child:after {
	left: 50%
}

.bs4-order-tracking li:last-child:after {
	left: 0% !important;
	width: 0% !important
}

.bs4-order-tracking li.active {
	font-weight: #FF73B8;
	color: #FF73B8;
}

.bs4-order-tracking li.active>div {
	background: #FF73B8;
}

.bs4-order-tracking li.active:after {
	background: #FF73B8;
}

.card-timeline {
	background-color: #fff;
	z-index: 0
}
</style>
<link rel="stylesheet"
	href="https://unpkg.com/dropzone@5/dist/min/dropzone.min.css"
	type="text/css" />
<script
	src="<c:url value='/resources/api/jsTree/dist/libs/jquery.js'/> "></script>
<script src="<c:url value='/resources/api/jsTree/dist/jstree.min.js'/> "></script>
<script src="https://unpkg.com/dropzone@5/dist/min/dropzone.min.js"></script>

<script type="text/javascript">
	$(function() {

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
	<%@ include file="../include/navbar.jsp"%>
	<div class="card card-timeline px-2 border-none">
		<ul class="bs4-order-tracking">
			<li class="step active">
				<div>
					<i class="fas fa-user"></i>
				</div> 문서양식&결재라인선택
			</li>
			<li class="step active">
				<div>
					<i class="fas fa-bread-slice"></i>
				</div> 문서작성
			</li>
			<li class="step ">
				<div>
					<i class="fas fa-truck"></i>
				</div> 상신완료
			</li>
		</ul>
		<h5 class="text-center">
			<b>결재 문서를 작성하세요.</b>
		</h5>
	</div>


	<div>
		<div class="card shadow mb-4">
			<div class="card-header py-3 ">
				<div class="setW20 f-left">
					<h6 class="m-0 font-weight-bold text-primary">문서작성</h6>
				</div>
				<div class="f-right">
					<a href="#" class="btn btn-primary btn-icon-split btn-sm"> <span
						class="icon text-white-50"> <i class="fas fa-flag"></i>
					</span> <span class="text">Export to Excel</span>
					</a> <a href="#" class="btn btn-primary btn-icon-split btn-sm"> <span
						class="icon text-white-50"> <i class="fas fa-flag"></i>
					</span> <span class="text">Print to pdf</span>
					</a> <a href="#" class="btn btn-success btn-icon-split btn-sm"> <span
						class="icon text-white-50"> <i class="fas fa-check"></i>
					</span> <span class="text">상신하기</span>
					</a>
				</div>
			</div>
			<div class="card-body">
				<div class="table-responsive">

					<c:forEach var="vo" items="confirmVo">
					<div class="paper">
						<div class="content">

							<table class="tg" style="table-layout: fixed; width: 100%;">
								<thead>
									<tr>
										<th class="tg-lboi text-center" colspan="3" rowspan="5"><h3>품의서</h3></th>
										<th class="tg-lboi" colspan="4" rowspan="5"><img
											src="<c:url value='/resources/img/logo/wired_logo.png'/>"></th>
										<th>
											<div class="sigBox">
												<div class="sigTitle"></div>
												<div class="sigImg"></div>
											</div>
										</th>
										<th>
											<div class="sigBox">
												<div class="sigTitle"></div>
												<div class="sigImg"></div>
											</div>
										</th>
									</tr>
									<tr>
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
										<td class="tg-lboi" colspan="2">${cfRegdate }</td>
										<td class="tg-lboi">문서번호</td>
										<td class="tg-lboi" colspan="2">WIRED-${vo.memNo }-${vo.cfNo }</td>
									</tr>
									<tr>
										<td class="tg-lboi">기안자</td>
										<td class="tg-lboi" colspan="2">${vo.memNo  }</td>
										<td class="tg-lboi">보존년한</td>
										<td class="tg-lboi" colspan="2">5년</td>
										<td class="tg-lboi">비밀등급</td>
										<td class="tg-lboi" colspan="2">대외비</td>
									</tr>
									<tr>
										<td class="tg-lboi">제목</td>
										<td class="tg-lboi" colspan="8"><input
											class="form-control" type="text" placeholder="제목을 입력하세요." ></td>
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
										<td class="tg-0lax">증빙서류</td>
										<td class="tg-0lax dnd" colspan="8"><form
												action="/file-upload" class="dropzone"
												id="my-awesome-dropzone"></form></td>
									</tr>
								</tfoot>
							</table>

						</div>
					</div>
					</c:forEach>
				</div>
			</div>

		</div>
	</div>
</div>
<!-- /.container-fluid -->

<%@ include file="../../inc/bottom.jsp"%>