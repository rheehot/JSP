<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<jsp:useBean id="memMgr" class="polyMovie.MemberMgr" />
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
    session.removeAttribute("loginError"); String json =
    memMgr.getMemberList().toString();%>
    <header></header>
    <nav></nav>
    <main id="admin">
      <div class="admin__content">
        <div class="admin__column__left">
          <div class="admin__column__leftItem">
            <span class="admin__column__item__text">회원 조회</span>
          </div>
          <div class="admin__column__leftItem">
            <span class="admin__column__item__text">회원탈퇴</span>
          </div>
        </div>

        <div class="admin__column__right" id="rightComponent">
          <div class="admin__column__rightItem"></div>
        </div>
      </div>
    </main>
    <script src="./assets/js/defaultView.js"></script>
    <script src="./assets/js/util.js"></script>
    <script src="./assets/js/admin.js"></script>
    <script>
      const json = <%=json%>;
      users(json);
      headerUserChange("<%=userEmail%>", "<%=isAdmin%>");
      const btn = document.querySelectorAll(".admin__column__leftItem");
      const rightComponent = document.getElementById("rightComponent");
      const btnClick = e => {
        if(e.currentTarget.firstElementChild.innerText === "회원 조회"){
          reset();
          document.querySelectorAll(".admin__column__leftItem").forEach(item => item.style.backgroundColor = "#282828");
          e.currentTarget.style.backgroundColor = "rgba(187, 187, 187, 0.2)";

          users(json);
        } else if(e.currentTarget.firstElementChild.innerText === "회원탈퇴"){
          reset();
          document.querySelectorAll(".admin__column__leftItem").forEach(item => item.style.backgroundColor = "#282828");
          e.currentTarget.style.backgroundColor = "rgba(187, 187, 187, 0.2)";
          const contents = document.createElement("span");
          contents.innerText = "회원탈퇴 요청 목록";
          document.getElementById("rightComponent").appendChild(contents);
        }
      };
      btn.forEach(item => item.addEventListener("click", btnClick));
    </script>
  </body>
</html>
