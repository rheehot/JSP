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
    <title>Document</title>
  </head>
  <body>
    <% String isError = (String) session.getAttribute("passwordError");
      String userEmail= (String) session.getAttribute("user.email");
      String isAdmin = (String) session.getAttribute("isAdmin"); %>
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
      <div class="nav__item">
        <div class="nav__box" id="help">
          <i class="fas fa-question"></i>
          <span class="nav__text">도움말</span>
        </div>
        <form action="./whatsNew.jsp">
            <input type="hidden">
        </form>
      </div>s
    </nav>
    <main id="login">
      <div class="login__column">
        <a href="./index.jsp"> <i class="fab fa-audible fa-3x"></i></a>
      </div>
      <div class="login__column" id="isError">
        <span>polyMovie에 로그인</span>
      </div>
      <div class="login__column">
        <form action="./jsp/handleLogin.jsp" method="post">
          <div class="login__form__box">
            <label for="email">Email address</label>
            <input type="email" name="email" required />
            <label for="password">Password</label>
            <input type="password" name="password" required />
            <input type="submit" value="로그인" />
          </div>
        </form>
      </div>
      <div class="login__column">
        <div class="login__signIn__box">
          <span>처음이신가요? <a href="./signIn.jsp">회원가입.</a></span>
        </div>
      </div>
    </main>
    <script src="./assets/js/header.js"></script>
    <script src="./assets/js/nav.js"></script>
    <script src="assets/js/search.js"></script>
    <script src="./assets/js/util.js"></script>
    <script>
      headerUserChange("<%=userEmail%>", "<%=isAdmin%>");
      const isError = "<%= isError %>";
      if (isError === "true") {
        const target = document.getElementById("isError");
        const p = document.createElement("p");
        p.innerText = "로그인 정보가 일치하지 않습니다.";
        target.appendChild(p);
      }
    </script>
  </body>
</html>
