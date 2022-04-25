<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
    <header>
        <div id="headerDiv">
        <nav class="navbar navbar-expand-lg navbar-dark">
            <div class="container-fluid">
              <a class="navbar-brand" href="${pageContext.request.contextPath}/index.html">Yooniverse</a>
              <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor02" aria-controls="navbarColor02" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
              </button>
              
              <div class="collapse navbar-collapse" id="navbarColor02">
                <ul class="navbar-nav me-auto">
                  <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/index.html">Home
                    </a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/board/list?category=1">JAVA</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/board/list?category=2">HTML/CSS</a>
                  </li>
                  <li class="nav-item dropdown">
                      <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">GALLERY</a>
                      <div class="dropdown-menu">
                          <a class="dropdown-item" href="${pageContext.request.contextPath}/gallery/list?category=3">PORTFOLIO</a>
                          <a class="dropdown-item" href="${pageContext.request.contextPath}/gallery/list?category=4">MONGJA</a>
                      </div>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/board/list?category=5">VISITOR</a>
                  </li>
                </ul>
                <c:choose>
    				<c:when test="${empty member}">
                		<form class="d-flex" action="${pageContext.request.contextPath}/login">
                  			<button class="btn btn-secondary my-3 my-sm-0 btn-sm" type="submit">Login</button>
                		</form>
                	</c:when>
        			<c:otherwise>
<%--         			<p>${member.name}님 환영합니다.</p>
        			<ul>
            			<li><a href="#">정보수정</a></li>
            			<li><a href="logout">로그아웃</a></li>
        			</ul> --%>
        			  <li class="nav-item dropdown">
                      	<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">${member.name}님</a>
                      	<div class="dropdown-menu">
                          <a class="dropdown-item" href="${pageContext.request.contextPath}/memberMf">정보수정</a>
                          <a class="dropdown-item" href="${pageContext.request.contextPath}/logout">로그아웃</a>
                          <a class="dropdown-item" href="${pageContext.request.contextPath}/withdraw">탈퇴하기</a>
                      	</div>
                  	  </li>
        			</c:otherwise>
        		</c:choose>
              </div>
            </div>
          </nav>
            <img src="${pageContext.request.contextPath}/img/rocket.png" id="headerRocket">
            <img src="${pageContext.request.contextPath}/img/earth.png" id="headerEarth">
            <img src="${pageContext.request.contextPath}/img/tosung.png" id="headerTosung">
            <img src="${pageContext.request.contextPath}/img/ufo.png" id="headerUfo">
            <img src="${pageContext.request.contextPath}/img/moon2.png" id="headerMoon">
            <img src="${pageContext.request.contextPath}/img/jupiter.png" id="headerJupiter">
          </div>
    </header>