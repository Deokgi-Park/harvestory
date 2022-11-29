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
					<li><a href="communityList">소통마당</a></li>
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
					<li> <h3>소통마당</h3> </li>
					<li><a href="communityList">자유게시판</a></li>
					<li><a href="faqList">FAQ</a></li>
				</ul>
			</aside>
			<header>
				<h1>FAQ</h1>
			</header>
			<section>
				<article>
					<form method="get" action="faqList">
						<div class="search">
							<input type="text" name="searchValue" placeholder="원하는 키워드를 검색해주세요">
							<button>
								<i class="fas fa-search"></i>
							</button>
						</div>
					</form>
					<div class="board">
						<c:if test="${sessionScope.loginMember.user_EMAIL == 'harvestory.info@gmail.com'}">
							<a href="faqWrite">글 등록</a>
						</c:if>


						<c:if test="${empty faqList}">
							<h5>등록 된 FAQ 내역이 없습니다.</h5>
						</c:if>
						<c:if test="${!empty faqList }">
							<c:forEach var="faq" items="${faqList }">
								<p>
									<a class="btn btn-primary" data-bs-toggle="collapse"
										href="#collapseExample${faq.board_NO }" role="button"
										aria-expanded="false"
										aria-controls="collapseExample${faq.board_NO }"> <span>
											${faq.board_TITLE }</span>
									</a>
								</p>
								<div class="collapse" id="collapseExample${faq.board_NO }">
									<div class="card card-body">
										<span> 
											<fmt:formatDate var="writeDate" pattern="yyyy-MM-dd" value="${faq.board_DATE }" /> 
											<c:out value="${writeDate}" />
										</span> 
										<span> ${faq.board_CONTENT }</span>
										<c:if test="${sessionScope.loginMember.user_EMAIL == 'harvestory.info@gmail.com'}">
											<a href="faqDelete?board_NO=${faq.board_NO }">삭제</a>
											<a href="faqUpdate?board_NO=${faq.board_NO }">수정</a>
										</c:if>
									</div>
								</div>
							</c:forEach>
						</c:if>
					</div>
					
					<div class="pager">
						<ul class="pagination pagination-sm justify-content-center">
							<li class="page-item">
								<a href="?page=1&${pager.query }" class="page-link">처음</a> &nbsp;
							</li>

							<c:forEach var="page" items="${pager.list }">
								<li id="paginationBar" class="${page == pager.page ? 'active' : '' } page-item">
									<a href="?page=${page}&${pager.query }" class="page-link">${page}</a>
								</li>
							</c:forEach>


							<li class="page-item">
								<a href="?page=${pager.next}&${pager.query }" class="page-link">다음</a></li>
							<li class="page-item">
								<a href="?page=${pager.last}&${pager.query }" class="page-link">마지막</a> &nbsp;
							</li>
						</ul>
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