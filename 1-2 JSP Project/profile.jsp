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
    <% String userEmail= (String) session.getAttribute("user.email"); String
    isAdmin = (String) session.getAttribute("isAdmin");
    session.removeAttribute("passwordError"); %>
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
      <div class="nav__box active">
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
    <main id="detail">
      <div class="sk-chase">
        <div class="sk-chase-dot"></div>
        <div class="sk-chase-dot"></div>
        <div class="sk-chase-dot"></div>
        <div class="sk-chase-dot"></div>
        <div class="sk-chase-dot"></div>
        <div class="sk-chase-dot"></div>
      </div>
      <span style="margin-left: 20px;">Building</span>
      <div class="content">
        <div class="detail__content__cover" id="poster"></div>
        <div class="detail__content__data">
          <div class="detail__content__data__titleBox">
            <div class="detail__content__data__title" id="title">
              data.title
            </div>
            <div class="detail__content__data__likeBox">
              <div class="detail__content__data__like">likeBtn |</div>
              <div class="detail__content__data__disLike">|dislikeBtn</div>
            </div>
          </div>

          <div class="detail__content__data__description" id="description">
            data.description
          </div>
          <div class="detail__content__data__comments">comments</div>
        </div>
      </div>
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
