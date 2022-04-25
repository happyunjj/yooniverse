<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>♥ WRITE ♥</title>
	<jsp:include page="../common/head.jsp"/>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
    <div class="main">
        <div class="write">
            <h2>글쓰기</h2>
            <form method="post" enctype="multipart/form-data" onsubmit="return checkWrite()">
                <hr>
                <div class="form-group my-2">
                    <input type="text" class="form-control mt-2" id="title" name="title" placeholder="제목을 입력해주세요.">
                    <div class="valid-feedback"></div>
                </div>
                <hr>
                <input type="file" class="form-control" name="file1" id="file1" accept="image/png,image/jpeg,image/gif">
                <hr>
                <input type="file" class="form-control" name="file2" id="file2" accept="image/png,image/jpeg,image/gif">
                <hr>
                <div class="form-group my-2">
                    <textarea class="form-control stype1" id="content" name="content" rows="15" placeholder="내용을 입력해주세요."></textarea>
                    <div class="valid-feedback"></div>
                </div>
                <hr>
                <div class="formBtnDiv">
                    <a href="list?category=${category}"><button type="button" class="btn btn-secondary" >취소</button></a>
                    <button type="submit" class="btn btn-success" >글쓰기</button>
                </div>
            </form>
              <img src="${pageContext.request.contextPath}/img/satelite.png" alt="satellite" id="boardSat">
        </div>
    </div>
	<jsp:include page="../common/footer.jsp"/>
	<script>
	function checkWrite() {

			var titleLen=$("#title").val().trim().length;
			var contentLen=$("#content").val().trim().length;
			if(!titleLen) {
		        alert("제목을 입력하세요");
		        $("#title").focus();
		        return false;
		    }
			
			if(!($("#file1").val()||$("#file2").val())){
				alert("사진을 한 장 이상 첨부해주세요!");
				return false;
			}
			
			if(!contentLen) {
		        alert("내용을 입력하세요");
		        $("#content").focus();
		        return false;
		    }

		          
		};
	</script>
</body>
</html>


