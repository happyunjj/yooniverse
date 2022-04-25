<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>♥ DETAIL ♥</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/css/bootstrap.min.css"/>
	<jsp:include page="../common/head.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
  <div class="main">
    <div class="gallery">
      <div class="galdetail">
        <h2>${board.category==3?"PORTFOLIO":"MONGJA"}</h2>
        <section id="imgSection">
          <img src="${pageContext.request.contextPath}/img/earth.png" id="imgNav">
          <div id="showImg"><img src="${pageContext.request.contextPath}/display?filename=${board.attachs[0].path}/${board.attachs[0].uuid}" alt="img" id="sImg"></div>
          <div id="imgList1"><img src="${pageContext.request.contextPath}/display?filename=${board.attachs[0].path}/${board.attachs[0].uuid}" onclick="showImg('${board.attachs[0].path}/${board.attachs[0].uuid}');"></div>
          <img src="${pageContext.request.contextPath}/img/pin.png" alt="pin" id="pin1">
          <c:if test="${board.attachs[1]!=null}">
          <div id="imgList2">
          	<img src="${pageContext.request.contextPath}/display?filename=${board.attachs[1].path}/${board.attachs[1].uuid}" onclick="showImg('${board.attachs[1].path}/${board.attachs[1].uuid}');">
          </div>
          <img src="${pageContext.request.contextPath}/img/pin.png" alt="pin" id="pin2">
          </c:if>
 
        </section>
        <aside id="replySection">
            <div id="detailCon">
	            <h3><c:out value="${board.title}" escapeXml="true"/></h3>
	            <h6>${board.id }</h6>
	            <p class="stype1"><c:out value="${board.content}" escapeXml="true"/></p>
          	</div>
          <div class="drow4">
            <div id="hearts">
              <img src="${pageContext.request.contextPath}/img/fillheart.png" alt="fillheart" id="like" class="opacity-0">
              <a id="putHeart" onclick="clickHeart()"><img src="${pageContext.request.contextPath}/img/emptyheart.png" alt="emptyheart" id="unlike"></a>
            </div>
            <p id="heartCount">${board.likeCount}</p>
          </div>
          <hr>
          <c:if test="${not empty member}">
          <div class="mx-auto" id="rpFrm">
            <div class="form-group clearfix">
              <form id="frmReplyWrite">
                <input type="text" class="form-control" value="${member.id}" readonly>
                <textarea class="form-control my-1 stype1" placeholder="댓글 내용을 입력하세요" name="content" id="content"></textarea>
                <input type="hidden" name="bno" value="${board.bno}">
                <input type="hidden" name="id" value="${member.id}">
                <button class="btn btn-primary float-end disabled" id="btnReplyWrite">등록</button>
              </form>
            </div>
          </div>
          </c:if>
          <div class="mx-auto reply-wrapper stype1">
          </div>
        </aside>
      </div>
       <div class="detailBtnDiv my-3">
           <a href="list?category=${board.category }&pageNum=${pageNum}"><button type="button" class="btn btn-secondary mt-3" >목록으로</button></a>
            <c:if test="${member.id!=null && member.id == board.id }">
           	<a href="write?bno=${board.bno}&pageNum=${pageNum}"><button type="button" class="btn btn-success mt-3">수정하기</button></a>
           	<button type="button" class="btn btn-success mt-3" id="btnDt">삭제하기</button>
            </c:if>
       </div>
    <img src="${pageContext.request.contextPath}/img/satelite.png" alt="satellite" id="boardSat">
  </div>
			<script>
			var cp="${pageContext.request.contextPath}";
			var bno='${param.bno}';
			var pageNum="${param.pageNum}"
			var memberId="${sessionScope.member.id}";
			var category="${board.category}";
			$(function(){
				showList();
				function showList(){
					var url=cp+"/reply/list?bno="+bno+"&pageNum="+pageNum;	
					$.getJSON(url).done(function(data){
						var str="";
						for(var i in data){
							str+='<div class="card my-3 mx-auto border-secondary '+data[i].rno+'" data-rno="'+data[i].rno+'">'
				  			str+='	<div class="card-header bg-dark text-light">'+(data[i].id==null?"탈퇴회원":data[i].id)+'<span class="float-end">'+data[i].regDate+'</span></div>'
				  			str+='	<div class="card-body">'+data[i].content+'</div>'
 							if(memberId!=null && memberId==data[i].id){
								str+='	<div class="card-footer">'
								str+='	<button type="button" class="btn btn-success btn-sm mx-2 float-end" id="rpDt" >삭제</button>'
								str+='	<button type="button" class="btn btn-success btn-sm float-end" id="rpMf">수정</button>'
								str+='</div>'
							} 
							str+='</div>'
						}
						$(".reply-wrapper").html(str);
					})
				}
				
				$("#content").keyup(function() {
			        var contentLen = $("#content").val().trim().length;

			        if(contentLen) {
			            $("#btnReplyWrite").removeClass("disabled");
			        } 
			        else {
			            $("#btnReplyWrite").addClass("disabled");
			        }
			    });	
		
			$(".reply-wrapper").on("click","#rpDt",function(){
				var rno=$(this).closest(".card").data("rno");
				var url=cp+"/reply?rno="+rno;
			
				if($("#rpDt").is(".disabled")){
					alert("작성자 본인만 삭제가능합니다.");
					return;
				}
				
				if (confirm("정말로 삭제하시겠습니까?")){    
					//ajax
					$.ajax(url,{
						method:"delete",
						success:function(data){
							if(data/1){//가능
								showList();
							}
							else{ //불가능
								alert("삭제는 본인만 가능합니다.");
							}
						}
					});
					   return true;
					}else{   
					   //취소 버튼 눌렀을 때 실행 할 코드
					   return false;
					}

			});
			
			
			$("#btnDt").click(function(){
				var url=cp+"/gallery/detail?bno="+bno;
				if($("#btnDt").is(".disabled")){
					alert("작성자 본인만 삭제가능합니다.");
					return;
				}
				if (confirm("정말로 삭제하시겠습니까?")){    
					//ajax
					$.ajax(url,{
						method:"delete",
						success:function(data){
							if(data/1){//가능
								window.location.href = "list?category="+category;
							}
							else{ //불가능
								alert("삭제는 본인만 가능합니다.");
							}
						}
					});
					   return true;
					}else{   
					   //취소 버튼 눌렀을 때 실행 할 코드
					   return false;
					}

			});
			
			$.ajax(cp+"/heartValid?id="+memberId+"&bno="+bno,{
				success:function(data){
					if(data/1){//가능
						$('#like').removeClass("opacity-0");
					}
				}
			});
			
			
			
			$(".reply-wrapper").on("click","#rpMf",function(){
				var rno=$(this).closest(".card").data("rno");
				var url=cp+"/reply?rno="+rno+"&pageNum="+pageNum+"&gallery=1";	
				$.getJSON(url).done(function(data){
					var str="";
					str+='<form method="post" action="'+url+'" onsubmit="return checkRpMod()">'
					str+='<div class="card my-3 border-secondary" data-rno="'+data.rno+'">'
		  			str+='	<div class="card-header bg-dark text-light">'+(data.id==null?"탈퇴회원":data.id)+'<span class="float-end">'+data.regDate+'</span></div>'
		  			str+='	<div class="card-body"><textarea class="form-control stype1" id="mfContent" name="content">'+data.content+'</textarea></div>'
					str+='	<div class="card-footer">'
					str+='	<button type="button" class="btn btn-success btn-sm mx-2 float-end" id="rpCancel" >취소</button>'
					str+='	<button class="btn btn-success btn-sm float-end" id="rpMDone">수정</button>'
					str+='</div>'
					str+='</div>'
					str+='</form>'
					$("div ."+data.rno).replaceWith(str);
				})
				});
			
			$(".reply-wrapper").on("click","#rpCancel",function(){
				showList();
			});
											
			$("#frmReplyWrite").submit(function(){
				event.preventDefault();
				if($("#btnReplyWrite").is(".disabled")) return;
	
				var reply={};
				reply.content=preventXss($(this.content).val(),1);
				reply.id=$(this.id).val();
				reply.bno=$(this.bno).val();
				
				var data=JSON.stringify(reply);
				
				var frm=this;
				var url=cp+"/reply";
				$.ajax(url,{
					method:"post",
					data:{"jsonData":data},
					success:function(data){
						showList();
						frm.reset();
						$("#btnReplyWrite").addClass("disabled");
					}
				})
			})
			
			});
			
			
			function checkRpMod() {
				var contentLen=$("#mfContent").val().trim().length;
				if(!contentLen) {
			        alert("내용을 입력하세요");
			        $("#mfContent").focus();
			        return false;
			    }
				
				$("#mfContent").val(preventXss($("#mfContent").val(),1));
		
			};
			
			function preventXss(str, level) {
			    if (level == undefined || level == 0) {
			        str = str.replace(/\<|\>|\"|\'|\%|\;|\(|\)|\&|\+|\-/g,"");
			    } else if (level == 1) {
			        str = str.replace(/</g, "&lt;");
			        str = str.replace(/>/g, "&gt;");
			    }
			    return str;
			}
			
			function clickHeart(){
				var url=cp+"/heart?id="+memberId+"&bno="+bno;
				console.log(memberId);
				if(memberId==""){
					alert("좋아요는 로그인 시에만 누를 수 있습니다.");
					return;
				}
					//ajax
					$.ajax(url,{
						success:function(data){
							if(data.charAt(0)=="1"){//추가
								$('#like').removeClass("opacity-0");
								$("#heartCount").html(data.substring(1));
								
							}
							else{ //삭제
								$('#like').addClass("opacity-0");
								$("#heartCount").html(data.substring(1));
								
							}
						}
					});

			}; 
			
			function showImg(str) {
				console.log("메롱");
			    $("#sImg").attr("src",'${pageContext.request.contextPath}/display?filename='+str);
			}
			
	</script>


<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>