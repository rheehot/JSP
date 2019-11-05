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
          <img
            src="./assets/image/logo.png"
            alt="logo"
            style="width: 130px; height: auto;"
          />
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

    <main id="detail">
      <div class="sk-chase">
        <div class="sk-chase-dot"></div>
        <div class="sk-chase-dot"></div>
        <div class="sk-chase-dot"></div>
        <div class="sk-chase-dot"></div>
        <div class="sk-chase-dot"></div>
        <div class="sk-chase-dot"></div>
      </div>
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

    <script src="./assets/js/util.js"></script>
    <script>
      (async function getData() {
        document.querySelector(".content").style.display = "none";
        const data = await getDetail(location.search.replace("?id=", ""));
        console.log(data);
        document.getElementById(
          "poster"
        ).style.backgroundImage = `https://image.tmdb.org/t/p/original${data.poster_path}`;
        document.getElementById("title").innerText = `${data.title}`;
        document.getElementById("description").innerText = `${data.overview}`;
        document.querySelector(".sk-chase").style.display = "none";
        document.querySelector(".content").style.display = "flex";
      })();
    </script>
  </body>
</html>
