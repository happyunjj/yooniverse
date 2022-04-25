<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>♥ MODIFY ♥</title>
    <jsp:include page="../common/head.jsp"/>
</head>
<body>
    <jsp:include page="../common/header.jsp"/>
    <div class="main">
        <div class="write">
            <h2>수정하기</h2>
            <form method="post" onsubmit="return checkMod()" id="frmModify">
                <hr>
                <div class="form-group my-2">
                    <input type="text" class="form-control mt-2" id="title" name="title" value="${board.title}" placeholder="제목을 입력해주세요.">
                    <div class="invalid-feedback"></div>
                </div>
                <hr>
                <div class="form-group my-2">
                    <textarea class="form-control stype1" id="content" name="content" rows="15" placeholder="내용을 입력해주세요.">${board.content}</textarea>
                    <div class="invalid-feedback"></div>
                </div>
                <hr>
                <div class="formBtnDiv">
                    <button type="button" class="btn btn-secondary cancelBtn">취소</button>
                    <button type="submit" class="btn btn-success" id="btnMod">수정하기</button>
                </div>
            </form>
              <img src="../img/satelite.png" alt="satellite" id="boardSat">
        </div>
    </div>
	<jsp:include page="../common/footer.jsp"/>
		<script>
		$(function(){
			$(".cancelBtn").click(function(){
				history.back();
			});
			
		});
		
	function checkMod() {
		   $(".form-control").next().text("");
			$("#title").removeClass("is-invalid");
		    $("#content").removeClass("is-invalid");

			var titleLen=$("#title").val().trim().length;
			var contentLen=$("#content").val().trim().length;
			if(!titleLen) {
				$("#title").addClass("is-invalid");
				$("#title").next().text("제목을 입력해주세요.");
		        $("#title").focus();
		        return false;
		    }
			if(!contentLen) {
				$("#content").addClass("is-invalid");
				$("#content").next().text("내용을 입력해주세요.");
		        $("#content").focus();
		        return false;
		    }

		          
		};
	</script>
</body>
</html>