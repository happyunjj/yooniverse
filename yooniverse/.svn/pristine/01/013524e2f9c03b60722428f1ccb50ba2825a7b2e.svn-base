<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>♥ FIND PWD ♥</title>
    <jsp:include page="../common/head.jsp"/>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
    <div class="main">
        <div class="findPwd">
            <h2>비밀번호 찾기 :D</h2>
            <form method="post" id="findPwFrm">
            	<input type="hidden" name="code" id="code">
                <div class="form-group mt-4">
	                  <label for="id">ID</label>
	                  <input type="text" class="form-control mt-2" id="id" name="id" placeholder="아이디를 입력해주세요.">
	                  <div class="invalid-feedback"></div>
                </div>
                 <div class="form-group mt-4">
	                  <label for="email">Email Address</label>
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
                  <button type="button" class="btn btn-primary mt-4 disabled float-end" id="mailSend">발송</button>
                  <button type="button" class="btn btn-primary mt-4 disabled float-end" id="codeCheck">인증</button>
                </div>
                 <div id="buttons clearfic">
                <button type="button" class="btn btn-primary mt-4 w-100 disabled" id="btnFindPwd">비밀번호찾기</button>
                </div>
                <p></p>
              </form>
        </div>
    </div>
	<script>
		$(function(){
			
			$("#infoCheck").click(function(){
			    $(".form-control").next().text("");
			    $("#id").removeClass("is-invalid");
			    $("#id").removeClass("is-valid");
			    $("#email").removeClass("is-invalid");
			    $("#email").removeClass("is-valid");
			    
			    
			    if($("#id").val() == ""){
			    	$("#id").addClass("is-invalid")
			        $("#id").next().text("필수 정보입니다.");
			        $("#id").focus();
			    }
				 if($("#email").val() == ""){
					  $("#email").addClass("is-invalid");
					  $("#email").next().text("필수 정보입니다.");
					  $("#email").focus();
				}

				   if($("#id").val() && $("#email").val()) {
				      $.ajax("findPwValid?email="+$("#email").val()+"&id="+$("#id").val(), {
				         success : function(data) {
				            if(data==1) { 
				            	$("#id").addClass("is-valid");
				            	$("#email").addClass("is-valid");
			                	 $("#mailSend").removeClass("disabled");
			                	 $("#infoCheck").addClass("disabled");
				            } 
				            else{
				            	$("#id").addClass("is-invalid");
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
					$("#auth").addClass("is-valid");
					$("#btnFindPwd").removeClass("disabled");
					$("#codeCheck").addClass("disabled");
				}else{
			    	$("#auth").addClass("is-invalid");
			        $("#auth").next().text("틀렸습니다.");
			        $("#auth").focus();
				}
			});
			
			
			$("#btnFindPwd").click(function(){

				alert("임시비밀번호가 이메일로 발송되었습니다 ! :D");
				$("#btnFindPwd").addClass("disabled");
				$.ajax( {
		        	url:'sendMail?email=' +$("#email").val()+'&tempPwd=1',
		            success : function(data) {
		            	$('#code').val(data);
		            	$("#findPwFrm").submit();
		            }
		        });
			});
			
		});

	</script>
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>