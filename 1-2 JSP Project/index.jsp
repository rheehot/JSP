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
    session.removeAttribute("loginError"); %>
    <header></header>
    <nav></nav>
    <div class="loaderContainer" id="indicator"></div>
    <main id="home">
      <div class="networkError">Network Error</div>
    </main>
    <script src="./assets/js/defaultView.js"></script>
    <script src="./assets/js/loader.js"></script>
    <script src="./assets/js/util.js"></script>
    <script>
      headerUserChange("<%=userEmail%>", "<%=isAdmin%>");
      (async function() {
        if ("<%=userEmail%>" !== "null") {
          try {
            let similar = null;
            let randomMovie = null;
            const { results: nowPlaying } = await getNowPlaying();
            const { results: popular } = await getPopular();
            const { results: topRated } = await getTopRated();
            const { results: upcoming } = await getUpcoming();
            while (true) {
              randomMovie = nowPlaying[Math.floor(Math.random() * 20)];
              similar = await getSimilar(randomMovie.id);
              if (similar.results.length !== 0) break;
            }
            paintPosters(
              similar.results,
              randomMovie.title + "와(과) 비슷한 영화",
              "",
              true
            );
            paintPosters(nowPlaying, "현재 상영 중", "nowPlaying");
            paintPosters(upcoming, "개봉 예정", "upComing");
            paintPosters(popular, "인기있는", "popular");
            paintPosters(topRated, "높은 평점", "topRated");
            const clickable = document.querySelectorAll(
              ".main__contents__item"
            );
            const moreBtn = document.querySelectorAll(".more__box__text");
            clickable.forEach(item => {
              item.addEventListener("click", e =>
                e.currentTarget.lastChild.submit()
              );
            });
            moreBtn.forEach(item =>
              item.addEventListener("click", e => e.target.nextSibling.submit())
            );
          } catch (e) {
            console.log(e);
            document.querySelector(".networkError").style.display = "flex";
          } finally {
            hideSpinner(".loaderContainer");
          }
        } else {
          try {
            const { results: nowPlaying } = await getNowPlaying();
            const { results: popular } = await getPopular();
            const { results: topRated } = await getTopRated();
            const { results: upcoming } = await getUpcoming();
            paintPosters(nowPlaying, "현재 상영 중", "nowPlaying");
            paintPosters(upcoming, "개봉 예정", "upComing");
            paintPosters(popular, "인기있는", "popular");
            paintPosters(topRated, "높은 평점", "topRated");
            const clickable = document.querySelectorAll(
              ".main__contents__item"
            );
            const moreBtn = document.querySelectorAll(".more__box__text");
            clickable.forEach(item => {
              item.addEventListener("click", e =>
                e.currentTarget.lastChild.submit()
              );
            });
            moreBtn.forEach(item =>
              item.addEventListener("click", e => e.target.nextSibling.submit())
            );
          } catch (e) {
            console.log(e);
            document.querySelector(".networkError").style.display = "flex";
          } finally {
            hideSpinner(".loaderContainer");
          }
        }
      })();
    </script>
  </body>
</html>
