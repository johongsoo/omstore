<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="backendweb.z01_vo.*"
    import="backendweb.d01_dao.*"
    import="backweb.a04_database.*" 
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>
<%--


 --%>
<html>
<head>
<meta charset="UTF-8">
<!-- ========================================================================================= -->

<link rel="stylesheet" href="${path}/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${path}/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="${path}/fonts/iconic/css/material-design-iconic-font.min.css">
<link rel="stylesheet" href="${path}/fonts/linearicons-v1.0.0/icon-font.min.css">
<link rel="stylesheet" href="${path}/vendor/animate/animate.css">
<link rel="stylesheet" href="${path}/vendor/css-hamburgers/hamburgers.min.css">
<link rel="stylesheet" href="${path}/vendor/animsition/css/animsition.min.css">
<link rel="stylesheet" href="${path}/vendor/select2/select2.min.css">
<link rel="stylesheet" href="${path}/vendor/daterangepicker/daterangepicker.css">
<link rel="stylesheet" href="${path}/vendor/slick/slick.css">
<link rel="stylesheet" href="${path}/vendor/MagnificPopup/magnific-popup.css">
<link rel="stylesheet" href="${path}/vendor/perfect-scrollbar/perfect-scrollbar.css">
<link rel="stylesheet" href="${path}/css/util.css">
<link rel="stylesheet" href="${path}/css/main.css">
    <link rel="icon" href="${path}/assets/images/favicon.ico" type="image/x-icon">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,800" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${path}/assets/css/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${path}/assets/icon/themify-icons/themify-icons.css">
    <link rel="stylesheet" type="text/css" href="${path}/assets/icon/icofont/css/icofont.css">
    <link rel="stylesheet" type="text/css" href="${path}/assets/css/style.css">
<!-- ========================================================================================= -->
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet" />
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
<link rel="stylesheet" href="${path}/css/login.css">
<style>
</style>
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>

</head>
<body class="fix-menu">
    <!-- Pre-loader start -->
    <div class="theme-loader">
    <div class="ball-scale">
        <div class='contain'>
            <div class="ring"><div class="frame"></div></div>
            <div class="ring"><div class="frame"></div></div>
            <div class="ring"><div class="frame"></div></div>
            <div class="ring"><div class="frame"></div></div>
            <div class="ring"><div class="frame"></div></div>
            <div class="ring"><div class="frame"></div></div>
            <div class="ring"><div class="frame"></div></div>
            <div class="ring"><div class="frame"></div></div>
            <div class="ring"><div class="frame"></div></div>
            <div class="ring"><div class="frame"></div></div>
        </div>
    </div>
