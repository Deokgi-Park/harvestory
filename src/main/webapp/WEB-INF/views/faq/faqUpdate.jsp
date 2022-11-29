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
				<h1>FAQ 글 수정</h1>
			</header>
			<section>
				<article>
					<div class="board">
						<div class="search"></div>
						<form method="post">
							<input type="hidden" name="board_NO" value="${updateFaqInfo.board_NO }"> 
							<input type="text" name="board_TITLE" placeholder="제목" value="${updateFaqInfo.board_TITLE }"> 
							<input type="hidden" name="user_ID" value="${sessionScope.loginMember.user_ID }">
							<textarea id="summernote" name="board_CONTENT">${updateFaqInfo.board_CONTENT }</textarea>
							<script>
                                  $('#summernote').summernote({
                                    placeholder: 'Record',
                                    tabsize: 1,
                                    height: 500,
                                    toolbar: [
                                    ['style', ['style']],
                                    ['font', ['bold', 'underline', 'clear']],
                                    ['color', ['color']],
                                    ['para', ['ul', 'ol', 'paragraph']],
                                    ['table', ['table']],
                                    ['insert', ['link', 'picture', 'video']],
                                    ['view', ['fullscreen', 'codeview', 'help']]
                                  ],
                                  fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
                                  fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
                                  });
                
                                  var backCss = {};
                                  backCss.backgroundColor = white;
                                  $('#summernote').css(backCss);
                                  
                                  function uploadSummernoteImageFile(file, editor) {
                                      data = new FormData();
                                      data.append("file", file);
                                      $.ajax({
                                          data : data,
                                          type : "POST",
                                          url : "/uploadSummernoteImageFile",
                                          contentType : false,
                                          processData : false,
                                          success : function(data) {
                                              //항상 업로드된 파일의 url이 있어야 한다.
                                              $(editor).summernote('insertImage', data.url);
                                          }
                                      });
                                  }
                         </script>
							<input type="submit">
						</form>
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