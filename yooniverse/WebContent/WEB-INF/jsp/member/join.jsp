<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>♥ JOIN ♥</title>
    <jsp:include page="../common/head.jsp"/>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
    <div class="main">
        <div class="join">
            <h2>회원가입 :D</h2>
            <form method="post" class="signup" onsubmit="return checkJoin()">
                <div class="form-group mt-4">
                  <label for="id">ID</label>
                  <input type="text" class="form-control mt-2" id="id" name="id" placeholder="아이디를 입력해주세요.">
                  <div class="invalid-feedback"></div>
                </div>
                <div class="form-group mt-4">
                  <label for="pwd">Password</label>
                  <input type="password" class="form-control mt-2" id="pwd" name="pwd" placeholder="비밀번호를 입력해주세요. (문자,숫자,특수문자 포함 6~20글자)">
                  <div class="invalid-feedback"></div>
                </div>
                <div class="form-group mt-4">
                  <label for="pwdCheck">Password Check</label>
                  <input type="password" class="form-control mt-2" id="pwdCheck" name="pwdCheck" placeholder="비밀번호를 한번 더 입력해주세요.">
                  <div class="invalid-feedback"></div>
                </div>
                <div class="form-group mt-4">
                  <label for="name">Name</label>
                  <input type="text" class="form-control mt-2" id="name" name="name" placeholder="이름을 입력해주세요.">
                  <div class="invalid-feedback"></div>
                </div>
                <div class="form-group mt-4">
                  <label for="email">Email Adress</label>
                  <input type="text" class="form-control mt-2" id="email" name="email" placeholder="이메일을 입력해주세요.">
                  <div class="invalid-feedback"></div>
                </div>
   
                <button type="button" class="btn btn-primary mt-4" id="cancelBtn">취소</button>
                <button type="submit" class="btn btn-primary mt-4" id="joinBtn">가입하기</button>
              </form>
        </div>
    </div>
	<script>
		$(function(){
			$("#cancelBtn").click(function(){
				history.back();
			});
			
		});
		function checkJoin() {
			   var getCheck = RegExp(/^[a-zA-Z0-9]{4,12}$/);
			   var getPwCheck = RegExp(/^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{6,20}$/);
			   var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
			   var getName = RegExp(/^[가-힣]+$/);
			   
			   $(".form-control").next().text("");
			    $("#id").removeClass("is-invalid");
			    $("#pwd").removeClass("is-invalid");
				$("#pwdCheck").removeClass("is-invalid");
				$("#name").removeClass("is-invalid");
			    $("#email").removeClass("is-invalid");
			    
			   if($("#id").val() == ""){
				  $("#id").addClass("is-invalid");
			      $("#id").next().text("필수 정보입니다.");
			      $("#id").focus();
			      return false;
			   }

			   if(!getCheck.test($("#id").val())){
				  $("#id").addClass("is-invalid");
			      $("#id").next().text("아이디를 형식에 맞게 입력해주세요");
			      $("#id").val("");
			      $("#id").focus();
			      return false;
			   }
			     
			   if($("#pwd").val() == ""){
				  $("#pwd").addClass("is-invalid");
			      $("#pwd").next().text("필수 정보입니다.");
			      $("#pwd").focus();
			      return false;
			   }

			   if(!getPwCheck.test($("#pwd").val())) {
				  $("#pwd").addClass("is-invalid");
			      $("#pwd").next().text("비밀번호를 형식에 맞게 입력해주세요");
			      $("#pwd").val("");
			      $("#pwd").focus();
			      return false;
			   }

			   if ($("#id").val() == ($("#pwd").val())) {
				  $("#pwd").addClass("is-invalid");
			      $("#pwd").next().text("비밀번호가 아이디랑 다르게 입력해주세요");
			       $("#pwd").val("");
			       $("#pwd").focus();
				   return false;
			   }

			   if($("#pwd").val() != ($("#pwdCheck").val())){ 
				  $("#pwdCheck").addClass("is-invalid"); 
			      $("#pwdCheck").next().text("비밀번호를 다시 확인해주세요");
			      $("#pwdCheck").val("");
			      $("#pwdCheck").focus();
			      return false;
			   }

			   if($("#email").val() == ""){
				  $("#email").addClass("is-invalid");
			      $("#email").next().text("필수 정보입니다.");
			      $("#email").focus();
			      return false;
			   }
			          
			   if(!getMail.test($("#email").val())){
				  $("#email").addClass("is-invalid");
			      $("#email").next().text("이메일형식에 맞게 입력해주세요")
			      $("#email").val("");
			      $("#email").focus();
			      return false;
			   }
			     
			   if($("#name").val() == ""){
				  $("#name").addClass("is-invalid");
			      $("#name").next().text("필수 정보입니다.");
			      $("#name").focus();
			      return false;
			   }

			   if (!getName.test($("#name").val())) {
				  $("#name").addClass("is-invalid");
			      $("#name").next().text("이름을 다시 입력해주세요");
			      $("#name").val("");
			      $("#name").focus();
			      return false;
			   }
			   
			   if($("#id").val() && $("#email").val()) {
				   var flag=false;
			      $.ajax("preventDup?email="+$("#email").val()+"&id="+$("#id").val(), {
			    	  async:false,
			         success : function(data) {
			            if(data%2==1) { 
			            	$("#id").addClass("is-invalid");
			            	$("#id").focus();
			            	$("#id").next().text("중복된 아이디입니다.");
			            } else if(data>=2){
			            	$("#email").addClass("is-invalid");
			            	$("#email").focus();
			               $("#email").next().text("중복된 이메일입니다.");
			            }else{
			            	flag=true;
			            }
			         }
			      });
			      return flag;
			   };
			};
	</script>
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>