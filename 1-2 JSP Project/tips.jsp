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
    <header></header>
    <nav></nav>

    <main id="tip" style="opacity: 1;">
      <div class="networkError">Network Error</div>
      <div class="content">
        <div class="content_header">
          <a class="active" id="header_seat" href="#" onclick="seat();">자석</a>
          <a href="#" id="header_etiquette" onclick="etiquette();">에티켓</a>
          <hr />
        </div>
        <div class="content_body">
          <div class="seat" id="seat">
            <img src="./assets/images/seat.png" />
            <div class="content">
              <p style="color: #FF8000;">
                <i class="fas fa-couch" style="color: #FF8000;"></i> 한국 영화
                명당자리
              </p>
              <p style="color: #FF00BF;">
                <i class="fas fa-couch" style="color: #FF00BF;"></i> 외국 영화
                명당자리
              </p>
              <p style="color: #3ADF00;">
                <i class="fas fa-couch" style="color: #3ADF00;"></i> 뮤지컬,
                영상미 영화 명당자리
              </p>
              <p style="color: #2E64FE;">
                <i class="fas fa-couch" style="color: #2E64FE;"></i> IMAX,3D영화
                명당자리
              </p>
            </div>
          </div>
          <div class="etiquette hide" id="etiquette">
            <iframe
              width="728"
              height="422"
              src="https://www.youtube.com/embed/o6GPAVpeV_U"
              frameborder="0"
              allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
              allowfullscreen
            ></iframe>
          </div>
        </div>
      </div>
    </main>

    <script src="./assets/js/defaultView.js"></script>
    <script src="./assets/js/util.js"></script>
    <script>
      headerUserChange("<%=userEmail%>", "<%=isAdmin%>");

      var header_seat_element = document.getElementById("header_seat");
      var header_etiquette_element = document.getElementById(
        "header_etiquette"
      );
      var seat_element = document.getElementById("seat");
      var etiquette_element = document.getElementById("etiquette");

      function seat() {
        etiquette_element.classList.add("hide");
        header_seat_element.classList.add("active");
        header_etiquette_element.classList.remove("active");
        seat_element.classList.remove("hide");
      }
      function etiquette() {
        seat_element.classList.add("hide");
        header_etiquette_element.classList.add("active");
        header_seat_element.classList.remove("active");
        etiquette_element.classList.remove("hide");
      }
    </script>
  </body>
</html>
