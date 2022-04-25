<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>♥ GALLERY ♥</title>
	<jsp:include page="../common/head.jsp" />
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<div class="main">
		<div class="board">
			<h2>${category==3?"PORTFOLIO":"MONGJA"}</h2>
		<div class="container">
		<c:set var="endCount" value="${page.cri.amount-(page.cri.amount-1)%3+2}" />
			<c:forEach begin="1" end="${endCount}" varStatus="stat">
				<c:set var="board" value="${list[stat.index-1]}"/>
					<c:if test="${stat.index%3 ==1}">
						<div class="row justify-content-center">
					</c:if>
						<div class="gpost">
							<c:if test="${not empty board}">
								<div class="imgcontainer">
									<img src="${pageContext.request.contextPath}/display?filename=${board.attachs[0].path}/s_${board.attachs[0].uuid}"alt="썸네일">
									<img src="../img/heart.png" alt="하트뿅">
								</div>
								<div class="text-nowrap text-truncate text-center mt-2 mx-auto">
									<a href="detail?bno=${board.bno}&pageNum=${page.cri.pageNum}">${board.title}</a>
								</div>
							</c:if>
						</div>
					<c:if test="${stat.index%3 ==0}">
						</div>
					</c:if>
			</c:forEach>
			<c:if test="${not empty member}">
				<a href="write?category=${category}"><button type="button" class="btn btn-success" id="btnWrite">글쓰기</button></a>
			</c:if>
			<div class="pageDiv">
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
						<a class="page-link"href="list?pageNum=${page.endPage+1}&amount=${page.cri.amount}&category=${page.cri.category}">&raquo;</a>
					</li>
				</ul>
			</div>
			<img src="../img/satelite.png" alt="satellite" id="boardSat">
		</div>
	</div>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>