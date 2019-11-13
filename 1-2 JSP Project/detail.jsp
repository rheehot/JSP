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
    <header></header>
    <nav></nav>
    <div class="loaderContainer" id="indicator"></div>
    <main id="detail">
      <div class="content">
        <div class="release">
          <span id="detail__release"></span>
        </div>
        <div class="runtime">
          <span id="detail__runtime"></span>
        </div>
        <div class="title">
          <span id="detail__title"></span>
        </div>
        <div class="posterPath">
          <span id="detail__posterPath"></span>
        </div>
        <div class="overview">
          <span id="detail__overview"></span>
        </div>
        <div class="genres">
          <span>genres : </span>
        </div>
        <div class="imdb">
          <span id="detail__imdb"></span>
        </div>
        <span style="font-size: 30px; color: peru; margin: 10px auto;">
          만드는 중
        </span>
      </div>
    </main>

    <script src="./assets/js/defaultView.js"></script>
    <script src="./assets/js/loader.js"></script>
    <script src="./assets/js/util.js"></script>
    <script>
      headerUserChange("<%=userEmail%>", "<%=isAdmin%>");
      (async function getData() {
        document.querySelector(".content").style.display = "none";
        const data = await getDetail(location.search.replace("?id=", ""));
        console.log(data);
        document.getElementById("detail__release").innerText =
          "release date : " + data.release_date;
        document.getElementById("detail__runtime").innerText =
          "runtime : " + data.runtime + " mins";
        document.getElementById("detail__title").innerText =
          "title : " + data.title;
        document.getElementById("detail__posterPath").innerText =
          "poster_path : " + data.poster_path;
        document.getElementById("detail__overview").innerText =
          "overview : " + data.overview;
        const genres = document.querySelector(".genres");
        data.genres.forEach(item => {
          const span = document.createElement("span");
          span.innerText = item.name + " ";
          genres.appendChild(span);
        });
        document.getElementById("detail__imdb").innerText =
          "imdb_id : " + data.imdb_id;
        document.querySelector(".sk-chase").style.display = "none";
        document.querySelector(".content").style.display = "flex";
      })();
    </script>
  </body>
</html>
