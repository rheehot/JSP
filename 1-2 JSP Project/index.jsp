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
      <div class="nav__item">
        <div class="nav__box" id="help">
          <i class="fas fa-question"></i>
          <span class="nav__text">도움말</span>
        </div>
        <form action="./whatsNew.jsp">
            <input type="hidden">
        </form>
      </div>
    </nav>
    <div class="loaderContainer">
      <div class="sk-chase">
        <div class="sk-chase-dot"></div>
        <div class="sk-chase-dot"></div>
        <div class="sk-chase-dot"></div>
        <div class="sk-chase-dot"></div>
        <div class="sk-chase-dot"></div>
        <div class="sk-chase-dot"></div>
      </div>
    </div>
    <main id="home">
      <div class="networkError">Network Error</div>
    </main>

    <script src="./assets/js/header.js"></script>
    <script src="./assets/js/nav.js"></script>
    <script src="assets/js/search.js"></script>
    <script src="./assets/js/util.js"></script>
    <script>
      headerUserChange("<%=userEmail%>", "<%=isAdmin%>");
      (async function getData() {
        try{
          const { results: nowPlaying } = await getNowPlaying();
          const { results: popular } = await getPopular();
          const { results: topRated } = await getTopRated();
          const { results: upcoming } = await getUpcoming();
          const { results: similar } = await getSimilar(475557);
          paintPosters(similar, "내가 좋아하는 영화와 비슷한 영화 --- ( 입력 : 조커 )", "like");
          paintPosters(nowPlaying, "현재 상영 중", "nowPlaying");
          paintPosters(upcoming, "개봉 예정", "upComing");
          paintPosters(popular, "인기있는", "popular");
          paintPosters(topRated, "높은 평점", "topRated");
          const clickable = document.querySelectorAll(".main__contents__item");
          const moreBtn = document.querySelectorAll(".more__box__text");
          clickable.forEach(item => {
            item.addEventListener("click", e =>
              e.currentTarget.lastChild.submit()
            );
          });
          moreBtn.forEach(item => item.addEventListener("click", e => e.target.nextSibling.submit()));
        } catch(e) {
          console.log(e);
          document.querySelector(".networkError").style.display = "flex";
        } finally {
          hideSpinner(".loaderContainer");
        }
      })();
    </script>
  </body>
</html>
