<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
<link rel="stylesheet" href="/resources/css/index.css">
<link rel="stylesheet" href="/resources/css/faq.css">
<script src="/resources/js/faq.js"></script>
<script src="/resources/js/index.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
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
                        <li> <h3>비규격품 납품/구매</h3> </li>
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
						<h1><a href="#">구매하기</a></h1>
						<br>
						<div>
							<a href="nspDelete?trade_NO=${nspDetailItem.trade_NO }">삭제</a>
							<a href="nspUpdate?trade_NO=${nspDetailItem.trade_NO }">수정</a>
							<a href="nspReport?trade_NO=${nspDetailItem.trade_NO }">신고하기</a>
							<p>제목 : ${nspDetailItem.product_TITLE }</p>
							<p>작성자 : ${nspDetailItem.user_NAME}</p>
							<p>가격 : ${nspDetailItem.product_PRICE } </p>
							<p> 
							 <c:forEach var="nsp" items="${nspDetailImages}">
			                        <img src="/resources/uploadThumbnail/${nsp.img_CHNG_NM}">
                                </c:forEach> 
							</p>
							<p>  작성일자 :  <fmt:formatDate var="productDate" pattern="yyyy-MM-dd HH:MM" value="${nspDetailItem.product_DATE }" />
								<c:out value="${productDate}" />
							</p>
							<p> ${nspDetailItem.product_CONTENT } </p>
						</div>
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