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
      <h1 style="font-size: 40px; margin-bottom: 25px;">
        What's new? (11/24)
      </h1>
      <div class="contents" style="user-select: none;">
        <p>
          빨간 <b style="color: orangered">*</b> 표시는 저번 발표 후 업데이트된
          내용입니다.
        </p>
        <p>
          <b style="color: orangered">주의사항 : </b>구형 브라우저에서 동작하지
          않습니다.
        </p>
        <p><b>사용 기술 : </b>Only HTML5, CSS3, ES6 (Modern JavaScript)</p>
        <p>
          <b>반응형 웹 : </b>모바일 UI 적용 → 어떤 페이지에서든 브라우저 가로
          크기를 줄여보세요
        </p>
        <p>
          <b>권한 부여 : </b> admin으로 로그인 시, profile 대신 admin 바로가기
          제공
        </p>
        <p>
          <b>바로가기 : </b> Home에서 더보기로 접근하는 대신, 바로 접근하세요.
        </p>
        <p><b>검색 : </b>영화 영어, 한글검색 지원</p>
        <p>
          <b>상세정보 : </b>영화 목록을 클릭하면 상세정보를 보여줍니다.
          숨기기/표시 기능. (하나의 페이지로 처리)
        </p>
        <p>
          <b>로딩 : </b>Data를 fetching하는 동안 로딩화면을 보여줍니다. 로딩이
          끝나면 Fade In.
        </p>
        <p>
          <b><b style="color: orangered">*&nbsp;</b>좋아요 : </b>Detail에서
          좋아요를 누를 수 있고, Profile에서 좋아요 누른 영화들을 보여줍니다.
        </p>
        <p>
          <b><b style="color: orangered">*&nbsp;</b>Profile : </b>로그인을 하면
          Home에서 좋아요한 영화와 비슷한 영화들을 보여줍니다.
        </p>
        <p><b>컴포넌트 : </b>React의 컴포넌트 개념을 적용함.</p>
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
