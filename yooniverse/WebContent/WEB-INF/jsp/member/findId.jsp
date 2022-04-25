<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>♥ FIND ID ♥</title>
    <jsp:include page="../common/head.jsp"/>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
    <div class="main">
        <div class="findId">
            <h2>아이디 찾기 :D</h2>
            <form  method="post"  id="findIdFrm">
            	<input type="hidden" name="code" id="code">
                <div class="form-group mt-4">
                  <label for="name">Name</label>
                  <input type="text" class="form-control mt-2" id="name" name="name" placeholder="이름을 입력해주세요.">
                  <div class="invalid-feedback"></div>
                </div>
                <div class="form-group mt-4">
                  <label for="email">Email</label>
                  <input type="text" class="form-control mt-2" id="email" name="email" placeholder="이메일을 입력해주세요.">
                  <div class="invalid-feedback"></div>
                </div>
                <div class="form-group clearfix">
                	<button type="button" class="btn btn-primary mt-4 float-end" id="infoCheck">확인</button>
                <div class="mt-4 float-start"></div>
                </div>
                <div class="form-group mt-4">
                <label for="code">Verification Code</label>
                  <input type="text" class="form-control mt-2" id="auth" name="auth" placeholder="인증코드를 입력해주세요.">
                  <div class="invalid-feedback"></div>
                  </div>
                  <div class="form-group">
                  <button type="button" class="btn btn-primary mt-4 float-end disabled" id="mailSend">발송</button>
                  <button type="button" class="btn btn-primary mt-4 float-end disabled" id="codeCheck">인증</button>
                  </div>
                <div id="buttons clearfix">
                <button type="submit" class="btn btn-primary w-100 mt-4 disabled" id="btnFindId">아이디찾기</button>
                </div>
                <p></p>
              </form>
        </div>
    </div>
	<script>
		$(function(){
			
			$("#infoCheck").click(function(){
			    $(".form-control").next().text("");
			    $("#infoCheck").next().text("");
			    $("#name").removeClass("is-invalid");
			    $("#email").removeClass("is-invalid");
			    $("#name").removeClass("is-valid");
			    $("#email").removeClass("is-valid");
			    
			    if($("#name").val() == ""){
			    	$("#name").addClass("is-invalid")
			        $("#name").next().text("필수 정보입니다.");
			        $("#name").focus();
			        return false;
			    }

			    
			    if($("#email").val() == ""){
			    	$("#email").addClass("is-invalid")
			        $("#email").next().text("필수 정보입니다.");
			        $("#email").focus();
			        return false;
			    }

			    
			    if($("#name").val() && $("#email").val()) {
			        $.ajax( {
			        	url:'memberValid?name=' + $("#name").val() + '&email=' +$("#email").val(),
			            success : function(data) {
			                if(data/1) { //  가입 가능
			                	$("#name").addClass("is-valid");
			                	$("#email").addClass("is-valid");
			                	 $("#mailSend").removeClass("disabled");
			                	 $("#infoCheck").addClass("disabled");
			                } else { // 가입 불가능
			                	$("#name").addClass("is-invalid");
			                	$("#email").addClass("is-invalid");
			                    $("#infoCheck").next().text("해당하는 회원정보가 없습니다.");
			                }
			            }
			        });
			    };
			});
			
			$("#mailSend").click(function(){
				alert("인증메일이 발송되었습니다.\n잠시만 기다려주세요 ! :D");
		        $("#codeCheck").removeClass("disabled");
		        $("#mailSend").addClass("disabled");
				$.ajax( {
		        	url:'sendMail?email=' +$("#email").val(),
		            success : function(data) {
		            	$('#code').val(data);
		            }
		        });
			});
			
			$("#codeCheck").click(function(){

				if($("#code").val()==$("#auth").val()){
					$("#btnFindId").removeClass("disabled");
					$("#codeCheck").addClass("disabled");
				}else{
			    	$("#auth").addClass("is-invalid")
			        $("#auth").next().text("틀렸습니다.");
			        $("#auth").focus();
				}
			});
			
		});
		
		
		

	</script>
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>