</div>
    <!-- Pre-loader end -->

    <section class="login p-fixed d-flex text-center bg-primary common-img-bg">
        <!-- Container-fluid starts -->
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <!-- Authentication card start -->
                    <div class="login-card card-block auth-body mr-auto ml-auto">
                       <form method="post" action="/registerUser">
                            <div class="text-center">
                                <img src="" alt="logo.png">
                            </div>
                            <div class="auth-box">
                            
                                <div class="row m-b-20">
                                    <div class="col-md-12">
                                        <h3 class="text-left txt-primary">회원가입</h3>
                                    </div>
                                </div>
                                <hr/>
                            

						        <div class="title input-group mt-5">
						            <input type="text" class="form-control" name="userid" id="id" placeholder="아이디를 입력해주세요">
						            <label id="label1"></label>
						        </div>
						        
						        <p id="id-message" class="error-message">이미 사용 중인 아이디입니다.</p>
 
								<div class="check-password">
								    <div class="input-group">
								        <input type="password" id="password" name="pwd" class="form-control" placeholder="비밀번호를 입력해주세요">
								        <span class="md-line"></span>
								    </div>
								    <div class="pwd input-group">
								        <input type="password" id="confirm-password" class="form-control" placeholder="비밀번호를 입력해주세요" style="margin-bottom:0; padding-bottom:0;">
								        <span class="md-line"></span>
								        <button type="button" class="btn btn-primary btn-md waves-effect m-b-20" 
								        id="check-password">확 인</button>
								    </div>
								    <label id="password-message" class="error-message">비밀번호가 일치하지 않습니다.</label>
								</div>
                                <div class="input-group">
                                    <input type="text" name="name" class="form-control" placeholder="이름을 입력해주세요">
                                    <span class="md-line"></span>
                                </div>
                                <div class="input-group">
                                    <input type="text" class="form-control" name="birthdate" placeholder="생일을 입력해주세요">
                                    <span class="md-line"></span>
                                </div>
                                <div class="input-group">
                                    <input type="text" name="phone" class="form-control" placeholder="핸드폰번호를 입력해주세요">
                                    <span class="md-line"></span>
                                </div>
								<div class="email input-group">
                                    <input id="firstemail" type="email" name="email" class="form-control" placeholder="이메일을 입력해주세요">
                                    <button type="button" class="btn btn-primary btn-md waves-effect m-b-20" 
								    id="email-check" style="margin-bottom:0; padding-bottom:0;">인증번호 받기</button>
                                    <span class="md-line"></span>
                                </div>
                                <div class="emailcheck input-group">
                                     <input id="lastemail" type="text" class="form-control" placeholder="인증번호를 입력해주세요" style="margin-bottom:0; padding-bottom:0;">
                                     <button type="button" class="btn btn-primary btn-md waves-effect m-b-20" 
								     id="email" style="margin-bottom:0; padding-bottom:0;">인증번호 확인</button>
                                    <span class="md-line"></span>
                                </div>
                                <div class="ads input-group">
                                    <input id="sample6_postcode"  type="text" name="address" class="form-control" placeholder="우편 번호" readonly>
                                    <button type="button" class="btn btn-primary btn-md waves-effect m-b-20" 
								     onclick="sample6_execDaumPostcode()">주소 검색</button>
                                    <span class="md-line"></span>
                                </div>
                                 <div class="adre input-group">
                                    <input id="address" type="text" name="address1" class="form-control" placeholder="주소를 입력해주세요">
                                    <input id="sample6_detailAddress" name="address2" type="text" class="form-control" placeholder="상세주소를 입력해주세요">
                                	<input id="sample6_extraAddress" type="hidden" class="form-control" placeholder="참고항목" readonly>
                                </div>
                               <div class="input-group">
                                    <input type="hidden" class="form-control" name="point" value="0" placeholder="포인트 입력해주세요">
                                    <span class="md-line"></span>
                                </div>
                                <div class="input-group">
                                    <input type="hidden" class="form-control" name="rating" value="일반회원" placeholder="등급 입력해주세요">
                                    <span class="md-line"></span>
                                </div>
                                <div class="row m-t-30">
                                    <div class="col-md-12">
                                        <button type="submit" class="btn btn-primary btn-md btn-block waves-effect text-center m-b-20">
                                        회원 등록</button>
                                     </div>
                                </div>

                                </div>
                                </form>
                                <hr/>
                                <div class="row">
                                    <div class="col-md-10">
                                        <p class="text-inverse text-left"><b>저희 사이트를 찾아주셔서 감사합니다</b></p>
                                    </div>
                                    <div class="col-md-2">
                                        <img src=""  alt="small-logo.png">
                                    </div>
                                </div>

                            </div>
                       
                        <!-- end of form -->
                    </div>
                    
                    <!-- Authentication card end -->
              		
                </div>
                <!-- end of col-sm-12 -->
            </div>
            <!-- end of row -->
       
        <!-- end of container-fluid -->
    </section>
    <!-- Warning Section Starts -->
    <!-- Older IE warning message -->
    <!--[if lt IE 9]>
<div class="ie-warning">
    <h1>Warning!!</h1>
    <p>You are using an outdated version of Internet Explorer, please upgrade <br/>to any of the following web browsers to access this website.</p>
    <div class="iew-container">
        <ul class="iew-download">
            <li>
                <a href="http://www.google.com/chrome/">
                    <img src="assets/images/browser/chrome.png" alt="Chrome">
                    <div>Chrome</div>
                </a>
            </li>
            <li>
                <a href="https://www.mozilla.org/en-US/firefox/new/">
                    <img src="assets/images/browser/firefox.png" alt="Firefox">
                    <div>Firefox</div>
                </a>
            </li>
            <li>
                <a href="http://www.opera.com">
                    <img src="assets/images/browser/opera.png" alt="Opera">
                    <div>Opera</div>
                </a>
            </li>
            <li>
                <a href="https://www.apple.com/safari/">
                    <img src="assets/images/browser/safari.png" alt="Safari">
                    <div>Safari</div>
                </a>
            </li>
            <li>
                <a href="http://windows.microsoft.com/en-us/internet-explorer/download-ie">
                    <img src="assets/images/browser/ie.png" alt="">
                    <div>IE (9 & above)</div>
                </a>
            </li>
        </ul>
    </div>
    <p>Sorry for the inconvenience!</p>
