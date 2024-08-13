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
                       <form method="post" action="loginPage">
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
						            <input type="text" class="form-control" id="id" placeholder="아이디를 입력해주세요">
						            <label id="label1"></label>
						        </div>
						        
						        <p id="id-message" class="error-message">이미 사용 중인 아이디입니다.</p>
 
								<div class="check-password">
								    <div class="input-group">
								        <input type="password" id="password" class="form-control" placeholder="비밀번호를 입력해주세요">
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
                                    <input type="text" class="form-control" placeholder="이름을 입력해주세요">
                                    <span class="md-line"></span>
                                </div>
								<div class="email input-group">
                                    <input id="firstemail" type="email" class="form-control" placeholder="이메일을 입력해주세요">
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
                                <div class="input-group">
                                    <input type="text" class="form-control" placeholder="주소를 입력해주세요">
                                    <span class="md-line"></span>
                                </div>
                                 <div class="input-group">
                                    <input type="text" class="form-control" placeholder="상세주소를 입력해주세요">
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
        </div>
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
    </script>
</body>
</html>