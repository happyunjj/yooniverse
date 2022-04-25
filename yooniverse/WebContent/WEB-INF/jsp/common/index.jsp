<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<jsp:include page="head.jsp"/>
    <title>♥ YOONNIVERSE ♥</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.7.1/MotionPathPlugin.min.js"></script>
</head>
<body> 
        <nav class="navbar navbar-expand-lg navbar-dark fixed-top">
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
                		<form class="d-flex" action="login">
                  			<button class="btn btn-secondary my-3 my-sm-0 btn-sm" type="submit">Login</button>
                		</form>
                	</c:when>
        			<c:otherwise>

        			  <li class="nav-item dropdown">
                      	<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">${member.name}님</a>
                      	<div class="dropdown-menu">
                          <a class="dropdown-item" href="${pageContext.request.contextPath}/memberMf"">정보수정</a>
                          <a class="dropdown-item" href="${pageContext.request.contextPath}/logout">로그아웃</a>
               			  <a class="dropdown-item" href="${pageContext.request.contextPath}/withdraw">탈퇴하기</a>
                      	</div>
                  	  </li>
        			</c:otherwise>
        		</c:choose>
              </div>
            </div>
          </nav>
    <section class="sec1">
        <div class="pin-up">
            <img src="${pageContext.request.contextPath}/img/space_stars_static.svg" id="bg">
            <img src="${pageContext.request.contextPath}/img/rocket.png" id="rocket">
            <img src="${pageContext.request.contextPath}/img/earth.png" id="earth">
            <img src="${pageContext.request.contextPath}/img/tosung.png" id="tosung">
            <img src="${pageContext.request.contextPath}/img/ufo.png" id="ufo">
            <img src="${pageContext.request.contextPath}/img/moon2.png" id="moon">
            <h2 id="title">MY UNIVERSE</h2>
        </div>
    </section>
    <script>
        gsap.to('#rocket',{
            scrollTrigger: {
                scrub: 1
            },
            scale:1.5,
            x:-500,
            y:-500,
        })
        gsap.to('#bg',{
            scrollTrigger: {
                scrub:1
            },
            scale:1.5,
        })
        gsap.to('#ufo',{
            scrollTrigger: {
                scrub:1
            },
            scale:1.1,
            y:-700,
            x:2200
        })
        gsap.to('#moon',{
            scrollTrigger:{
                scrub: 1
            },
            x:-500
        })
        gsap.to('#earth',{
            scrollTrigger:{
                scrub:1
            },
            x:-200
        })
        gsap.to('#tosung',{
            scrollTrigger:{
                scrub:1
            },
            x:200,
            y:200
        })
        gsap.to('#title',{
            scrollTrigger:{
                scrub:1
            },
            y:-800,
            opacity:1
        })
        gsap.to('.sec1',{
            scrollTrigger:{
                trigger:'.sec1',
                start:'top top',
                end:"3700px top",
                pin:true

            }
        })

    </script>

    <section class="sec2">
        <div class="fixed-width">
            <svg xmlns="http://www.w3.org/2000/svg" id="road-path"  viewBox="0 0 786.75 3528.34" enable-background="new 0 0 786.75 3528.34" viewBox="0 0 786.75 3528.34" preserveAspectRatio="xMidYMin meet">

                <path id="road-path-target" fill="none" d="M783.01802,354.597 C697.25136,354.597 667.48402,356.595 578.71802,365.596 578.71802,365.596 342.31802,389.397 208.51802,523.197 49.61702,682.097 61.41702,821.396 213.91802,935.896 407.87102,1081.519 823.66902,1099.739 783.92502,1337.295 743.42002,1579.395 352.63302,1614.67 373.91702,1478.989 393.50502,1354.118 531.31702,1411.027 516.32102,1489.885 482.36202,1668.46 72.25702,1592.37 8.01402,1782.982 -87.38198,2066.024 685.09502,2128.634 558.81902,2405.881 457.77402,2627.733 21.71302,2751.385 85.81502,2956.886 155.09902,3179.001 605.91602,3298.485 453.82102,3581.588 375.67902,3727.037 86.41602,3737.183 5.71902,3882.987 "></path>
            </svg>
            <img src="${pageContext.request.contextPath}/img/ufo.png" id="scroll-mong">
            <img src="${pageContext.request.contextPath}/img/cake.png" id="cake" alt="cake">
            <p id="born">Born!<br><span>1998.01.08</span></p>
            <img src="${pageContext.request.contextPath}/img/confetti.png" id="confetti" alt="confetti">
            <div id="family">
                <p>1남1녀 중 막내로 화목한 가정에서 부모님의 가르침대로...</p>
                <img src="${pageContext.request.contextPath}/img/house (2).png" id="house" alt="house">
            </div>
            <img src="${pageContext.request.contextPath}/img/enfp.png" id="enfp" alt="enfp">
            <img src="${pageContext.request.contextPath}/img/aura.png" id="aura" alt="aura">
            <p id="personality">Extroverted<br>and Curious</p>
            <img src="${pageContext.request.contextPath}/img/books.png" id="school" alt="school">
            <p id="grad">흑석초,중대부중,동덕여고...</p>
            <p id="finally">And finally...</p>   
        </div>
    </section>
    <script>
        gsap.to("#scroll-mong", {
          motionPath:{
            path: "#road-path-target",
            align: "#road-path-target",
            alignOrigin: [0.5, 0.5],
          },
          scrollTrigger:{
              trigger:"#road-path-target",
              start:"top top",
              scrub:2,
          }
        });    

        gsap.to('#confetti',{
            scrollTrigger:{
                trigger:"#confetti",
                start:"top center",
                scrub:1
            },
            opacity:1
        });

        gsap.to('#cake',{
            scrollTrigger:{
                trigger:"#confetti",
                start:"top center",
                scrub:1
            },
            scale:1.3
        });

        gsap.to('#born',{
            scrollTrigger:{
                trigger:"#confetti",
                start:"top center",
                scrub:1
            },
            y:10
        });

        gsap.to('#family p',{
            scrollTrigger:{
                trigger:"#house",
                start:"top center",
                scrub:1
            },
            x:-800
        });

        gsap.to('#house',{
            scrollTrigger:{
                trigger:"#house",
                start:"top center",
                scrub:1
            },
            scale:1.3
        });

        gsap.to('#aura',{
            scrollTrigger:{
                trigger:"#enfp",
                start:"top center",
                scrub:1
            },
            scale:2.1
        });

        gsap.to('#enfp',{
            scrollTrigger:{
                trigger:"#enfp",
                start:"top center",
                scrub:1
            },
            scale:1.3
        });

        gsap.to('#school',{
            scrollTrigger:{
                trigger:"#school",
                start:"top center",
                scrub:1
            },
            scale:1.3
        });

        gsap.to('#grad',{
            scrollTrigger:{
                trigger:"#school",
                start:"top center",
                scrub:1
            },
            y:15
        });

    </script>

    <section class="sec3">
        <div class="study">
            <img src="${pageContext.request.contextPath}/img/glow.png" id="glow" alt="glow">
            <img src="${pageContext.request.contextPath}/img/glow2.png" id="glow2" alt="glow2">
            <p id="istarted">I started</p>
            <p id="programming">learning programming</p>
            <img src="${pageContext.request.contextPath}/img/laptop.png" id="laptop" alt="laptop">
            <img src="${pageContext.request.contextPath}/img/ufo.png" id="guide" alt="mongja">
            <p id="intro">I'll show you her results,<br>Follow ME !</p>
            <c:forEach items="${list}" var="b" begin="0" end="3" varStatus="cno">
	            <a href="gallery/detail?bno=${b.bno}&pageNum=1">
	                <div id="content${cno.count}">
	                	<div>
	                    <img src="${pageContext.request.contextPath}/display?filename=${b.attachs[0].path}/s_${b.attachs[0].uuid}" alt="갤러리사진">
	                    </div>
	                    <p><c:out value="${b.title}" escapeXml="true"/></p>
	                    <p><c:out value="${b.content}" escapeXml="true"/></p>
	                </div>
	            </a>
            </c:forEach>
            <img src="${pageContext.request.contextPath}/img/earth.png" id="earth2" alt="earth">
        </div>

    </section>

    <script>
        gsap.to('#laptop',{
            scrollTrigger:{
                trigger:"#istarted",
                start:"top center+=50px",
                scrub:1,
            },
            opacity:1,
            scale:1.2
        });
        
        gsap.to('#istarted',{
            scrollTrigger:{
                trigger:"#istarted",
                start:"top center+=50px",
                scrub:1
            },
            opacity:1
        });

        gsap.to('#programming',{
            scrollTrigger:{
                trigger:"#istarted",
                start:"top center+=50px",
                scrub:1
            },
            opacity:1
        });

        gsap.to('#laptop',{
            scrollTrigger:{
                trigger:'#laptop',
                start:'top center-=240px',
                end:"60px top",
                pin:true
            }
        });


        gsap.to('#guide',{
            scrollTrigger:{
                trigger:'#guide',
                start:'top-=10px center',
                end:'+=100px',
                scrub:true
            },
            scale:30,
            opacity:1
        });

        gsap.to('#guide',{
            scrollTrigger:{
                trigger:'#guide',
                start:'top+=110px center',
                end:"4050px top",
                pin:true,
            },
        });

        gsap.to('#intro',
            {keyframes: [
                {
                  opacity: 1,
                  duration: 1,
                },
                {
                  opacity: 0,
                  duration: 1
                }
            ],
            scrollTrigger:{
                trigger:'#intro',
                start:'top center-=50px',
                end:'+=290px',
                scrub:1
            }
        })

        gsap.to('#intro',{
            scrollTrigger:{
                trigger:'#intro',
                start:'top center-=150px',
                end:'+=330px',
                pin:true,
            }
        })

        gsap.to('#content1',{
            scrollTrigger:{
                trigger:"#content1",
                start:"top bottom",
                scrub:1
            },
            opacity:1
        });

        gsap.to('#content2',{
            scrollTrigger:{
                trigger:"#content2",
                start:"top bottom",
                scrub:1
            },
            opacity:1
        });

        gsap.to('#content3',{
            scrollTrigger:{
                trigger:"#content3",
                start:"top bottom",
                scrub:1
            },
            opacity:1
        });

        gsap.to('#content4',{
            scrollTrigger:{
                trigger:"#content4",
                start:"top bottom",
                scrub:1
            },
            opacity:1
        });
    </script>
    <section class="sec4">
        <p>contact : happyunjj@gmail.com or VISITOR on nav</p>
    </section>
</body>
</html>