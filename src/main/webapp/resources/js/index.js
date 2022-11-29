$(document).ready(function(){
    let select_number
    $('.article_selecter>li').on("click",function(){
        select_number = $(this).index();
        
        $('.article_selecter>li').removeClass("active");
        $(this).addClass("active");

        $(".slider>li.on").removeClass("on")
        $(".slider>li").eq(select_number).addClass("on")
        
        $(".slider_text>li").removeClass("on")
        $(".slider_text>li").eq(select_number).addClass("on")
        
        $(".nav_name").removeClass("on")
        $(".nav_name").eq(select_number).addClass("on")
    })
    $('.left').on("click",function(){
        $('.slider>.on').stop().animate({'margin-left':'100%'},150,function(){
            $('.slider>.on>ul').last().prependTo('.slider>.on');
            $('.slider>.on').css({'margin-left':'0%'});
        });
    });
    $('.right').on('click',function(){
        $('.slider>.on').stop().animate({'margin-left':'-100%'},150,function(){
            $('.slider>.on>ul').first().appendTo('.slider>.on');
            $('.slider>.on').css({'margin-left':'0%'});
        });
    });

    let signup_now=0;
// 로그인 버튼 이후 동작
    $(".login_menu>li>.login").on('click',function(){
        if(signup_now==1){
            $('.header_container2').stop().animate({'top':'900px'},1000,function(){
                $('.header_container1').css({'position':'releative'})
            })
            $('.header_container1').stop().animate({'left':'0'},1000,function(){           
                $('.header_container1').stop().animate({'width':'100%','top':'0'},1000,function(){
                    $('.header_content').stop().animate({'padding':'140px 5%'},1000,function(){
                        $('.login_form').stop().animate({'top':'-300px'},1000,function(){
                        });
                    });
                });
            });
        }
        else{
            $('.how_to_use, .search').stop().animate({'bottom':'-500px'},1000,function(){
                $('.login_form').stop().animate({'top':'-300px'},1000,function(){
                });
            });
        }
    });

    $(".login_form>.login_api>.re").on('click',function(){
        $('.login_form').stop().animate({'top':'0px'},1000,function(){
            $('.how_to_use, .search').stop().animate({'bottom':'0px'},1000,function(){
            });
        });
    });
// 회원가입 버튼 이후 동작
    $(".login_menu>li>.signup").on('click',function(){
        signup_now=1;
        $('.header_container1').css({'position':'absolute'})
        $('.how_to_use, .search').stop().animate({'bottom':'-500px'},1000,function(){
            $('.header_container1').stop().animate({'width':'485px','top':'260px'},1000,function(){
                $('.header_container1').stop().animate({'left':'1065px'},1000,function(){           
                    $('.header_container2').stop().animate({'top':'0px'},1000,function(){
                    });      
                });
            });
            $('.header_content').stop().animate({'padding':'5px 5%'},1000,function(){
            });
        });
        $('.login_form').stop().animate({'top':'0px'},1000,function(){
        });
    });

    $(".signup_form>.re").on('click',function(){
        signup_now=0;
        $('.header_container2').stop().animate({'top':'900px'},1000,function(){
            $('.header_container1').css({'position':'releative'})
        })
        $('.header_container1').stop().animate({'left':'0'},1000,function(){           
            $('.header_container1').stop().animate({'width':'100%','top':'0'},1000,function(){
                $('.header_content').stop().animate({'padding':'140px 5%'},1000,function(){
                    $('.how_to_use, .search').stop().animate({'bottom':'0px'},1000,function(){
                    });
                });
            });
        });
    });
    // 페럴렉스 스크롤링  
    let position;
    if($(this).scrollTop()==0){
        position=0;
        $('#btn1>li').removeClass('on')
        $('#btn1>li').eq(position).addClass('on')
    }
    else if($(this).scrollTop()>=$('section').offset().top){
        position=2;
        $('#btn1>li').removeClass('on')
        $('#btn1>li').eq(position).addClass('on')
    }
    else{
        position=1;
        $('#btn1>li').removeClass('on')
        $('#btn1>li').eq(position).addClass('on')
    }
    $('#btn1>li').click(function(){
        position = $(this).index()
        $('#btn1>li').removeClass('on')
        $(this).addClass('on')
        let offset;
        if(position==0){
            offset = $('header').offset().top; //선택한 태그의 위치를 반환
        }
        else if(position==1){
            offset = $('article').offset().top; //선택한 태그의 위치를 반환
        }
        else{
            offset = $('section').offset().top; //선택한 태그의 위치를 반환
        }
        $('html').stop().animate({scrollTop : offset}, 400,function(){
            $('html').clearQueue()
        });
    });
    $('.up>h4>a').click(function(e){
        e.preventDefault();
        $('html').animate({scrollTop : 0}, 400,function(){
            position=0
            $('#btn1>li').removeClass('on')
            $('#btn1>li').eq(position).addClass('on')
            $('html').clearQueue()
        });        
    })
    let  scroll_last=0
    $(window).scroll(function() {
        let header_position = $('header').offset().top
        let article_position = $('article').offset().top
        let section_position = $('section').offset().top
        if($(this).scrollTop()>=scroll_last){          
            if(position==0){
                $('html').animate({scrollTop : header_position}, 400,function(){
                    $('#btn1>li').removeClass('on')
                    $('#btn1>li').eq(position).addClass('on')
                    $('html').clearQueue()
                    position=1
                });
            }
            if(position==1&&$(this).scrollTop()>header_position){
                $('html').animate({scrollTop : article_position}, 400,function(){
                    $('#btn1>li').removeClass('on')
                    $('#btn1>li').eq(position).addClass('on')
                    $('html').clearQueue()
                    position=2
                }); 
            }
            if(position==2&&$(this).scrollTop()>article_position){
                $('html').animate({scrollTop : section_position}, 400,function(){
                    $('#btn1>li').removeClass('on')
                    $('#btn1>li').eq(position).addClass('on')
                    $('html').clearQueue()
                    position=3
                }); 
            }
        }
        else{
            if(position==3&&$(this).scrollTop()<section_position){    
                $('html').animate({scrollTop : article_position}, 400,function(){
                    position=2
                    $('html').clearQueue()
                    $('#btn1>li').removeClass('on')
                    $('#btn1>li').eq(position-1).addClass('on')
                });
            }
            if(position==2&&$(this).scrollTop()<article_position){
                $('html').animate({scrollTop : header_position}, 400,function(){
                    position=1
                    $('html').clearQueue()
                    $('#btn1>li').removeClass('on')
                    $('#btn1>li').eq(position-1).addClass('on')
                }); 
            }
        }
        scroll_last=$(this).scrollTop()
    });
    
    
    
    /* 회원가입 */	
    
    //이메일 중복검사
	$("#USER_EMAIL").keyup(function(){
		
        const inputEmail = $(this).val();
        
        let check=emailCheck(inputEmail);
		$.ajax({
			type: "post",
			url: "idDupCheck",
			data: { user_ID : inputEmail },
			success: function(result) {
				if (result == "dupY" || !(check)) {
					$('#USER_EMAIL').css('border', '1px solid red');
					signUpCheck.USER_EMAIL = false;
				} else {
                    $('#USER_EMAIL').css('border', '1px solid green');
                    signUpCheck.USER_EMAIL = true;
				}
			},
			error: function() {
				alert("AJAX 통신 에러");
			}
		});
	});
	
	// 패스워드 정규표현식 검사 
	$("#USER_PW").keyup(function() {

		const inputPwd = $(this).val();
		
		if (inputPwd.length < 10) {
			$("#USER_PW").css({ "border": "1px solid red" });
			signUpCheck.USER_PW = false;
		} else {
			$("#USER_PW").css({ "border": "1px solid green" });
			signUpCheck.USER_PW = true;
		}

	});
	
	//패스워드 확인 일치 검사 
	$("#USER_PW_CHK, #USER_PW").keyup(function() {
	
		const USER_PW_CHK = $('#USER_PW_CHK').val();
	
		if ($("#USER_PW").val() != USER_PW_CHK) {
			$("#USER_PW_CHK").css({ "border": "1px solid red" });
			signUpCheck.USER_PW_CHK = false;
		} else {
			$("#USER_PW_CHK").css({ "border": "1px solid green" });
			signUpCheck.USER_PW_CHK = true;
		}
	});
	
	$("#USER_NAME").keyup(function() {
	
		const USER_NAME = $(this).val();
	
		if (USER_NAME == null) {
			$("#USER_NAME").css({ "border": "1px solid red" });
			signUpCheck.USER_NAME = false;
		} else {
			$("#USER_NAME").css({ "border": "1px solid green" });
			signUpCheck.USER_NAME = true;
		}
	});
	$('#signInForm>.login_container>button').on('click',function(){	
		$.ajax({
			type: "post",
			url: "login",
			data: {
				user_ID : $('.login_ID').val(),
				user_PW : $('.login_PW').val()
			},
			success: function(result) {
				if(result=='OK'){
					alert("로그인되었습니다.");
					location.reload();
				}
				else{
					alert("로그인실패.");
					
				}
			},
			error: function() {
				alert("AJAX 통신 에러");
			}
		});
	});
	   
	let js_data = JSON.parse($('#json_data').text());
	let date = js_data.condition[0][0]
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
    $('.date>span').text(date)
    move_price(price);
});

