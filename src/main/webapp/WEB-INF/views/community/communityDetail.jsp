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
<link rel="stylesheet" href="/resources/css/community.css">
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
				<h1>자유게시판 글 상세</h1>
			</header>
			<section>
				<article>
					<div class="board">

						<div class="search"></div>

						<div>
							<input type="hidden" name="board_NO" value="${communityDetail.board_NO }">
							<p>제목 : ${communityDetail.board_TITLE }</p>
							<p>작성자 : ${communityDetail.user_NAME}</p>
							<p> 작성일자 : <fmt:formatDate var="boardDate" pattern="yyyy-MM-dd HH:MM" value="${communityDetail.board_DATE }" />
										<c:out value="${boardDate}" />
							</p>
							<p>${communityDetail.board_CONTENT }</p>
						</div>
						
						<a href="communityDelete?board_NO=${communityDetail.board_NO }">삭제</a>
						<a href="communityUpdate?board_NO=${communityDetail.board_NO }">수정</a>
						<a href="communityReport?board_NO=${communityDetail.board_NO }">신고하기</a>

						<!-- Button trigger modal -->
						<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal"> 쪽지보내기</button>

						<!-- Modal -->
						<div class="modal fade" id="exampleModal" tabindex="-1"
							aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">새로운 메세지 작성</h5>
										<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">
										<form method="post" action="/message/sendMessage" id="sendMsg_Form">
											<div class="mb-3">
												<input type="hidden" name="board_NO" value="${communityDetail.board_NO }"> 
												<input type="text" name="msg_WITH_NAME" value="${communityDetail.user_NAME }" readonly> 
												<input type="hidden" name="msg_WITH" value="${communityDetail.user_ID }"> 
												<span>님께 쪽지</span>
											</div>
											<div class="mb-3">
												<label for="message-text" class="col-form-label">내용:</label>
												<textarea class="form-control" name="msg_CONTENT"></textarea>
												<input type="hidden" name="user_ID" value="${sessionScope.loginMember.user_ID }"> 
												<input type="hidden" name="user_NAME" value="${sessionScope.loginMember.user_NAME }">
											</div>
										</form>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
										<button type="button" class="btn btn-primary sendMsgButton">전송</button>
									</div>
								</div>
							</div>
						</div>

						<p>Comment</p>
						<div id="commentList">
							<c:if test="${empty communityReplyList }">
								<p>아직 등록 된 댓글이 없습니다.</p>
							</c:if>
							<c:if test="${!empty communityReplyList }">
								<c:forEach items="${communityReplyList }" var="reply">
									<div>
									<p class="commentNo" style="display: none;">${reply.reply_NO }</p>
									<p class="commentWriter">${reply.user_NAME }</p>
									<p class="commentDate">
										<fmt:formatDate var="replyDate" pattern="yyyy-MM-dd HH:MM" value="${reply.reply_DATE}" />
										<c:out value="${replyDate}" />
									</p>
									<p class="commentContent">${reply.reply_CONTENT }</p>
									<p class="replyUpdateContent"><input type="text" value="${reply.reply_CONTENT }"><button type="button">확인</button></p>
									<p>
										<a class="replyUpdateButton" href="#">수정</a> 
										/ 
										<a href="communityReplyDelete?reply_NO=${reply.reply_NO }&board_NO=${communityDetail.board_NO}">삭제</a>
									</p>
									</div>
								</c:forEach>
							</c:if>
						</div>

						<form method="post" id="replyWriteForm">
							<input type="hidden" name="reply_WRITER" class="REPLY_WRITER" value="${sessionScope.loginMember.user_ID }"> 
							<input type="hidden" name="board_NO" class="BOARD_NO" value="${communityDetail.board_NO }" readonly> 
							<input type="text" name="reply_CONTENT" class="REPLY_CONTENT">
						</form>
						
						<button class="btn btn-primary" id="replyWirteButton">댓글 등록</button>
						
						<script>
                        $(document).ready(function() {
                            $("#replyWirteButton").click(function (){
                    			
                                let Reply = {
                                        reply_WRITER : $(".REPLY_WRITER").val(),
                                        board_NO : $(".BOARD_NO").val(),
                                        reply_CONTENT : $(".REPLY_CONTENT").val()
                                };
                                        
                                
                                $.ajax({
                                    type: "POST",
                                    url: "communityReplyWrite",
                                    data : JSON.stringify(Reply),
                                    contentType : "application/json",
                                    processData: false,
                                    async: true,
                                    cache: false,
                                    success: function(result){
                                        if(result == 'OK'){
                                            // commentList에 append하기
                                            console.log(result);
                                        } else {
                                            alert('댓글 등록 실패')
                                        }
			                               $.ajax({
			                                   type: "POST",
			                                   url: "communityReplyList",
			                                   data : {board_NO : Reply.board_NO},
			                                   dataType : "json",
			                                   success: function(result){
			                                	   location.reload();
			                                   }
			                               });                 
                                    }
                                });
                                
                                
                            });
                            
	                        $(".replyUpdateButton").click(function (){
	                			$(this).parent().parent().children('.replyUpdateContent').css('display','block')
	                			$(this).parent().parent().children('.commentContent').css('display','none')
	                			$(".replyUpdateContent>button").click(function (){
	                            let Reply = {
	                                    reply_NO : $(this).parent().parent().children('.commentNo').text(),
	                                    reply_CONTENT : $(this).parent().children('input').val()
	                            };
		                            $.ajax({
		                                type: "POST",
		                                url: "communityReplyUpdate",
		                                data : JSON.stringify(Reply),
		                                contentType : "application/json",
		                                success: function(result){
		                                	location.reload();   
		                                }
		                            }); 
	                			});
	                            
	                            
	                        });
                        });
                        </script>


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