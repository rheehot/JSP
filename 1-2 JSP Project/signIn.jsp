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

    <main id="signIn">
      <div class="signIn__border">
        <div class="signIn__column">
          <a href="./index.jsp" class="signIn__title__first">
            <span>
              <i class="fab fa-audible fa-3x"></i>
            </span>
          </a>
          <span class="signIn__title__second">Create your account</span>
        </div>
        <form
          action="./jsp/handleRegister.jsp"
          method="post"
          class="signIn__column"
        >
          <div class="signIn__inputBox">
            <label for="username"
              >Username <span class="required">*</span></label
            >
            <input type="text" name="userName" class="signIn__input" required />
          </div>
          <div class="signIn__inputBox">
            <label for="email"
              >Email address <span class="required">*</span></label
            >
            <input type="email" name="email" class="signIn__input" required />
          </div>
          <div class="signIn__inputBox">
            <label for="passcode"
              >Password <span class="required">*</span></label
            >
            <input
              type="password"
              name="passcode"
              class="signIn__input"
              required
            />
          </div>
          <div class="signIn__inputBox">
            <input type="submit" value="Join" />
          </div>
          <div class="signIn__inputBox">
            <span
              >이미 회원인가요?
              <a href="./login.jsp" class="signIn__aLogin">로그인</a></span
            >
          </div>
        </form>
      </div>
    </main>
    <script src="./assets/js/defaultView.js"></script>
    <script>
      headerUserChange("<%=userEmail%>", "<%=isAdmin%>");
    </script>
  </body>
</html>
