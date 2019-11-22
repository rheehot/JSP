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
    session.removeAttribute("loginError");
    String username = (String) session.getAttribute("userName");%>
    <header></header>
    <nav></nav>
    <main id="profile">
      <div class="profile__header__bg">
        <div class="profile__header">
          <div class="profile__header__user">
            <img
              src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQMrDSID-vaFd-fdIEZO2aKop4Zs9qipuCO13bBz9mQkTURZ489"
              alt="profile-Image"
            />
            <span class="header__username">
              <%=username %>
            </span>
          </div>
          <div class="profile__header__nav">
            <ul>
              <li class="active">좋아요</li>
              <li>item</li>
              <li>item</li>
            </ul>
          </div>
        </div>
      </div>
    </main>
    <script src="./assets/js/defaultView.js"></script>
    <script src="./assets/js/util.js"></script>
    <script>
      headerUserChange("<%=userEmail%>", "<%=isAdmin%>");
    </script>
  </body>
</html>
