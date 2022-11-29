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
<link rel="stylesheet" href="/resources/css/faq.css">
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

<style>
        .upload-btn-wrapper {
            position: relative;
            overflow: hidden;
            display: inline-block;
        }
        
        .upload-btn {
            border: 2px solid gray;
            color: gray;
            background-color: white;
            padding: 8px 20px;
            border-radius: 8px;
            font-size: 20px;
            font-weight: bold;
        }
        
        .upload-btn-wrapper input[type=file] {
            font-size: 100px;
            position: absolute;
            left: 0;
            top: 0;
            opacity: 0;
        }
        
        #fileDragDesc {
            width: 100%; 
            height: 100%; 
            margin-left: auto; 
            margin-right: auto; 
            padding: 5px; 
            text-align: center; 
            line-height: 300px; 
            vertical-align:middle;
        }
    </style>
    
    <script>
    $(document).ready(function() {
        $("#input_file").bind('change', function() {
            selectFile(this.files);
            
            //this.files[0].size gets the size of your file.
            //alert(this.files[0].size);
        });
    });

    // 파일 리스트 번호
    var fileIndex = 0;
    // 등록할 전체 파일 사이즈
    var totalFileSize = 0;
    // 파일 리스트
    var fileList = new Array();
    // 파일 사이즈 리스트
    var fileSizeList = new Array();
    // 등록 가능한 파일 사이즈 MB
    var uploadSize = 50;
    // 등록 가능한 총 파일 사이즈 MB
    var maxUploadSize = 500;

    $(function() {
        // 파일 드롭 다운
        fileDropDown();
    });

    // 파일 드롭 다운
    function fileDropDown() {
        var dropZone = $(".dropZone");
        //Drag기능 
        dropZone.on('dragenter', function(e) {
            e.stopPropagation();
            e.preventDefault();
            // 드롭다운 영역 css
            dropZone.css('background-color', '#E3F2FC');
        });
        dropZone.on('dragleave', function(e) {
            e.stopPropagation();
            e.preventDefault();
            // 드롭다운 영역 css
            dropZone.css('background-color', '#FFFFFF');
        });
        dropZone.on('dragover', function(e) {
            e.stopPropagation();
            e.preventDefault();
            // 드롭다운 영역 css
            dropZone.css('background-color', '#E3F2FC');
        });
        dropZone.on('drop', function(e) {
            e.preventDefault();
            // 드롭다운 영역 css
            dropZone.css('background-color', '#FFFFFF');

            var files = e.originalEvent.dataTransfer.files;
            if (files != null) {
                if (files.length < 1) {
                    /* alert("폴더 업로드 불가"); */
                    console.log("폴더 업로드 불가");
                    return;
                } else {
                    selectFile(files)
                }
            } else {
                alert("ERROR");
            }
        });
    }
    // 파일 선택시
    function selectFile(fileObject) {
        var files = null;

        if (fileObject != null) {
            // 파일 Drag 이용하여 등록시
            files = fileObject;
        } else {
            // 직접 파일 등록시
            files = $('#multipaartFileList_' + fileIndex)[0].files;
        }

        // 다중파일 등록
        if (files != null) {
            
            if (files != null && files.length > 0) {
                $("#fileDragDesc").hide(); 
                $("fileListTable").show();
            } else {
                $("#fileDragDesc").show(); 
                $("fileListTable").hide();
            }
            
            for (var i = 0; i < files.length; i++) {
                // 파일 이름
                var fileName = files[i].name;
                var fileNameArr = fileName.split("\.");
                // 확장자
                var ext = fileNameArr[fileNameArr.length - 1];
                               
                var fileSize = files[i].size; // 파일 사이즈(단위 :byte)
                console.log("fileSize="+fileSize);
                if (fileSize <= 0) {
                    console.log("0kb file return");
                    return;
                }
                
                var fileSizeKb = fileSize / 1024; // 파일 사이즈(단위 :kb)
                var fileSizeMb = fileSizeKb / 1024;    // 파일 사이즈(단위 :Mb)
                
                var fileSizeStr = "";
                if ((1024*1024) <= fileSize) {    // 파일 용량이 1메가 이상인 경우 
                    console.log("fileSizeMb="+fileSizeMb.toFixed(2));
                    fileSizeStr = fileSizeMb.toFixed(2) + " Mb";
                } else if ((1024) <= fileSize) {
                    console.log("fileSizeKb="+parseInt(fileSizeKb));
                    fileSizeStr = parseInt(fileSizeKb) + " kb";
                } else {
                    console.log("fileSize="+parseInt(fileSize));
                    fileSizeStr = parseInt(fileSize) + " byte";
                }

                /* if ($.inArray(ext, [ 'exe', 'bat', 'sh', 'java', 'jsp', 'html', 'js', 'css', 'xml' ]) >= 0) {
                    // 확장자 체크
                    alert("등록 불가 확장자");
                    break; */
                if ($.inArray(ext, ['png', 'jpg', 'jpeg', 'gif', 'PNG', 'JPG', 'JPEG', 'GIF']) < 0) {
                	// 확장자 체크
                    alert("등록이 불가능한 파일 입니다.("+fileName+")");
                    break;
                } else if (fileSizeMb > uploadSize) {
                    // 파일 사이즈 체크
                    alert("용량 초과\n업로드 가능 용량 : " + uploadSize + " MB");
                    break;
                } else {
                    // 전체 파일 사이즈
                    totalFileSize += fileSizeMb;

                    // 파일 배열에 넣기
                    fileList[fileIndex] = files[i];

                    // 파일 사이즈 배열에 넣기
                    fileSizeList[fileIndex] = fileSizeMb;

                    // 업로드 파일 목록 생성
                    addFileList(fileIndex, fileName, fileSizeStr);

                    // 파일 번호 증가
                    fileIndex++;
                }
            }
        } else {
            alert("ERROR");
        }
    }

    // 업로드 파일 목록 생성
    function addFileList(fIndex, fileName, fileSizeStr) {
        /* if (fileSize.match("^0")) {
            alert("start 0");
        } */

        var html = "";
        html += "<tr id='fileTr_" + fIndex + "'>";
        html += "    <td class='left dropZone' >";
        html += fileName + " (" + fileSizeStr +") " 
                //+ "<a href='#' onclick='deleteFile(" + fIndex + "); return false;' class='btn small bg_02'> 삭제</a>"
                
                + "<input value='삭제' type='button' href='#' onclick='deleteFile(" + fIndex + "); return false;'>"
        html += "    </td>"
        html += "</tr>"

        $('#fileTableTbody').append(html);
    }

    // 업로드 파일 삭제
    function deleteFile(fIndex) {
        console.log("deleteFile.fIndex=" + fIndex);
        // 전체 파일 사이즈 수정
        totalFileSize -= fileSizeList[fIndex];

        // 파일 배열에서 삭제
        delete fileList[fIndex];

        // 파일 사이즈 배열 삭제
        delete fileSizeList[fIndex];

        // 업로드 파일 테이블 목록에서 삭제
        $("#fileTr_" + fIndex).remove();
        
        console.log("totalFileSize="+totalFileSize);
        
        if (totalFileSize > 0) {
            $("#fileDragDesc").hide(); 
            $("fileListTable").show();
        } else {
            $("#fileDragDesc").show(); 
            $("fileListTable").hide();
        }
    }

    // 파일 등록
    function uploadFile() {
        // 등록할 파일 리스트
        var uploadFileList = Object.keys(fileList);

        // 파일이 있는지 체크
        if (uploadFileList.length == 0) {
            // 파일등록 경고창
            alert("파일이 없습니다.");
            return;
        }

        // 용량을 500MB를 넘을 경우 업로드 불가
        if (totalFileSize > maxUploadSize) {
            // 파일 사이즈 초과 경고창
            alert("총 용량 초과\n총 업로드 가능 용량 : " + maxUploadSize + " MB");
            return;
        }

        if (confirm("등록 하시겠습니까?")) {
            // 등록할 파일 리스트를 formData로 데이터 입력
            var form = document.getElementById('uploadForm');
            var formData = new FormData(form);
            for (var i = 0; i < uploadFileList.length; i++) {
              	  formData.append('files', fileList[uploadFileList[i]]);
	           }

            $.ajax({
                url : "nspWrite",
                data : formData,
                type : 'POST',
                enctype : 'multipart/form-data',
                processData : false,
                contentType : false,
                dataType : 'json',
                cache : false,
                success : function() {
                   location.replace('/trade/nspList'); 
                }, 
                error : function() {
                	location.replace('/trade/nspList'); 	
                }
         	  });
	        }
 	   }