</div>
<![endif]-->
    <!-- Warning Section Ends -->
    <!-- Required Jquery -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script type="text/javascript" src="${path}/assets/js/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="${path}/assets/js/jquery-ui/jquery-ui.min.js"></script>
    <script type="text/javascript" src="${path}/assets/js/popper.js/popper.min.js"></script>
    <script type="text/javascript" src="${path}/assets/js/bootstrap/js/bootstrap.min.js"></script>
    <!-- jquery slimscroll js -->
    <script type="text/javascript" src="${path}/assets/js/jquery-slimscroll/jquery.slimscroll.js"></script>
    <!-- modernizr js -->
    <script type="text/javascript" src="${path}/assets/js/modernizr/modernizr.js"></script>
    <script type="text/javascript" src="${path}/assets/js/modernizr/css-scrollbars.js"></script>
    <script type="text/javascript" src="${path}/assets/js/common-pages.js"></script>
    <script type="text/javascript">
    $(document).ready(function() {
    	$.ajax({
    	    url: '/registerUser', // 서버 URL
    	    type: 'POST',
    	    data: $('#registration-form').serialize(), // 폼 데이터를 직렬화하여 전송
    	    success: function(response) {
    	        // 성공 시 처리
    	        alert('회원가입 성공');
    	    },
    	    error: function(xhr, status, error) {
    	        // 에러 시 처리
    	        alert('회원가입 실패');
    	    }
    	});
    	
        $("#id").on("focusout", function() {
            var userid = $("#id").val();

            if (userid === '' || userid.length === 0) {
                $("#label1").css("color", "red").text("공백은 ID로 사용할 수 없습니다.");
                return false;
            }
            $("#label1").text("");

            $.ajax({
                url: './ConfirmId',
                type: 'POST',
                data: {
                    userid: userid // 서버로 보낼 데이터
                },
                dataType: 'json', // 서버 응답의 형식
                success: function(result) {
                    if (result === true) {
                        $("#label1").css("color", "black").text("사용 가능한 ID 입니다.");
                    } else {
                        $("#label1").css("color", "red").text("사용 불가능한 ID 입니다.");
                        $("#id").val('');
                    }
                },
                error: function(xhr, status, error) {
                    console.error("AJAX 요청 중 오류 발생:", status, error);
                    console.error("응답 본문:", xhr.responseText);
                }
            });
        });
    });
    document.getElementById('check-password').addEventListener('click', function() {
        var password = document.getElementById('password').value;
        var confirmPassword = document.getElementById('confirm-password').value;
        var message = document.getElementById('password-message');

        if (password === confirmPassword) {
            message.style.display = 'none';
            alert('비밀번호가 일치합니다.');
            // 비밀번호가 일치할 때 추가로 처리할 작업이 있으면 여기에 작성
        } else {
            message.style.display = 'block';
        }
    });

    $(document).ready(function() {
        $("#email-check").on("click", function() {
            var email = $("#firstemail").val();
            
            if(email === '' || email.length === 0) {
                alert("이메일을 입력해주세요.");
                return false;
            }
            
            $.ajax({
                url: '${path}/sendVerificationEmail',
                type: 'POST',
                data: { email: email },
                success: function(result) {
                    alert(result); // 인증 코드 발송 성공 메시지
                },
                error: function(xhr, status, error) {
                    alert("이메일 발송 실패");
                    console.error("AJAX 요청 중 오류 발생:", status, error);
                }
            });
        });

        $("#email").on("click", function() {
            var code = $("#lastemail").val();
            
            $.ajax({
                url: '${path}/verifyEmailCode',
                type: 'POST',
                data: { code: code },
                success: function(result) {
                    alert(result); // 인증 성공 메시지
                },
                error: function(xhr, status, error) {
                    alert("인증 실패");
                    console.error("AJAX 요청 중 오류 발생:", status, error);
                }
            });
        });
    });
    
    function checkVerification() {
        var code = $("#lastemail").val();
        if (!code) {
            alert("이메일 인증을 완료해주세요.");
            return false;
        }

        // AJAX를 사용하여 인증 코드를 확인하는 로직을 추가할 수 있습니다.
        // 성공하면 true를 반환하고, 실패하면 false를 반환하여 폼 전송을 막습니다.
        return true;
    }
    
    
    
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if (data.userSelectedType === 'R') {
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if (data.buildingName !== '' && data.apartment === 'Y') {
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if (extraAddr !== '') {
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;

                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("address").value = addr; // Update address field
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }

    </script>
</body>
</html>
