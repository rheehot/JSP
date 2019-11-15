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
    <style>
      b {
        font-weight: 600;
        color: peru;
      }
      p:not(:last-child) {
        margin-bottom: 20px;
      }
    </style>
    <title>Document</title>
  </head>
  <body>
    <% String userEmail= (String) session.getAttribute("user.email"); String
    isAdmin = (String) session.getAttribute("isAdmin");
    session.removeAttribute("loginError"); %>
    <header></header>
    <nav></nav>
    <main id="whatsNew" style="color: #eee; padding-top: 30px;">
      <h1 style="font-size: 40px; margin-bottom: 25px;">What's new?</h1>
      <div class="contents">
        <p>
          <b style="color: orangered">주의사항 : </b>구형 브라우저에서 동작하지
          않습니다.
        </p>
        <p>
          <b>사용 기술 : </b>HTML5, CSS3, ES6
          <b>[ *CSS 프레임워크, jQuery, 템플릿 미사용 ]</b>
        </p>
        <p>
          <b>ES6이란? : </b> 최신 문법의 JavaScript, 같은 의미의 명칭으로는
          'Vanilla JS', 'Modern JS', 'Pure JS'가 있다.
        </p>
        <p>
          <b>반응형 웹 : </b>모바일 UI 적용 → 브라우저 가로 크기를 줄여보세요
        </p>
        <p><b>로그인 : </b>DB연결 완료</p>
        <p>
          <b>권한 부여 : </b> admin으로 로그인 시, profile 대신 admin 바로가기
          제공
        </p>
        <p><b>검색 : </b>영어, 한글검색 지원</p>
        <p>
          <b>Navigation bar : </b> Home에서 더보기로 접근하는 대신, 바로
          접근하세요.
        </p>
        <p>
          <b>Indicator : </b>Data를 fetching하는 동안 로딩화면을 보여줍니다.
          로딩이 끝나면 Fade In 효과
        </p>
        <div
          class="authBox"
          style="display: flex; flex-direction: column; justify-content: center; align-items: center;"
        >
          <div class="authBox__column" style="margin-bottom: 15px;">
            <b style="font-size: 20px;">로그인 (admin)</b>
          </div>
          <div
            class="authBox__column"
            style="display: flex; flex-direction: column;"
          >
            <span style="margin-bottom: 10px;">admin@email.com / 1234</span>
          </div>
        </div>
      </div>
      <footer
        style="display: flex; flex-direction: column; justify-content: center; align-items: center; margin-top: 30px; color: #eee;"
      >
        <span style="font-size: 20px;"
          >궁금한 것은 질문하시면 답변 해드리겠습니다.</span
        >
      </footer>
    </main>
    <script src="./assets/js/defaultView.js"></script>
    <script>
      headerUserChange("<%=userEmail%>", "<%=isAdmin%>");
    </script>
  </body>
</html>
