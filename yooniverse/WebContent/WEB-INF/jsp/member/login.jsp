<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<jsp:include page="../common/head.jsp"/>
    <title>♥ LOGIN ♥</title>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
    <div class="main">
        <div class="login">
            <h2>반갑습니다 :D</h2>
            <form method="post" onsubmit="return checkLogin()" id="loginFrm">
            	<input type="hidden" name="backUrl" value="${backUrl}">
                <div class="form-group mt-4">
                  <label for="id">ID</label>
                  <input type="text" class="form-control mt-2" id="id" name="id" placeholder="아이디를 입력해주세요.">
                  <div class="invalid-feedback"></div>
                </div>
                <div class="form-group mt-4">
                  <label for="pwd">Password</label>
                  <input type="password" class="form-control mt-2" id="pwd" name="pwd" placeholder="비밀번호를 입력해주세요.">
                  <div class="invalid-feedback"></div>
                </div>
                <div class="form-check mt-4">
                  <input type="checkbox" class="form-check-input" id="savedId" name="savedId">
                  <label class="form-check-label" for="savedId">아이디 저장</label>
                </div>
                <div class="form-group mt-4">
                <button type="submit" class="btn btn-primary w-100 mt-3" id="loginBtn">LOGIN</button>
                <div class="mt-4"></div>
                </div>
              </form>
              <div>${param.msg}</div>
              <div id="loginlist">
                  <a href="join" class="text-secondary">회원가입</a>
                  <a href="findId" class="text-secondary">아이디 찾기</a>
                  <a href="findPwd" class="text-secondary">비밀번호 찾기</a>
              </div>
        </div>
    </div>
		<script>
			$(function(){
				var savedId=$.cookie("savedId");
				if(savedId){
					$("#id").val($.cookie("savedId"));
					$("#savedId").prop("checked",true);
				}
			});
			
			function checkLogin() {
			    var getCheck = RegExp(/^[a-zA-Z0-9]{4,12}$/);
			    var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
			    var getName = RegExp(/^[가-힣]+$/);
			
			    
			    $(".form-control").next().text("");
				$("#id").removeClass("is-invalid");
			    $("#pwd").removeClass("is-invalid");
			    
			    
			    if($("#id").val() == ""){
			    	$("#id").addClass("is-invalid")
			        $("#id").next().text("필수 정보입니다.");
			        $("#id").focus();
			        return false;
			    }
			        
			    if($("#pwd").val() == ""){
			    	$("#pwd").addClass("is-invalid")
			        $("#pwd").next().text("필수 정보입니다.");
			        $("#pwd").focus();
			        return false;
			    }
			    if($("#id").val() && $("#pwd").val()) {
			    	var flag=false;
			        $.ajax('loginValid?id='+$("#id").val()+'&pwd='+$("#pwd").val(), {
			        	async:false,
			            success : function(data) {
			                if(data==1) { //  가입 가능
			                	flag=true;
			                } else { // 가입 불가능
				       			 $("#loginBtn").next().text("아이디 또는 비밀번호를 잘못 입력하셨습니다.");
			              		flag=false;
			                }
			            }
			        });
			        return flag;
			    }
			    
			};
		</script>
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>