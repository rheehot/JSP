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
    isAdmin = (String) session.getAttribute("isAdmin");
    session.removeAttribute("loginError"); String username = (String)
    session.getAttribute("userName"); String json =
    movieMgr.getLikedMovies().toString(); %>
    <header></header>
    <nav></nav>
    <main id="profile">
      <div class="profile__header__bg">
        <div class="profile__header">
          <div class="profile__header__user">
            <img
              src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQMrDSID-vaFd-fdIEZO2aKop4Zs9qipuCO13bBz9mQkTURZ489"
              alt="profile-Image"
              class="profile__img"
            />
            <span class="header__username">
              <%=username %>
            </span>
          </div>
          <div class="profile__header__nav">
            <ul>
              <li class="active">좋아요</li>
            </ul>
          </div>
        </div>
      </div>
      <div class="profile__contentsContainer">
        <div class="contents__wrapper">
          <span class="contents__title">좋아요 한 영화</span>
          <div class="likeList__container" id="likeTarget"></div>
        </div>
      </div>
    </main>
    <script src="./assets/js/defaultView.js"></script>
    <script src="./assets//js/api.js"></script>
    <script src="./assets/js/util.js"></script>
    <script>
      headerUserChange("<%=userEmail%>", "<%=isAdmin%>");
      const data = <%=json%>;
      data.filter(item => item.email === "<%=userEmail%>").forEach(async item => {
        const data = await getDetail(item.id);
        const likeListItem = document.createElement("div");
        const likeListImage = document.createElement("img");
        const likeListTitle = document.createElement("span");
        const a = document.createElement("a");

        likeListItem.className = "likeList__item";
        likeListImage.className = "likeList__img";
        likeListTitle.className = "likeList__title";
        a.href = "./detail.jsp?id="+data.id;
        likeListImage.src = "https://image.tmdb.org/t/p/w300"+data.poster_path;
        likeListTitle.innerText = (data.title.length > 10 ? data.title.substring(0, 10) + "..." : data.title);
        likeListItem.appendChild(likeListImage);
        likeListItem.appendChild(likeListTitle);
        a.appendChild(likeListItem);
        document.querySelector("#likeTarget").appendChild(a);
      });
    </script>
  </body>
</html>
