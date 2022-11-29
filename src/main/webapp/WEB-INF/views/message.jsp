<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Harvestory :: 누구나 참여하는 농산물 플랫폼</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
	integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf"
	crossorigin="anonymous">
<link rel="stylesheet" href="/resources/css/trade.css">
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	$(document).ready(function() {
		$("#InfoChangeRqButton").click(function() {
			const form = infoChange_form;
			form.submit();
		});
		
		
		$(".tab_title li").click(function() {
			var idx = $(this).index();
			$(".tab_title li").removeClass("on");
			$(".tab_title li").eq(idx).addClass("on");
			$(".tab_cont > div").hide();
			$(".tab_cont > div").eq(idx).show();
		});
	});

	function sample4_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var roadAddr = data.roadAddress; // 도로명 주소 변수
						var extraRoadAddr = ''; // 참고 항목 변수

						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraRoadAddr !== '') {
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('user_ADDRESS').value = data.zonecode
								+ ' ' + roadAddr + data.jibunAddress;

						// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
						if (roadAddr !== '') {
							document.getElementById("user_ADDRESS").value = data.zonecode
									+ ' '
									+ roadAddr
									+ data.jibunAddress
									+ extraRoadAddr;
						} else {
							document.getElementById("user_ADDRESS").value = data.zonecode
									+ ' ' + roadAddr + data.jibunAddress;
						}
					}
				}).open();
	}
</script>
<style>
.tab_title li {
	list-style: none;
	float: left;
	width: 21%;
	padding: 10px 15px;
	cursor: pointer;
	text-align: center;
	border: 1px solid #bebebe;
}

.tab_title li.on {
	background-color: #ffb715;
	font-weight: bold;
}

.tab_cont {
	width:99%!important;
	clear: both;
	border: 1px solid black;
	height: 800px!important;
	background-color: white;
}

.tab_cont>div {
	width:99%!important;
	height:auto!important;
	display: none;
	text-align: center;
}

.tab_cont div.on {
	display: block;
}

