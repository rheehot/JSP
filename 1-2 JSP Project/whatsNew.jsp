<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <script
      defer
      src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"
    ></script>
    <link rel="stylesheet" href="./assets/css/styles.css" />
    <style>
        b{
            font-weight: 600; 
            color: peru;
        }
        p:not(:last-child){
            margin-bottom: 20px;
        }
    </style>
    <title>Document</title>
  </head>
  <body>
    <%
    String userEmail= (String) session.getAttribute("user.email");
    String isAdmin = (String) session.getAttribute("isAdmin");
  	session.removeAttribute("passwordError");
  	%>
    <header>
      <div class="header__column" id="logo">
        <a href="./index.jsp">
          <span>
            <i class="fab fa-audible fa-2x"></i>
          </span>
        </a>
      </div>
      <div class="header__column">
        <div class="arrow__box" id="backBtn">
          <i class="fas fa-arrow-left fa-lg"></i>
        </div>
        <form action="./search.jsp" id="form">
          <input type="text" name="term" placeholder="검색" id="input" required />
        </form>
        <div class="search__box" id="form__btn">
          <span><i class="fas fa-search"></i></span>
        </div>
      </div>
      <div class="header__column" id="loginStatus">
        <div class="mobile__search">
          <i class="fas fa-search mobile__searchIcon"></i>
        </div>
      </div>
    </header>
    <nav>
      <a href="./index.jsp" class="nav__item">
        <div class="nav__box">
          <i class="fas fa-home"></i>
          <span class="nav__text">홈</span>
        </div>
      </a>
      <div class="nav__item">
        <div class="nav__box" id="popular">
          <i class="fas fa-fire"></i>
          <span class="nav__text">인기</span>
        </div>
        <form action="./list.jsp">
            <input type="hidden" name="title" value="popular">
        </form>
      </div>
      <div class="nav__item">
        <div class="nav__box" id="nowPlaying">
          <i class="fas fa-clock"></i>
          <span class="nav__text">상영중</span>
        </div>
        <form action="./list.jsp">
            <input type="hidden" name="title" value="nowPlaying">
        </form>
      </div>
      <div class="nav__item">
        <div class="nav__box" id="topRated">
          <i class="fas fa-star"></i>
          <span class="nav__text">높은평점</span>
        </div>
        <form action="./list.jsp">
            <input type="hidden" name="title" value="topRated">
        </form>
      </div>
      <div class="nav__item">
        <div class="nav__box" id="upComing">
          <i class="fas fa-exclamation"></i>
          <span class="nav__text">개봉예정</span>
        </div>
        <form action="./list.jsp">
            <input type="hidden" name="title" value="upComing">
        </form>
      </div>
        </div>
      <div class="nav__item">
        <div class="nav__box" id="like">
          <i class="fas fa-thumbs-up"></i>
          <span class="nav__text">좋아요</span>
        </div>
        <form action="./list.jsp">
            <input type="hidden" name="title" value="like">
        </form>
      </div>
    </nav>
    <main id="whatsNew" style="color: #eee; padding-top: 30px;">
        <h1 style="font-size: 40px; margin-bottom: 25px;">What's new?</h1>
        <div class="contents">
            <p><b style="color: orangered">주의사항 : </b>구형 브라우저에서 동작하지 않습니다.</p>
            <p><b style="color: orangered;">Developing stuff : </b>Detail, My Profile</p>
            <p><b>Used stacks : </b>HTML5, CSS3, ES6 (Not used CSS Framework)</p>
            <p><b>Responsive Web : </b>브라우저를 창모드로 바꾼 뒤, 가로크기를 줄여보세요. 끝까지 줄인 다음, 검색 버튼을 눌러보세요.</p>
            <p><b>Responsive Web 2 : </b>영화 리스트를 브라우저 크기에 따라 최적의 상태로 보여줍니다.</p>
            <p><b>Login : </b> 로그인 기능</p>
            <p><b>Admin and user : </b> admin으로 로그인 시, profile 대신 admin 바로가기 제공</p>
            <p><b>Search : </b>영어, 한글검색 지원</p>
            <p><b>Navigation bar : </b> Home에서 더보기로 접근하는 대신, 바로 접근하세요.</p>
            <p><b>Indicator : </b>Data를 fetching하는 동안 로딩화면을 보여줍니다.</p>
            <div class="authBox" style="display: flex; flex-direction: column; justify-content: center; align-items: center;">
                <div class="authBox__column" style="margin-bottom: 15px;">
                    <b style="font-size: 20px;">로그인 (Test)</b>
                </div>
                <div class="authBox__column" style="display: flex; flex-direction: column;">
                    <span style="margin-bottom: 10px;">admin@email.com / 1234</span>
                    <span>user@email.com / 1234</span>
                </div>
            </div>
        </div>
        <footer style="display: flex; flex-direction: column; justify-content: center; align-items: center; margin-top: 50px; color: #eee;">
            <span style="font-size: 20px; margin-bottom: 20px;">궁금한 것은 질문하시면 답변 해드리겠습니다.</span>
            <!-- <span style="font-size: 17px;">개인적인 프로젝트 관련 상담도 받습니다.</span> -->
        </footer>
    </main>
    
    <script src="./assets/js/header.js"></script>
    <script src="./assets/js/nav.js"></script>
    <script src="assets/js/search.js"></script>
    <script src="./assets/js/util.js"></script>
    <script>
        headerUserChange("<%=userEmail%>", "<%=isAdmin%>");
    </script>
  </body>
</html>
