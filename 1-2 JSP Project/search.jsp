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
    <% String userEmail= (String) session.getAttribute("user.email"); String
    isAdmin = (String) session.getAttribute("isAdmin");
    session.removeAttribute("loginError"); %>
    <header></header>
    <nav></nav>
    <div class="loaderContainer" id="indicator"></div>
    <main id="search">
      <div class="networkError">Network Error</div>
    </main>
    <script src="./assets/js/defaultView.js"></script>
    <script src="./assets/js/loader.js"></script>
    <script src="./assets/js/util.js"></script>
    <script>
      headerUserChange("<%=userEmail%>", "<%=isAdmin%>");
      (async function() {
        try {
          const term = location.search.replace("?term=", "");
          const searchTerm = decodeURIComponent(term);
          const { results } = await getSearchMovies(term);
          searchMovies(results, searchTerm);
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