</script>
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
				<h1>비규격품 납품/구매</h1>
			</header>
			<section>
				<article>
					<div class="search"></div>
					<div class="board">
						<form method="post" enctype="multipart/form-data" action="nspWrite" id="uploadForm">
							<input type="text" name="product_TITLE" placeholder="제목">
							<input type="hidden" name="user_ID" value="${sessionScope.loginMember.user_ID }"> 
							<!-- <input type="file" name="Image" multiple /> -->
							 <div class="upload-btn-wrapper">
					            <input type="file" id="input_file" name="Image" multiple="multiple" style="height: 100%;" />
					            <button class="upload-btn">파일선택</button>
					        </div>
					        <br />
							<div class="dropZone" style="width: 500px; height: 300px; border-style: solid; border-color: black; ">
				                <div id="fileDragDesc"> 파일을 드래그 해주세요. </div>
				            
				                <table id="fileListTable" width="100%" border="0px">
				                    <tbody id="fileTableTbody">
				    
				                    </tbody>
				                </table>
			            	</div>
							<input type="text" name="product_PRICE" placeholder="가격">
							<textarea id="summernote" name="product_CONTENT"></textarea>
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
                                    ['insert', ['link']],
                                    ['view', ['fullscreen', 'codeview', 'help']]
                                  ],
                                  fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
                                    fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
                                  });
                
                                  var backCss = {};
                                  backCss.backgroundColor = 'white';
                                  $('#summernote').css(backCss);
                                  
                         </script>
						</form>
							<input type="button" onclick="uploadFile(); return false;" class="btn bg_01" value="등록">
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