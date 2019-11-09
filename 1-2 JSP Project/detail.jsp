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
          <input type="text" name="term" placeholder="검색" id="input" />
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

    <script src="./assets/js/util.js"></script>
    <script>
      const headerChange = (href, text) => {
        const target = document.getElementById("loginStatus");
        const header__item = document.createElement("div");
        const anchor = document.createElement("a");
        header__item.className = "header__item";
        anchor.href = href;
        anchor.innerText = text;
        header__item.appendChild(anchor);
        target.appendChild(header__item);
      };
      const isAdmin = "<%=isAdmin%>";
      console.log(isAdmin);
      const loggedUser = "<%=userEmail%>";
      console.log(loggedUser);
      if (isAdmin === "true" && loggedUser !== "null") {
        headerChange("./admin.jsp", "Admin");
        headerChange("./jsp/handleLogout.jsp", "Logout");
      } else if (loggedUser !== "null" && isAdmin !== "true") {
        headerChange("./profile.jsp", "My Profile");
        headerChange("./jsp/handleLogout.jsp", "Logout");
      } else {
        headerChange("./login.jsp", "Sign In");
      }
      (async function getData() {
        document.querySelector(".content").style.display = "none";
        //const data = await getDetail(location.search.replace("?id=", ""));
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
