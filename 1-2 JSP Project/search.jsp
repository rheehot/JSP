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
  	<%
      String userEmail= (String) session.getAttribute("user.email");
      String isAdmin = (String) session.getAttribute("isAdmin");
  		session.removeAttribute("passwordError");
  	%>
    <header>
      <div class="header__column">
        <a href="./index.jsp">
          <span>
            <i class="fab fa-audible fa-2x"></i>
          </span>
        </a>
      </div>
      <div class="header__column">
        <form action="./search.jsp">
          <input type="text" name="term" placeholder="검색" />
        </form>
        <div class="search__box">
          <span><i class="fas fa-search"></i></span>
        </div>
      </div>
      <div class="header__column" id="loginStatus">
        
      </div>
    </header>
    <nav>
      <a href="./index.jsp" class="nav__item">
        <div class="nav__box">
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
    <main id="search">
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
      if(isAdmin === "true" && loggedUser !== "null"){
        headerChange("./admin.jsp", "Admin");
        headerChange("./jsp/handleLogout.jsp", "Logout");
      } else if(loggedUser !== "null" && isAdmin !== "true") {
        headerChange("./profile.html", "My Profile");
        headerChange("./jsp/handleLogout.jsp", "Logout");
      }else {
        headerChange("./login.jsp", "Sign In");
      }
      (async function getSearch() {
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
        hideSpinner(".sk-chase");
      })();
    </script>
  </body>
</html>