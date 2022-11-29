<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
	integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf"
	crossorigin="anonymous">
<link rel="stylesheet" href="/resources/css/index.css">
<link rel="stylesheet" href="/resources/css/faq.css">
<script src="/resources/js/faq.js"></script>
<script src="/resources/js/index.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
</head>
<body>
	<div id="index_cover">
		<nav>
			<div class="underline">
				<div class="m_logo">
					<a href="/"><img src="/resources/images/logo_test.png" alt="하베스토리_로고"></a>
				</div>
				<ul class="login_info">
					<li><a href="tradeList">포전매매 전자계약</a></li>
					<li><a href="nspList">비규격품 납품/구매</a></li>
					<li><a href="">농산물 크라우드 펀딩</a></li>
					<li><a href="/board/communityList">소통마당</a></li>
					<li><a href="/myPage">마이페이지</a></li>
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
						<h3>비규격품 납품/구매</h3>
					</li>
					<li><a href="nspList">거래 목록</a></li>
					<li><a href="nspMyList">나의 거래 현황</a></li>
				</ul>
			</aside>
			<header>
				<h1>비규격품 납품/구매 상세</h1>
			</header>
			<section>
				<article>
					<div class="board">

						<div class="search"></div>
						<div>
							<input type="hidden" name="trade_NO" value="${tradeDetail.trade_NO}">
							<p>제목 : ${tradeDetail.product_TITLE }</p>
							<div>
								
								 <c:forEach var="tradeDetail" items="${tradeDetailImage}">
			                        <img src="/resources/uploadThumbnail/${tradeDetail.img_CHNG_NM}">
                                </c:forEach> 
								
								
								 
							</div>
							<p>작성자 : ${tradeDetail.user_NAME}</p>
							<p>작성일자 : ${tradeDetail.product_DATE }</p>
							<p>${tradeDetail.product_CONTENT }</p>
						</div>
						<a href="tradeDelete?trade_NO=${tradeDetail.trade_NO }">삭제</a> <a
							href="tradeUpdate?trade_NO=${tradeDetail.trade_NO }">수정</a>

						<section class="Detail__Others">
							<div class="Detail__OthersContainer">
								<h3 class="Others__Title korean__heading">다른 상품도 보러 가기</h3>
								<div class="Others__Cards rowFlex">
									<c:if test="${otherTrade.isEmpty()}">
										<span>&nbsp;</span>
									</c:if>
									<c:forEach var="others" items="${otherTrade}">
										<a href="/trade/tradeDetail/${otherTrade.trade_NO}?user_NAME=${otherTrade.user_NAME}&user_ID=${otherTrade.user_ID}">
											<div>${otherTrade.PRODUCT_TITLE}</div>
											<div>${otherTrade.PRODUCT_PRICE}&nbsp;원</div>
										</a>
									</c:forEach>
								</div>
							</div>
						</section>





					</div>
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