function move_price(price){
    let cutter = 0;
    let piece = price.slice(cutter,cutter+6)
    piece.forEach(element => {
        let  product_cls_name = element.product_cls_name;
        let  category_name = element.category_name;
        let  productName = element.productName;
        let  unit = element.unit;
        let  dpr1 = element.dpr1;
        let  dpr2 = element.dpr2;
        let  dpr3 = element.dpr3;
        let  dpr4 = element.dpr4;
        let html = "<tr><td>"+product_cls_name+"</td><td>"+category_name+"</td><td>"+productName+"</td><td>"+unit+"</td><td>"+dpr1+"</td><td>"+dpr2+"</td><td>"+dpr3+"</td><td>"+dpr4+"</td></tr>";
        $('table').children('tbody').append(html)
    });
    const move_a = setInterval(function(){
        if(cutter<138)
        cutter+=6;
        else
        cutter=0;
        piece = price.slice(cutter,cutter+6)
        $('table>tbody>tr').remove()
        let blank = "<tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr>";
        piece.forEach(element => {
            let  product_cls_name = element.product_cls_name;
            let  category_name = element.category_name;
            let  productName = element.productName;
            let  unit = element.unit;
            let  dpr1 = element.dpr1;
            let  dpr2 = element.dpr2;
            let  dpr3 = element.dpr3;
            let  dpr4 = element.dpr4;
            let html = "<tr><td>"+product_cls_name+"</td><td>"+category_name+"</td><td>"+productName+"</td><td>"+unit+"</td><td>"+dpr1+"</td><td>"+dpr2+"</td><td>"+dpr3+"</td><td>"+dpr4+"</td></tr>";
            $('table').children('tbody').append(html)
        });
        if(cutter==138){
            $('table').children('tbody').append(blank)
        }
    },3000);

    let status = 0;
    let move_b;
    $(".player").on('click',function(){
        if(status==0){
            $('.player').html('<i class="far fa-play-circle"></i>')
            status =1;
            clearInterval(move_a)
            clearInterval(move_b)
            console.log('정지');
        }
        else{
            $('.player').html('<i class="fas fa-pause-circle"></i>')
            status = 0;
            move_b = setInterval(function(){
                if(cutter<138)
                cutter+=6;
                else
                cutter=0;
                let piece = price.slice(cutter,cutter+6)
                $('table>tbody>tr').remove()
                let blank = "<tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr>";
                piece.forEach(element => {
                    let  product_cls_name = element.product_cls_name;
                    let  category_name = element.category_name;
                    let  productName = element.productName;
                    let  unit = element.unit;
                    let  dpr1 = element.dpr1;
                    let  dpr2 = element.dpr2;
                    let  dpr3 = element.dpr3;
                    let  dpr4 = element.dpr4;
                    let html = "<tr><td>"+product_cls_name+"</td><td>"+category_name+"</td><td>"+productName+"</td><td>"+unit+"</td><td>"+dpr1+"</td><td>"+dpr2+"</td><td>"+dpr3+"</td><td>"+dpr4+"</td></tr>";
                    $('table').children('tbody').append(html)
                });
                if(cutter==138){
                    $('table').children('tbody').append(blank)
                }
            },3000);
        }
    })
    $('.nex_con').on('click',function(){
        $('.player').html('<i class="far fa-play-circle"></i>')
        status =1;
        clearInterval(move_a)
        clearInterval(move_b)
        if(cutter<138)
            cutter+=6;
        else
            cutter=0;
        let piece = price.slice(cutter,cutter+6)
        $('table>tbody>tr').remove()
        let blank = "<tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr>";
        piece.forEach(element => {
            let  product_cls_name = element.product_cls_name;
            let  category_name = element.category_name;
            let  productName = element.productName;
            let  unit = element.unit;
            let  dpr1 = element.dpr1;
            let  dpr2 = element.dpr2;
            let  dpr3 = element.dpr3;
            let  dpr4 = element.dpr4;
            let html = "<tr><td>"+product_cls_name+"</td><td>"+category_name+"</td><td>"+productName+"</td><td>"+unit+"</td><td>"+dpr1+"</td><td>"+dpr2+"</td><td>"+dpr3+"</td><td>"+dpr4+"</td></tr>";
            $('table').children('tbody').append(html)
        });
        if(cutter==138){
            $('table').children('tbody').append(blank)
        }
    });
    $('.pre_con').on('click',function(){
        $('.player').html('<i class="far fa-play-circle"></i>')
        status =1;
        clearInterval(move_a)
        clearInterval(move_b)
        if(cutter>0)
            cutter-=6;
        else
            cutter=138;
        let piece = price.slice(cutter,cutter+6)
        $('table>tbody>tr').remove()
        let blank = "<tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr>";
        piece.forEach(element => {
            let  product_cls_name = element.product_cls_name;
            let  category_name = element.category_name;
            let  productName = element.productName;
            let  unit = element.unit;
            let  dpr1 = element.dpr1;
            let  dpr2 = element.dpr2;
            let  dpr3 = element.dpr3;
            let  dpr4 = element.dpr4;
            let html = "<tr><td>"+product_cls_name+"</td><td>"+category_name+"</td><td>"+productName+"</td><td>"+unit+"</td><td>"+dpr1+"</td><td>"+dpr2+"</td><td>"+dpr3+"</td><td>"+dpr4+"</td></tr>";
            $('table').children('tbody').append(html)
        });
        if(cutter==138){
            $('table').children('tbody').append(blank)
        }
    });
}

