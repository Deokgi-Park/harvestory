<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>상품 수정 글쓰기</h1>
<form method="post" enctype="multipart/form-data">
   <input type="hidden" name="user_ID" value="${sessionScope.loginMember.user_ID}" />
   <input type="hidden" name="trade_NO" value="${tradeUpdateItem.trade_NO}">
      <input type="radio" name="product_KIND" value="1">진행 중 
                     &nbsp; / &nbsp;
       <input type="radio" name="product_KIND" value="2">진행 완료
   <input type="file" name="Thumbnail"/>
   <input type="text" name="product_TITLE" placeholder="제목"/>
   <input type="text" name="product_CONTENT" placeholder="내용"/>
   <input type="number" name="product_PRICE" placeholder="₩ 가격" 
               class="Upload__Input" id="Input__Price" />

               
            <button class="Upload__UploadButton">
            <span>등록</span>
         </button>   
</form>
</body>
</html>