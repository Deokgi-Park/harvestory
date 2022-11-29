<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>농산물 시세 정보</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
<style type="text/css">
table{
    margin: 0 auto;
    width: 90%;
    font-size: 15px;
}
th, td{
	display:inline-block;
	width:12.5%;
	height: 50px;
	line-height: 50px;
	border: 1px solid #ccc;
	box-sizing: border-box;
	overflow:hidden; 
	text-overflow:ellipsis; 
	white-space:nowrap;
	font-size: 15px;
}
td{
	padding: 0 20px;
}
.arrow_box {
  display: none;
  position: absolute;
  padding: 8px 15px;
  border-radius: 8px;
  background: #333;
  color: #fff;
  font-size: 14px;
}

.arrow_box:after {
  position: absolute;
  bottom: 100%;
  left: 50%;
  width: 0;
  height: 0;
  margin-left: -10px;
  border: solid transparent;
  border-color: rgba(51, 51, 51, 0);
  border-bottom-color: #333;
  border-width: 10px;
  pointer-events: none;
  content: " ";
}
td:hover>p.arrow_box {
  display: block;
}

th{
	height: 80px;
    background: rgba(140, 153, 24, 0.6);
	line-height: 80px;
}
td:nth-of-type(odd){
    background: rgba(239, 255, 92, 0.4);
}
td:nth-of-type(even){
    background: rgba(213, 230, 60, 0.6);
}
.price_title{
    text-align: center;
    padding: 60px;
    box-sizing: border-box;
    font-size: 4em;
}
.date{
	text-align: right;
    margin: 0 5%;
    font-weight: bold;
    font-size: 1.4em;
}
.search{
    position: relative;
    color: black;
    height: 100px;
}
.search_position{
    position: relative;
    width: 50%;
    left: 50%;
    transform: translateX(-50%);
}
.search_position>input{
    width: 100%;
    border:0;
    border-bottom:2px solid black;
    background: rgba(0, 0, 0, 0);
    text-align: center;
    margin: 0 auto;
    padding: 4px 30px 1px;
    box-sizing: border-box;
    font-size: 20px;
    color: black;
}
.search_position>input::placeholder{
    color: olive;
    font-style: italic; 
}
.search_position>button{
    position: absolute;
    width: 30px;
    height: 30px;
    background: rgba(0, 0, 0, 0);
    border: 0;
    right: 0;
    box-sizing: border-box;
    cursor: pointer;
    text-align: center;
    margin: 2px 0 0 0;
    color: black;
}
.search_position>button>i{
    padding: 2px;
    font-size: 20px;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
    let js_data = JSON.parse($('#json_data').text());
    let date = js_data.condition[0][0];
    let price_arr = js_data.price;
    let price = price_arr.sort(function(a, b){
        if(a.productName==b.productName){
            return 0;
        }
        if(a.productName!=b.productName&&a.productName>b.productName){
            return 1;
        }
        else{
            return -1;
        }
    });
    $('.date>span').text(date);
    price.forEach(element => {
        let  product_cls_name = element.product_cls_name;
        let  category_name = element.category_name;
        let  productName = element.productName;
        let  unit = element.unit;
        let  dpr1 = element.dpr1;
        let  dpr2 = element.dpr2;
        let  dpr3 = element.dpr3;
        let  dpr4 = element.dpr4;
        let html = "<tr><td>"+product_cls_name+"<p class='arrow_box'>"+product_cls_name+"</p></td><td>"
        +category_name+"<p class='arrow_box'>"+category_name+"</p></td><td>"
        +productName+"<p class='arrow_box'>"+productName+"</p></td><td>"
        +unit+"<p class='arrow_box'>"+unit+"</p></td><td>"
        +dpr1+"<p class='arrow_box'>"+dpr1+"</p></td><td>"
        +dpr2+"<p class='arrow_box'>"+dpr2+"</p></td><td>"
        +dpr3+"<p class='arrow_box'>"+dpr3+"</p></td><td>"
        +dpr4+"<p class='arrow_box'>"+dpr4+"</p></td></tr>";
        $('table').children('tbody').append(html);
    });
    
	let checker = 0;
    $('input').on('keyup',function(){
    	let search = $('input').val();
    	$('table>tbody>tr').remove();
   	 	price.forEach(element => {
   	        let  product_cls_name = element.product_cls_name;
   	        let  category_name = element.category_name;
   	        let  productName = element.productName;
   	        let  unit = element.unit;
   	        let  dpr1 = element.dpr1;
   	        let  dpr2 = element.dpr2;
   	        let  dpr3 = element.dpr3;
   	        let  dpr4 = element.dpr4;
   	        let html = "<tr><td>"+product_cls_name+"<p class='arrow_box'>"+product_cls_name+"</p></td><td>"
   	        +category_name+"<p class='arrow_box'>"+category_name+"</p></td><td>"
   	        +productName+"<p class='arrow_box'>"+productName+"</p></td><td>"
   	        +unit+"<p class='arrow_box'>"+unit+"</p></td><td>"
   	        +dpr1+"<p class='arrow_box'>"+dpr1+"</p></td><td>"
   	        +dpr2+"<p class='arrow_box'>"+dpr2+"</p></td><td>"
   	        +dpr3+"<p class='arrow_box'>"+dpr3+"</p></td><td>"
   	        +dpr4+"<p class='arrow_box'>"+dpr4+"</p></td></tr>";
   	        if(element.productName.indexOf(search)>-1)
   	        	$('table').children('tbody').append(html);
   	        else if(element.productName.indexOf(search)==-1){
				checker+=1;
   	        }
   	    });
   	 	console.log(checker);
		if(checker==price.length){
 			$('table').children('tbody').append('<tr><td class="no-data" colspan="8">등록된 작물이 없습니다.</td></tr>');
 			$('.no-data').css({'display':'table-cell','text-align':'center'})
        }
		checker=0;
    })
});
</script>
</head>
<body>
	<div class="price_api">
	    <h1 class="price_title">농산물 시세 정보</h1>
		<div id="json_data" style="display: none;">${sessionScope.json}</div>
	    <div class="search_position">
        	<input type="text" placeholder="작물명을 입력해주세요">
    	    <button>
            	<i class="fas fa-search"></i>
        	</button>
    	</div>
		<div class="date">업데이트 날짜 : <span></span></div>
		<table>				
			<thead>
			  <tr>
			    <th>매매분류</th>
			    <th>작물 종류</th>
			    <th>작물명</th>
			    <th>단위</th>
			    <th>시세 (당일)</th>
			    <th>시세 (1일 전)</th>
			    <th>시세 (1개월 전)</th>
			    <th>시세 (1년 전)</th>
			  </tr>
			</thead>
			<tbody>
			</tbody>
		</table>
	</div>
</body>
</html>