let signUpCheck = {
	USER_EMAIL: false,
	USER_PW: false,
	USER_PW_CHK: false,
	USER_NAME: false
};

function validate() {
    for (let key in signUpCheck) {
        console.log(signUpCheck[key]);
    }

    for (let key in signUpCheck) {
        console.log("signUpCheck 검사 시작");
        if (signUpCheck[key] == false) {
            let id = "#" + key;
            $(id).focus();
        	if(key=="USER_EMAIL"){
                if(emailCheck($('#USER_EMAIL').val())){
                    key="이미 가입된 이메일입니다. 이메일"
                }
                else{
                    key="이메일 형식"
                }
        	}else if(key=="USER_PW"){
        		key="패스워드는 10자리 이상입니다. 패스워드"
        	}else if(key=="USER_PW_CHK"){
        		key="패스워드 재확인"
        	}else{
        		key="이름"
        	}
            alert(key+"를(을) 재확인하세요.");
            return;
        }
    }
    console.log("signUpForm submit 실행");
    submit();
    $(".signup_go").attr('disabled','disabled');
}

// 이메일 정규식 확인
let regExp = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;

function emailCheck(email){
    if (email.match(regExp) != null){
        return true
    } else {
        return false
    }
}

function submit() {
    const form = $('.signup_form');
    form.submit();
} // 회원가입 완료
    