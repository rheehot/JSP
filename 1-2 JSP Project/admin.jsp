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
    <main id="admin">
      <div class="admin__content">
        <div class="admin__column__left">
          <div class="admin__column__leftItem">
            <span class="admin__column__item__text">회원 조회</span>
          </div>
          <div class="admin__column__leftItem">
            <span class="admin__column__item__text">회원탈퇴 요청</span>
          </div>
        </div>

        <div class="admin__column__right" id="rightComponent">
          <div class="admin__column__rightItem" style="font-size: 25px;">
            회원 정보
          </div>
        </div>
      </div>
    </main>
    <script src="./assets/js/defaultView.js"></script>
    <script src="./assets/js/util.js"></script>
    <script>
      headerUserChange("<%=userEmail%>", "<%=isAdmin%>");
      const btn = document.querySelectorAll(".admin__column__leftItem");
      const rightComponent = document.getElementById("rightComponent");
      const btnClick = e => {
        rightComponent.innerText = e.target.innerText;
        rightComponent.style.fontSize = "25px";
      };
      btn.forEach(item => item.addEventListener("click", btnClick));
    </script>
  </body>
</html>
