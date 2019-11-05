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
    <header>
      <div class="header__column">
        <a href="./index.jsp">
          <span>
            <i class="fab fa-audible fa-2x"></i>
          </span>
        </a>
      </div>
      <div class="header__column">
        <form action="./search.html">
          <input type="text" name="term" placeholder="검색" />
        </form>
        <div class="search__box">
          <span><i class="fas fa-search"></i></span>
        </div>
      </div>
      <div class="header__column">
        <div class="header__item">
          <a href="./join.html">JOIN</a>
        </div>
        <div class="header__item">
          <a href="./login.html">LOGIN</a>
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
      <a href="#" class="nav__item">
        <div class="nav__box">
          <i class="fas fa-fire"></i>
          <span class="nav__text">인기</span>
        </div>
      </a>
      <a href="#" class="nav__item">
        <div class="nav__box">
          <i class="fas fa-clock"></i>
          <span class="nav__text">상영중</span>
        </div>
      </a>
      <a href="#" class="nav__item">
        <span class="nav__box">
          <i class="fas fa-star"></i>
          <span class="nav__text">최고평점</span>
        </a>
      </div>
      <a href="#" class="nav__item">
        <span class="nav__box">
          <i class="fas fa-exclamation"></i>
        <span class="nav__text">개봉예정</span>
      </a>
        </div>
      <a href="#" class="nav__item">
        <div class="nav__box">
          <i class="fas fa-thumbs-up"></i>
          <span class="nav__text">좋아요</span>
        </div>
      </a>
    </nav>
    <main id="home">
      <div class="sk-chase">
        <div class="sk-chase-dot"></div>
        <div class="sk-chase-dot"></div>
        <div class="sk-chase-dot"></div>
        <div class="sk-chase-dot"></div>
        <div class="sk-chase-dot"></div>
        <div class="sk-chase-dot"></div>
      </div>
    </main>

    <script src="assets/js/search.js"></script>
    <script src="./assets/js/util.js"></script>
    <script>
      (async function getData() {
        const { results: nowPlaying } = await getNowPlaying();
        const { results: popular } = await getPopular();
        const { results: topRated } = await getTopRated();
        const { results: upcoming } = await getUpcoming();
        const { results: similar } = await getSimilar(475557);
        paintPosters(similar, "내가 좋아하는 영화와 비슷한 영화");
        paintPosters(nowPlaying, "현재 상영 중");
        paintPosters(upcoming, "개봉 예정");
        paintPosters(popular, "인기있는");
        paintPosters(topRated, "높은 평점");
        const clickable = document.querySelectorAll(".main__contents__item");
        clickable.forEach(item => {
          item.addEventListener("click", e =>
            e.currentTarget.lastChild.submit()
          );
        });
        hideSpinner(".sk-chase");
      })();
    </script>
  </body>
</html>
