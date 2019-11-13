<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
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
    <%String userEmail= (String) session.getAttribute("user.email"); String
    isAdmin = (String) session.getAttribute("isAdmin");
    session.removeAttribute("passwordError");%>
    <header></header>
    <nav></nav>
    <div class="loaderContainer" id="indicator"></div>
    <main id="list">
      <div class="networkError">Network Error</div>
    </main>
    <script src="./assets/js/header.js"></script>
    <script src="./assets/js/nav.js"></script>
    <script src="./assets/js/loader.js"></script>
    <script src="assets/js/search.js"></script>
    <script src="./assets/js/util.js"></script>
    <script>
      headerUserChange("<%=userEmail%>", "<%=isAdmin%>");
      const term = location.search.replace("?title=", "");
      (async function() {
        try {
          let results = [];
          if (term === "popular") {
            const { results: one } = await getPopular();
            const { results: two } = await getPopular(2);
            results = [...one, ...two];
            listMovies(results, "인기있는");
          } else if (term === "nowPlaying") {
            const { results: one } = await getNowPlaying();
            const { results: two } = await getNowPlaying(2);
            results = [...one, ...two];
            listMovies(results, "현재 상영 중");
          } else if (term === "topRated") {
            const { results: one } = await getTopRated();
            const { results: two } = await getTopRated(2);
            results = [...one, ...two];
            listMovies(results, "높은평점");
          } else if (term === "upComing") {
            const { results: one } = await getUpcoming();
            const { results: two } = await getUpcoming(2);
            results = [...one, ...two];
            listMovies(results, "개봉예정");
          } else if (term === "like") {
          }
          const clickable = document.querySelectorAll(".main__contents__item");
          clickable.forEach(item => {
            item.addEventListener("click", e =>
              e.currentTarget.lastChild.submit()
            );
          });
        } catch (e) {
          console.log(e);
          document.querySelector(".networkError").style.display = "flex";
        } finally {
          hideSpinner(".loaderContainer");
        }
      })();
    </script>
  </body>
</html>
