<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Harvestory :: 누구나 참여하는 농산물 플랫폼</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
<link rel="stylesheet" href="css/index.css">
<script src="js/index.js"></script>

</head>
<body>
	<div id="index_cover">
		<ul id="btn1">
			<li class="on"></li>
			<li></li>
			<li></li>
		</ul>
		<nav>
			<div class="underline">
				<div class="m_logo">
					<a href="/"><img src="/resources/images/logo_test.png" alt="하베스토리_로고"></a>
				</div>
				<ul class="login_info">
					<li><a href="trade/tradeList">포전매매 전자계약</a></li>
					<li><a href="trade/nspList">비규격품 납품/구매</a></li>
					<li><a href="">농산물 크라우드 펀딩</a></li>
					<li><a href="board/communityList">소통마당</a></li>
					<li><a href="myPage">마이페이지</a></li>
				</ul>
				<div class="login_cover">
					<ul class="login_menu">
						<c:if test="${sessionScope.loginMember == null }">
							<li><a href="#" class="login">로그인</a></li>
							<li><a href="#" class="signup">회원가입</a></li>
						</c:if>
						<c:if test="${sessionScope.loginMember != null && sessionScope.loginMember.user_ENROLL_KIND.length() > 1 }">
							<li><h1>Harvestory에 가입해주셔서 감사합니다.</h1></li>
							<li>
								<a href="logout">${sessionScope.loginMember.user_NAME }님, 가입하신 이메일로 인증메일 확인을 해주세요. </a>
							</li>
						</c:if>
						<c:if test="${sessionScope.loginMember != null && sessionScope.loginMember.user_ENROLL_KIND.length() == 1 }">
							<li><h1>${sessionScope.loginMember.user_NAME }님</h1></li>
							<li>
								<a href="logout">로그아웃</a>
							</li>
						</c:if>
					</ul>
				</div>
			</div>
		</nav>
		<header>
			<div class="header_container1">
				<video src="img/header_back_move.mp4" autoplay muted loop></video>
				<div class="header_content">
					<div class="main_text">
						<p>Contract Farming Management</p>
						<h1>Harvestory</h1>
					</div>
					<div class="move_cover">
						<div class="search">
							<input type="text" placeholder="원하는 농작물을 검색해주세요">
							<button>
								<i class="fas fa-search"></i>
							</button>
						</div>
						<div class="how_to_use">
							<h4>How to use</h4>
							<div>
								<a href="">포전매매 전자계약<br>(밭떼기 거래) 이용방법<br></a><span>2021-05-01</span>
							</div>
							<div>
								<a href="">농산물 크라우드펀딩<br>이용방법<br></a><span>2021-05-01</span>
							</div>
						</div>
						<form id="signInForm" action="login" method="POST" class="login_form">
							<div class="login_container">
								<input class="login_ID" type="text" name="user_ID" placeholder="아이디"> 
								<input class="login_PW" type="password" name="user_PW" placeholder="비밀번호">
								<button type="button">LOGIN</button>
								<a href="FindmyInfo">아이디나 비밀번호를 잊으셨나요?</a><br>
							</div>
							<div class="login_api">
								<div style="background: yellow;"> <i class="fas fa-sms"></i><br>카카오</div>
								<div style="background: whitesmoke;"> <i class="fab fa-google"></i><br>구글</div>
								<div style="background: greenyellow;"> <i class="fas fa-search"></i><br>네이버</div>
								<div style="background: cornflowerblue;"> <i class="fab fa-facebook-square"></i><br>페이스북</div>
								<div class="re">
									<i class="fas fa-undo-alt"></i>
								</div>
							</div>
						</form>
					</div>
				</div>
				<div class="bg"></div>
			</div>
			<div class="header_container2">
				<div class="signup_input">
					<form action="signUp" method="post" class="signup_form">
						<div class="circle">
							<img src="img/농부.gif" alt="">
						</div>
						<div class="signup_container">
							<div style="float: left;">
								<label for="">가입구분 : </label> 
								<input type="radio" name="user_GRADE" value="B" id="buyer" checked> 
								<label for="B">매수인</label>
							</div>
							<div style="float: left;">
								<input type="radio" name="user_GRADE" value="F" id="farmer">
								<label for="F">매도인</label>
							</div>
							<div style="float: left;">
								<input type="radio" name="user_GRADE" value="C" id="customer">
								<label for="C">개인</label>
							</div>
							
							<input required="required" type="text" name="user_EMAIL" id="USER_EMAIL" placeholder="이메일"> 
							<input required type="password" name="user_PW" id="USER_PW" placeholder="비밀번호">
							<input required type="password" name="user_PW_CHK" id="USER_PW_CHK" placeholder="비밀번호 재확인"> 
							<input required type="text" name="user_NAME" id="USER_NAME" placeholder="이름">
							<button class="signup_go" type="button" onclick="validate()">Sign Up</button>
						</div>
						<div class="re">
							<i class="fas fa-undo-alt"></i>
						</div>
					</form>
				</div>
				<div class="signup_deco">
					<img src="img/화면.png" alt="">
				</div>
			</div>
		</header>
		<article>
			<div class="article_nav">
				<div class="nav_name on">
					<h2>포전매매 전자계약</h2>
					<p>전자계약으로 더 안전하게</p>
					<input type="hidden" value="0">
				</div>
				<div class="nav_name">
					<h2>비규격품 농산물</h2>
					<p>맛있는 농산물을 싼 가격으로</p>
					<input type="hidden" value="1">
				</div>
				<div class="nav_name">
					<h2>농산물 크라우드 펀딩</h2>
					<p>함께해서 더욱 좋은 농산물 마당</p>
					<input type="hidden" value="2">
				</div>
				<div class="article_search">
					<input type="text">
					<button>
						<i class="fas fa-search"></i>
					</button>
				</div>
				<ul class="article_selecter">
					<li class="active"><i class="fas fa-arrow-right"></i>포전매매 전자계약</li>
					<li><i class="fas fa-arrow-right"></i>비규격품 농산물</li>
					<li><i class="fas fa-arrow-right"></i>농산물 크라우드 펀딩</li>
				</ul>
			</div>
			<div class="article_content">
				<div class="left">
					<i class="fas fa-chevron-left"></i>
				</div>
				<ul class="slider">
					<li class="no0 on">
						<c:forEach var="i" begin="0" end="2">
							<ul class="letter">
								<c:forEach var="j" begin="0" end="5">
									<li><img alt="" src="img/unimg.gif">
										<div>
											<h3> 제목 <c:out value="${j}"></c:out> </h3>
											<p>내용</p>
										</div>
									</li>
								</c:forEach>
							</ul>
						</c:forEach>
					</li>
					<li class="no1">
						<c:forEach var="i" begin="0" end="2">
							<ul class="letter">
								<c:forEach var="j" begin="0" end="5">
									<li><img alt="" src="img/unimg.gif">
										<div>
											<h3> 제목 <c:out value="${j}"></c:out> </h3>
											<p>내용</p>
										</div>
									</li>
								</c:forEach>
							</ul>
						</c:forEach>
					</li>
					<li class="no2"><c:forEach var="i" begin="0" end="2">
							<ul class="letter">
								<c:forEach var="j" begin="0" end="5">
									<li><img alt="" src="img/unimg.gif">
										<div> 
											<h3> 제목 <c:out value="${j}"></c:out> </h3>
											<p>내용</p>
										</div>
									</li>
								</c:forEach>
							</ul>
						</c:forEach>
					</li>
				</ul>
				<div class="right">
					<i class="fas fa-chevron-right"></i>
				</div>
				<ul class="slider_text">
					<li class="on">
						<div>
							<h1>포전매매 전자계약</h1>
							<p>전국 포전 매매(밭떼기 거래) 한 눈에 확인하세요</p>
						</div>
						<div>
							<h5 class="more">
								more info<i class="fas fa-location-arrow"></i>
							</h5>
						</div>
					</li>
					<li>
						<div>
							<h1>비규격품 농산물</h1>
							<p>값싸고 질 좋은 비규격품 판매 및 구매하세요</p>
						</div>
						<div>
							<h5 class="more">
								more info<i class="fas fa-location-arrow"></i>
							</h5>
						</div>
					</li>
					<li>
						<div>
							<h1>농산물 크라우드 펀딩</h1>
							<p>모두 즐겁게 참여하는 크라우드펀딩</p>
						</div>
						<div>
							<h5 class="more">
								more info<i class="fas fa-location-arrow"></i>
							</h5>
						</div>
					</li>
				</ul>
			</div>
		</article>
		<section>
			<h1 class="price_title">농산물 시세 정보</h1>
			<div class="price_api">
				<div id="json_data" style="display: none;">${sessionScope.json}</div>
				<div class="date">업데이트 날짜 : <span></span></div>
				<table>				
					<thead>
					  <tr>
					    <th>매매분류</th>
					    <th>작물 종류</th>
					    <th>작물명</th>
					    <th>단위</th>
					    <th>시세<br>(당일)</th>
					    <th>시세<br>(1일 전)</th>
					    <th>시세<br>(1개월 전)</th>
					    <th>시세<br>(1년 전)</th>
					  </tr>
					</thead>
					<tbody>
					</tbody>
				</table>
				<div class="search_price"><a onClick="window.open('/price_api','pagename','resizable,height=1000,width=1000'); return false;"
						target="_blank">검색 및 자세한 내용은 이곳을 클릭해서 확인하세요. <i class="fas fa-search"></i></a></div>
				<div class="controll">
					<div class="pre_con">◀</div>
					<div class="player"><i class="fas fa-pause-circle"></i></div>
					<div class="nex_con">▶</div>
				</div>
			</div>
		</section>
		<footer>
			<div>
			<div class="bottom_logo">
				<img src="img/하단로고.png" alt="하단로고">
			</div>
			<div id="service_name_area">
				<a href="#">
					<h2>(팀)CropFit 크롭핏</h2>
				</a>
				<ul>
					<li>회사소개 : 테스트데이터</li>
					<li>개인정보보호정책</li>
					<li>위치 : 한국 폴리텍대학교 대전캠퍼스</li>
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
	<%-- </c:if> --%>

</body>
</html>