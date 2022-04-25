<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<jsp:include page="../common/head.jsp"/>
    <title>♥ WITHDRAW ♥</title>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
    <div class="main">
        <div class="join text-center">
            <h2>${member.name}님 정말로 탈퇴하시나요?</h2>
            <h4> 신중한 선택 부탁드립니다.</h4>
            <form method="post" id="withdrawFrm" onsubmit="return checkWithdraw()">
            	<input type="hidden" name="id" id="id" value="${member.id}">
                <div class="form-group mt-4">
                  <label for="pwd">Password</label>
                  <input type="password" class="form-control mt-2" id="pwd" name="pwd" placeholder="비밀번호를 입력해주세요.">
                  <div class="invalid-feedback"></div>
                </div>
                <button type="submit" class="btn btn-primary w-100 mt-3 mx-auto" id="btnWd">탈퇴하기</button>
              </form>
        </div>
    </div>
		<script>
			function checkWithdraw() {
		    	console.log('loginValid?id='+id+'&pwd='+$("#pwd").val());
				
			    $(".form-control").next().text("");
			    $("#pwd").removeClass("is-invalid");
			        
			    if($("#pwd").val() == ""){
			    	$("#pwd").addClass("is-invalid")
			        $("#pwd").next().text("필수 정보입니다.");
			        $("#pwd").focus();
			        return false;
			    }
			    
			    if($("#pwd").val()) {
			    	var flag=false;

			        $.ajax('loginValid?id='+$("#id").val()+'&pwd='+$("#pwd").val(), {
			        	async:false,
			            success : function(data) {
			                if(data==1) { //  가입 가능
			                	if (confirm("정말로 탈퇴하시겠습니까?")){    
									flag=true;
								}else{   
								   //취소 버튼 눌렀을 때 실행 할 코드
								}
					
			                } else { // 가입 불가능
			                	$("#pwd").addClass("is-invalid");
			                	$("#pwd").focus();
				       			 $("#pwd").next().text(" 비밀번호를 잘못 입력하셨습니다.");
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