<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<jsp:useBean id="movieMgr" class="polyMovie.MovieMgr" />
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
    isAdmin = (String) session.getAttribute("isAdmin"); String id =
    request.getParameter("id"); session.removeAttribute("loginError"); boolean
    flag = movieMgr.checkLike(id, userEmail);%>
    <header></header>
    <nav></nav>
    <div class="loaderContainer" id="indicator"></div>
    <main id="detail">
      <div class="networkError">Network Error</div>
    </main>
    <script src="./assets/js/defaultView.js"></script>
    <script src="./assets/js/loader.js"></script>
    <script src="./assets/js/api.js"></script>
    <script src="./assets/js/util.js"></script>
    <script>
      headerUserChange("<%=userEmail%>", "<%=isAdmin%>");
      const id = location.search.replace("?id=", "");
      (async function() {
        try {
          const data = await getDetail(id);
          paintDetail(data, id, "<%=userEmail%>", <%=flag%>);
          const clickable = document.querySelectorAll(".recommendations__item");
          clickable.forEach(item => {
            item.addEventListener("click", e =>
              e.currentTarget.lastChild.submit()
            );
          });
          document
            .querySelector("#js-like")
            .addEventListener("click", e =>
              e.currentTarget.parentNode.lastChild.submit()
            );
          if (document.getElementById("showHide")) {
            const showHide = document.getElementById("showHide");
            showHide.addEventListener("click", () => {
              const main = document.getElementById("recommendContents");
              if (showHide.innerText === "숨기기") {
                showHide.innerText = "표시";
                main.style.display = "none";
              } else {
                showHide.innerText = "숨기기";
                main.style.display = "flex";
              }
            });
          }
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
