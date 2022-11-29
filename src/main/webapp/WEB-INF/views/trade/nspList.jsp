<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
 <!DOCTYPE html>
 <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Harvestory :: 누구나 참여하는 농산물 플랫폼</title>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
        <link rel="stylesheet" href="/resources/css/trade.css">
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
                    <h1>비규격품 납품/구매</h1>
                </header>
                <section>
                    <article>
                        <div class="search">
                            <form method="get" action="nspList">
								<div class="search_position">
									<input type="text" name="searchValue" placeholder="원하는 키워드를 검색해주세요">
									<button>
										<i class="fas fa-search"></i>
									</button>
								</div>
							</form>
                        </div>
                        <div class="board">
                                <c:if test="${empty nspList }">
									<h5>등록된 게시글이 없습니다.</h5>
								</c:if>
                                <c:if test="${!empty nspList }">
                                    <c:forEach var="nsp" items="${nspList}">
			                            <div class="con1">
			                                	<a href="nspDetail?trade_NO=${nsp.trade_NO}">
			                                		<img src="/resources/uploadThumbnail/${nsp.img_CHNG_NM}" alt="사진"></a>
			                                	<p> 
			                                	 <fmt:formatDate var="productDate" pattern="yyyy-MM-dd HH:MM" value="${nsp.product_DATE }" />
															<c:out value="${productDate}" />
			                                	 </p>
			                               		<p>${nsp.product_TITLE }</p>
			                            </div>
                                    </c:forEach>
                                </c:if>
                         
                            <div class="">
                                <a href="nspWrite">글쓰기</a>
                            </div>
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
                <h4><a href="#">^</a></h4>
            </div> 
           </div>
    </body>
</html>