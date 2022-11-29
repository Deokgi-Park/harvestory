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
<link rel="stylesheet" href="/resources/css/myPage.css">
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js">
</script>
<script src="/resources/js/myPage.js"></script>
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
	height: 800px!important;
	background-color: white;
}

.tab_cont>div {
	width:99%!important;
	height:auto!important;
	display: none;
	text-align: center;
	margin-top: 3em;
}

.tab_cont div.on {
	display: block;
}

.tab_cont div.on > input {
	color:black;
}

#my_modal {
     display: none;
     width: 300px;
     padding: 20px 60px;
     background-color: #fefefe;
     border: 1px solid #888;
     border-radius: 3px;
 }

 #my_modal .modal_close_btn {
     position: absolute;
     top: 10px;
     right: 10px;
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
					<li><a href="trade/tradeList">포전매매 전자계약</a></li>
					<li><a href="trade/nspList">비규격품 납품/구매</a></li>
					<li><a href="trade/fundingList">농산물 크라우드 펀딩</a></li>
					<li><a href="board/communityList">소통마당</a></li>
					<li><a href="myPage">마이페이지</a></li>
				</ul>
				<div class="login_cover">
					<ul class="login_menu">
						<li><h1>${sessionScope.loginMember.user_NAME }님</h1></li>
						<li><a href="logout">로그아웃</a></li>
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
					<li><a href="myPage">내 정보</a></li>
					<li><a href="message/messageList">쪽지함</a></li>
				</ul>
			</aside>
			<header>
				<h1>내 정보</h1>
			</header>
			<section>
				<article>
					
					<div class="board">
						<ul class="tab_title">
							<li class="on">개인정보 변경</li>
							<li>비밀번호 변경</li>
							<li>활동내역</li>
							<li>거래내역</li>
							<li>결제내역</li>
							<li>신고내역</li>
							<li>1:1 문의</li>
							<li>증빙서류</li>
						</ul>
						<div class="tab_cont">
						
						<!-- ----------------------------------------------------------------------------------------- -->
						
							<!-- 개인정보 변경 -->
							<div class="on defaultDiv">
								<form action="myInfoChange" method="post" id="infoChange_form" enctype="multipart/form-data">
									<div class="circle">
										<c:if test="${sessionScope.loginMember.img_CHNG_NM == 'UserBasicProfile.jpg' }">
											<img src="img/UserBasicProfile.jpg" alt="기본 프로필 이미지입니다" />
										</c:if>
										<c:if test="${sessionScope.loginMember.img_CHNG_NM != 'UserBasicProfile.jpg' }">
											<img src="resources/profileImg/${sessionScope.loginMember.img_CHNG_NM}" alt="사용자 프로필 이미지입니다" />
										</c:if>
									</div>

									<div>
										<input type="hidden" value="${sessionScope.loginMember.user_ID }" name="user_ID">
										<div>
											<span>프로필사진</span>
											<input type="file" id="formFile" name="Thumbnail">
										</div>

										<div>
											<span>가입구분</span>
											<input type="text" id="user_GRADE" placeholder="가입구분"
												value="<c:if test="${sessionScope.loginMember.user_GRADE == 'B' }">매수인</c:if>
                                                        <c:if test="${sessionScope.loginMember.user_GRADE == 'F' }">매도인</c:if>
                                                        <c:if test="${sessionScope.loginMember.user_GRADE == 'C' }">개인</c:if>" readonly>
										</div>

										<div>
											<span>이메일</span>
											<input type="text" name=""id="USER_EMAIL" placeholder="이메일"
												value="${sessionScope.loginMember.user_EMAIL }" readonly>
										</div>

										<div>
											<span>닉네임</span>
											<input type="text" name="user_NAME" value="${sessionScope.loginMember.user_NAME }"
												id="user_NAME" placeholder="이름">
										</div>

										<div>
											<span>주소</span>
											<input type="text" name="user_ADDRESS"
												value="${sessionScope.loginMember.user_ADDRESS}"
												id="user_ADDRESS" placeholder="주소"> 
											<a href="javascript:sample4_execDaumPostcode()">주소 찾기</a>
										</div>

										<div>
											<span>계좌번호</span>
											<input type="text" name="user_ACCOUNT" value="${sessionScope.loginMember.user_ACCOUNT }"
												id="user_ACCOUNT" placeholder="계좌번호">
										</div>

										<div>
											<span>휴대폰번호</span>
											<input type="text" name="user_PHONE" value="${sessionScope.loginMember.user_PHONE }"
												id="user_PHONE" placeholder="휴대폰번호">
										</div>

										<div>
											<div>
												<div>
													<span>신고횟수</span>
													<input type="text" value="${sessionScope.loginMember.user_REPORT }"
														id="user_REPORT"
														placeholder="신고횟수" readonly>
												</div>
											</div>

											<div>
												<div>
													<span>가입일</span>
													<input type="text" 
														value="<fmt:formatDate var="enrolldate" pattern="yyyy-MM-dd" 
																value="${sessionScope.loginMember.user_ENROLLDATE }" /><c:out value="${enrolldate}" />"
														id="user_ENROLLDATE" placeholder="가입일" readonly>
												</div>
											</div>
										</div>

										<div>
											<span>가입방법</span>
											<input type="text" 
												value="<c:if test="${sessionScope.loginMember.user_ENROLL_KIND =='Y'}">일반 - 이메일인증 완료</c:if>
                                                            <c:if test="${sessionScope.loginMember.user_ENROLL_KIND.length() > 1}">일반 - 이메일인증 미완료</c:if>
                                                            <c:if test="${sessionScope.loginMember.user_ENROLL_KIND =='K'}">카카오로그인</c:if>
                                                            <c:if test="${sessionScope.loginMember.user_ENROLL_KIND =='V'}">네이버로그인</c:if>
                                                            <c:if test="${sessionScope.loginMember.user_ENROLL_KIND =='G'}">구글로그인</c:if>"
												id="user_ENROLL_KIND" placeholder="가입방법" readonly>
										</div>
										<br>
										<br>
									</div>
									<div class="re">
										<i class="fas fa-undo-alt"></i>
									</div>
								</form>
								<div>
									<button id="InfoChangeRqButton" >수정하기</button>
								</div>
								
							</div>
							
							<!-- ----------------------------------------------------------------------------------------- -->
							
							<!-- 비밀번호 변경 -->
							<div class="passwordChng defaultDiv">
								<form action="myPasswordChng" method="post">
									<input type="hidden" name="user_ID" value="${sessionScope.loginMember.user_ID }">
									<div> 
										<input type="password" name="user_CURR_PW" id="USER_CURR_PW" placeholder="현재 비밀번호">
									</div> 
									<div>
										<input type="password" name="user_PW" id="USER_PW" placeholder="새 비밀번호">
									</div> 
									<div>
										<input type="password" name="USER_PW_CHK" id="USER_PW_CHK" placeholder="새 비밀번호 재확인">
									</div>
									<button>비밀번호 변경</button>
								</form>
							</div>
							
						<!-- ----------------------------------------------------------------------------------------- -->
							
							<div class="defaultDiv">활동내역</div>
							
						<!-- ----------------------------------------------------------------------------------------- -->	
							
							<div class="defaultDiv">거래내역</div>
							
						<!-- ----------------------------------------------------------------------------------------- -->	
							
							<div class="defaultDiv">결제내역</div>
							
						<!-- ----------------------------------------------------------------------------------------- -->	
						
							<div class="defaultDiv">신고내역</div>
							
						<!-- ----------------------------------------------------------------------------------------- -->	
							<!-- 1대 1 문의 -->
							<!-- 리스트 출력 / 클릭 시 모달 팝업 -->
							<div class="defaultDiv">
								<div class="search">
									<div class="search_position 1on1Search">
										<input type="text" name="searchValue" placeholder="원하는 키워드를 검색해주세요">
										<button>
											<i class="fas fa-search"></i>
										</button>
									</div>
                        		</div>
								<h1><button id="popup_open_btn">문의하기</button></h1>
									 <div id="my_modal">
							           <form method="post" action="board/askSend">
							           		<input type="hidden" name="user_ID" value="${sessionScope.loginMember.user_ID }" >
							           		<input type="text" name="board_TITLE" placeholder="문의 제목">
							           		<textarea name="board_CONTENT" placeholder="문의 내용"></textarea>
							           		<input type="submit" value="등록">
							           </form>
							           							           
							            <a class="modal_close_btn">닫기</a>
							        </div>
								
								<table>
									<thead>
									  <tr>
										<th>문의 제목</th>
										<th>문의일</th>
										<th>답변 여부</th>
									  </tr>
									</thead>
									<tbody>
										<c:if test="${empty myAskList }">
											<tr>
												<td colspan="3">
													등록한 1:1 문의내역이 없습니다.
												</td>
											</tr>
										</c:if>
										<c:if test="${!empty myAskList }">
											<c:forEach var="ask" items="${myAskList }">
												<tr id="${ask.board_NO }">
													<td>${ask.board_TITLE }</td>
													<td><fmt:formatDate var="askDate" pattern="yyyy-MM-dd" value="${ask.board_DATE }" /><c:out value="${askDate}" /></td>
													<td>
														<!-- 답변 여부 ~~~!  -->
														<c:if test="${ask.answer_CONTENT == null}">X</c:if><c:if test="${ask.answer_CONTENT != null}">O</c:if>
													</td>
												</tr>
											</c:forEach>
										</c:if>
									</tbody>
								 </table>
							</div>
						<!-- ----------------------------------------------------------------------------------------- -->	
							
							<div class="defaultDiv">증빙서류</div>


						</div> <!-- /tab-cont -->
					</div> <!-- /board -->
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