.tab_cont div.on > input {
	color:black;
}
</style>
</head>
<body>
	<div id="index_cover">
		<nav>
			<div class="underline">
				<div class="m_logo">
					<a href="/"><img src="/resources/images/logo_test.png" alt="하베스토리_로고"></a>
				</div>
				<ul class="login_info">
					<li><a href="/trade/tradeList">포전매매 전자계약</a></li>
					<li><a href="/trade/nspList">비규격품 납품/구매</a></li>
					<li><a href="">농산물 크라우드 펀딩</a></li>
					<li><a href="/board/communityList">소통마당</a></li>
					<li><a href="/myPage">마이페이지</a></li>
				</ul>
				<div class="login_cover">
					<ul class="login_menu">
						<li><h1>${sessionScope.loginMember.user_NAME }님</h1></li>
						<li><a href="/logout">로그아웃</a></li>
					</ul>
				</div>
			</div>
		</nav>
		<div id="main_container">
			<aside>
				<ul>
					<li>
						<h3>마이페이지</h3>
					</li>
					<li><a href="/myPage">내 정보</a></li>
					<li><a href="messageList">쪽지함</a></li>
				</ul>
			</aside>
			<header>
				<h1>내 정보</h1>
			</header>
			<section>
				<article>
				
					<div class="board">
						<ul class="tab_title">
							<li class="on">수신 쪽지함</li>
							<li>발신 쪽지함</li>
							<li>삭제 쪽지함</li>
						</ul>
						<div class="tab_cont">
						
							<!-- ----------------------------------------------------------------------------------------- -->
							
							<div class="on"> 
								<div class="search">
									<input type="text" name="searchValue" placeholder="원하는 키워드를 검색해주세요">
									<button>
										<i class="fas fa-search"></i>
									</button>
								</div>
								
								<table>
									<thead>
										<tr>
											<th>보낸 회원</th>
											<th>내용</th>
											<th>확인여부</th>
											<th>답장여부</th>
											<th>일자</th>
										</tr>
									</thead>
									<tbody>
										<c:if test="${empty messageRecievedList }">
											<tr>
												<td colspan="5">쪽지내역이 없습니다.</td>
											</tr>
										</c:if>
										<c:if test="${!empty messageRecievedList}">
											<c:forEach var="msg" items="${messageRecievedList}">
												<tr class="sendReplyTr" data-bs-toggle="modal" data-bs-target="#modal-container-1212${msg.msg_NO}">
													<!--  받은 메세지 Modal POP-UP -->
													<div id="modal-container-1212${msg.msg_NO}" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
														<div role="document">
															<div id="modal-1212${msg.msg_NO}">
																<form method="POST" action="sendMessageReply" id="sendReplyForm">
																
																	<input type="hidden" name="msg_NO" class="msg_NO" value="${msg.msg_NO}"> 
																	<input type="hidden" name="msg_WITH" value="${msg.user_ID }">

																	<c:if test="${msg.user_ID != 'harvestory.info@gmail.com'}">
																		<input name="msg_WITH_NAME" value="${msg.user_NAME }">님께 답장
                                                                    </c:if>

																	<div class="card">
																		<div style="background-color: rgba(176, 196, 222, 0.726);">
																			<h5>받은 쪽지</h5>
																		</div>
																		<div class="modal-body">
																			<textarea rows="6" cols="55" readonly>${msg.msg_CONTENT}</textarea>
																		</div>
																		
																		<c:if test="${msg.user_ID != 'harvestory.info@gmail.com'}">
																			<div style="background-color: rgba(176, 196, 222, 0.726);">
																				<h5>답장 작성</h5>
																			</div>

																			<div class="modal-body">
																				<input type="hidden" name="user_ID" value="${sessionScope.loginMember.user_ID }">
																				<input type="hidden" name="user_NAME" value="${sessionScope.loginMember.user_NAME }">
																				<textarea rows="6" cols="55" name="msg_CONTENT"></textarea>
																			</div>

																			<div class="modal-footer">
																				<a href="${msg.user_ID}">신고하기</a> 
																				<a href="msgDelete?msg_NO=${msg.msg_NO }">삭제</a>
																				<button>전송</button>
																				<button type="button" class="btn btn-outline-secondary" data-dismiss="modal">취소</button>
																			</div>
																		</c:if>
																	</div>
																</form>
															</div>
															<!-- /.card -->
														</div>
													</div>
													<td class="displayNone">${msg.msg_NO}</td>
													<td style="text-align: center;">${msg.user_NAME}</td>
													<td>${msg.msg_CONTENT}</td>
													<td><c:if test="${msg.msg_CHECK =='N'}">X</c:if>
														<c:if test="${msg.msg_CHECK =='Y'}">O</c:if></td>
													<td><c:if test="${msg.msg_ANSWER =='N'}">X</c:if>
														<c:if test="${msg.msg_ANSWER =='Y'}">O</c:if></td>
													<td><fmt:formatDate value="${msg.msg_SENT_DT}" type="both" pattern="yyyy-MM-dd HH:MM" /></td>
												</tr>
											</c:forEach>
										</c:if>
									</tbody>
								</table>
							
								
							</div>
								 
							<!-- ----------------------------------------------------------------------------------------- -->
							
							<div> 발신 쪽지함 </div>
							
							<!-- ----------------------------------------------------------------------------------------- -->
							
							<div> 삭제 쪽지함 </div>
						
						
						</div>
					</div>
					<div class="pager"></div>
				</article>
			</section>
		</div>
		<footer>
			<div>
				<div class="bottom_logo">
					<img src="하단로고.png" alt="하단로고">
				</div>
				<div id="service_name_area">
					<a href="#">
						<h2>(팀)CropFit 크롭핏</h2>
					</a>
					<ul>
						<li>회사소개 : 테스트데이터</li>
						<li>개인정보보호정책</li>
						<li>위치 : 한국 폴리텍대학교 대전캠퍼스</li>
						<li><a href='tel:010-7732-6931'>고객센터 : 폴리텍대학교 워크스테이션실</a></li>
					</ul>
					<address>주소: 대전광역시 동구 우암로 32-10</address>
				</div>
			</div>
		</footer>
		<div class="up">
			<h4>
				<a href="#">^</a>
			</h4>
		</div>
	</div>
</body>
</html>