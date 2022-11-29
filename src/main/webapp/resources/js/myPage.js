/**
 *  마이페이지 JS 
 */

$(document).ready(function() {
	$("#InfoChangeRqButton").click(function() {
		const form = infoChange_form;
		form.submit();
	});
	
	
	$(".tab_title li").click(function() {
		var idx = $(this).index();
		$(".tab_title li").removeClass("on");
		$(".tab_title li").eq(idx).addClass("on");
		$(".tab_cont > div").hide();
		$(".tab_cont > div").eq(idx).show();
	});
	// 모달 1 & 2
    $('#popup_open_btn').on('click',function(){
		modal();		
    });
	$("tr").on('click',function(){
		let select = $(this).attr('id')
		modal_select(select);
	})

});

function modal() {

    // 모달 div 뒤에 희끄무레한 레이어
	$('body').append('<div id="black_out"></div>');
	$('#black_out').css({
		'position': 'fixed',
        'left': '0px',
        'top': '0px',
        'width': '100%',
        'height': '100%',
		'z-index': '9999',
        'background': 'rgba(0,0,0,0.4)'
	})
	
	$('#my_modal').css({
		'position': 'fixed',
        'display': 'block',
        'box-shadow': '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',
		'z-index': '10000',
        'top': '50%',
        'left': '50%',
        'transform': 'translate(-50%, -50%)'
	})
	$('.modal_close_btn').on('click',function(){
		$('#black_out').remove();
		$('#my_modal').css('display','none');
	})
    // 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
}
function modal_select(select) {
    // 모달 div 뒤에 희끄무레한 레이어
	$('body').append('<div id="black_out"></div>');
	$('#black_out').css({
		'position': 'fixed',
        'left': '0px',
        'top': '0px',
        'width': '100%',
        'height': '100%',
		'z-index': '9999',
        'background': 'rgba(0,0,0,0.4)'
	})
	$.ajax({
		type: "POST",
	 	url:"/board/myAskItem",
	    data: {board_NO : select},
	    dataType:'json',
		success:function(result){
			console.log(result);
			let html;
			if(result.answer_CONTENT==null)
			html = '<div class="new_modal">'
			+'<a class="modal_close_btn">x</a>'
			+'<div class="title_label">제목'
			+'</div>'
			+'<div class="title cover">'+result.board_TITLE
			+'</div>'
			+'<div class="content_label">내용'
			+'</div>'
			+'<textarea readonly class="content cover">'+result.board_CONTENT
			+'</textarea>'
			+'<div class="answer_label">답변'
			+'</div>'
			+'<textarea readonly class="answer cover">'+'아직 답변이 없습니다.'
			+'</textarea>';
			else
			html = '<div class="new_modal">'
			+'<a class="modal_close_btn">x</a>'
			+'<div class="title_label">제목'
			+'</div>'
			+'<div class="title cover">'+result.board_TITLE
			+'</div>'
			+'<div class="content_label">내용'
			+'</div>'
			+'<textarea readonly class="content cover">'+result.board_CONTENT
			+'</textarea>'
			+'<div class="answer_label">답변'
			+'</div>'
			+'<textarea readonly class="answer cover">'+result.board_CONTENT
			+'</textarea>';
	
			$('body').append(html);
			
			$('.new_modal').css({
				'position': 'fixed',
		        'display': 'block',
				'width': '50%',
				'padding': '90px 60px',
				'border': '1px solid #888',
				'border-radius': '3px',
				'background-color': '#fefefe',
		        'box-shadow': '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',
				'z-index': '10000',
		        'top': '50%',
		        'left': '50%',
		        'transform': 'translate(-50%, -50%)'
			})
			$('.modal_close_btn').css({
				'position':'absolute',
				'top':'0',
				'right':'0',
				'text-align':'right',
				'background':'#ccc',
				'padding':'0 8px',
				'cursor':'pointer'
			})
			
			$('.new_modal>.cover').css({
				'border':'1px solid #999'
			})
			
			$('textarea.cover').css({
				'resize':'none',
				'width':'100%',
				'height':'auto',
				'user-select':'none'
			})
			
			$('.new_modal .modal_close_btn').on('click',function(){
				$('#black_out').remove();
				$('.new_modal').remove();
			})
	     },
	     error : function(result){
			
	     }
	});
    // 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
}
		
	

function sample4_execDaumPostcode() {
	new daum.Postcode(
			{
				oncomplete : function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

					// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var roadAddr = data.roadAddress; // 도로명 주소 변수
					var extraRoadAddr = ''; // 참고 항목 변수

					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraRoadAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraRoadAddr += (extraRoadAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraRoadAddr !== '') {
						extraRoadAddr = ' (' + extraRoadAddr + ')';
					}

					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					document.getElementById('user_ADDRESS').value = data.zonecode
							+ ' ' + roadAddr + data.jibunAddress;

					// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
					if (roadAddr !== '') {
						document.getElementById("user_ADDRESS").value = data.zonecode
								+ ' '
								+ roadAddr
								+ data.jibunAddress
								+ extraRoadAddr;
					} else {
						document.getElementById("user_ADDRESS").value = data.zonecode
								+ ' ' + roadAddr + data.jibunAddress;
					}
				}
			}).open();
}
	
	