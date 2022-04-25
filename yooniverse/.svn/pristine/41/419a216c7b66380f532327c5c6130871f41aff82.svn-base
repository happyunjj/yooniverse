<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>♥ BOARD ♥</title>
    <jsp:include page="../common/head.jsp"/>
</head>
<body>
    <jsp:include page="../common/header.jsp"/>
    <div class="main">
        <div class="board">
            <h2>${category==1?"JAVA":category==2?"HTML/CSS":"VISITOR"}</h2>
            <table class="table">
                <thead>
                  <tr>
                    <th>No</th>
                    <th>Title</th>
                    <th>Writer</th>
                    <th>Date</th>
                    <th>Views</th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach items="${list}" var="b">
                	<tr>
                    	<td>${b.bno}</td>
                    	<td><a href="detail?bno=${b.bno}&pageNum=${page.cri.pageNum}"><c:out value="${b.title}" escapeXml="true"/><span class="text-muted small">[${b.replyCnt}]</span></a></td>
                    	<td>${b.id==null?"탈퇴회원":b.id}</td>
                    	<td>${b.regDate}</td>
                    	<td>${b.hitCount}</td>
                	</tr>
                  </c:forEach>

                </tbody>
              </table>
			  <c:if test="${not empty member}">
              	<a href="write?category=${category}"><button type="button" class="btn btn-success" id="btnWrite" >글쓰기</button></a>
              </c:if>
              <div class="pageDiv mt-4">
                <ul class="pagination justify-content-center">
	  				 <li class="page-item ${page.prev?'':'disabled'}">
	  					<a class="page-link" href="list?pageNum=${page.startPage-1}&amount=${page.cri.amount}&category=${page.cri.category}">&laquo;</a>
	  				 </li>
	  				 <c:forEach begin="${page.startPage}" end="${page.endPage}" var="p">
	  					<li class="page-item ${p==page.cri.pageNum?'active':'' }">
	  						<a class="page-link" href="list?pageNum=${p}&amount=${page.cri.amount}&category=${page.cri.category}">${p}</a>
	  				  	</li>
	  				  </c:forEach>
	  				  <li class="page-item ${page.next?'':'disabled'}">
	  				  	<a class="page-link" href="list?pageNum=${page.endPage+1}&amount=${page.cri.amount}&category=${page.cri.category}">&raquo;</a>
	  				  </li>
				</ul>
              </div>
              <img src="../img/satelite.png" alt="satellite" id="boardSat">
        </div>
    </div>
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>