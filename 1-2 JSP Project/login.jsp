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
    <% String isError = (String) session.getAttribute("passwordError"); String
    userEmail= (String) session.getAttribute("user.email"); String isAdmin =
    (String) session.getAttribute("isAdmin"); %>
    <header></header>
    <nav></nav>
    <main id="login">
      <div class="login__column">
        <a href="./index.jsp"> <i class="fab fa-audible fa-3x"></i></a>
      </div>
      <div class="login__column" id="isError">
        <span>polyMovie에 로그인</span>
      </div>
      <div class="login__column">
        <form action="./jsp/handleLogin.jsp" method="post">
          <div class="login__form__box">
            <label for="email">Email address</label>
            <input type="email" name="email" required />
            <label for="password">Password</label>
            <input type="password" name="password" required />
            <input type="submit" value="로그인" />
          </div>
        </form>
      </div>
      <div class="login__column">
        <div class="login__signIn__box">
          <span>처음이신가요? <a href="./signIn.jsp">회원가입.</a></span>
        </div>
      </div>
    </main>
    <script src="./assets/js/defaultView.js"></script>
    <script>
      headerUserChange("<%=userEmail%>", "<%=isAdmin%>");
      const isError = "<%= isError %>";
      if (isError === "true") {
        const target = document.getElementById("isError");
        const p = document.createElement("p");
        p.innerText = "로그인 정보가 일치하지 않습니다.";
        target.appendChild(p);
      }
    </script>
  </body>
</html>
