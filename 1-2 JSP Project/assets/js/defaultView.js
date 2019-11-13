// header
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
const headerUserChange = (email, admin) => {
  if (admin === "true" && email !== "null") {
    headerChange("./admin.jsp", "Admin");
    headerChange("./jsp/handleLogout.jsp", "Logout");
  } else if (email !== "null" && admin !== "true") {
    headerChange("./profile.jsp", "Profile");
    headerChange("./jsp/handleLogout.jsp", "Logout");
  } else {
    headerChange("./login.jsp", "Sign In");
  }
};

(function() {
  const header_1 = document.createElement("div");
  const header_2 = document.createElement("div");
  const header_3 = document.createElement("div");
  const one_logoAnchor = document.createElement("a");
  const one_span = document.createElement("span");
  const two_arrowBox = document.createElement("div");
  const two_form = document.createElement("form");
  const two_input = document.createElement("input");
  const two_searchIconBox = document.createElement("div");
  const two_searchIconBoxSpan = document.createElement("span");
  const three_mobileSearchBox = document.createElement("div");
  const one_icon = document.createElement("i");
  const two_icon = document.createElement("i");
  const three_icon = document.createElement("i");

  header_1.className = "header__column";
  header_2.className = "header__column";
  header_3.className = "header__column";
  header_3.id = "loginStatus";
  header_1.id = "logo";
  one_logoAnchor.href = "./index.jsp";
  one_icon.className = "fab fa-audible fa-2x";
  two_arrowBox.className = "arrow__box";
  two_arrowBox.id = "backBtn";
  two_arrowBox.innerHTML = "<i class='fas fa-arrow-left fa-lg'></i>";
  two_form.action = "./search.jsp";
  two_form.id = "form";
  two_input.type = "text";
  two_input.name = "term";
  two_input.placeholder = "검색";
  two_input.id = "input";
  two_input.required = "true";
  two_searchIconBox.className = "search__box";
  two_searchIconBox.id = "form__btn";
  two_icon.className = "fas fa-search";
  three_mobileSearchBox.className = "mobile__search";
  three_icon.className = "fas fa-search mobile__searchIcon";

  one_span.appendChild(one_icon);
  one_logoAnchor.appendChild(one_span);
  header_1.appendChild(one_logoAnchor);
  two_form.appendChild(two_input);
  two_searchIconBoxSpan.appendChild(two_icon);
  two_searchIconBox.appendChild(two_searchIconBoxSpan);
  two_searchIconBoxSpan.appendChild(two_icon);
  two_searchIconBox.appendChild(two_searchIconBoxSpan);
  header_2.appendChild(two_arrowBox);
  header_2.appendChild(two_form);
  header_2.appendChild(two_searchIconBox);
  three_mobileSearchBox.appendChild(three_icon);
  header_3.appendChild(three_mobileSearchBox);

  const header = document.querySelector("header");
  header.appendChild(header_1);
  header.appendChild(header_2);
  header.appendChild(header_3);
})();

// nav
const navActive = term => document.getElementById(term).classList.add("active");
const navHome = () => {
  const a = document.createElement("a");
  const nav_box = document.createElement("div");
  const icon = document.createElement("i");
  const span = document.createElement("span");
  a.href = "./index.jsp";
  a.className = "nav__item";
  nav_box.className = "nav__box";
  nav_box.id = "nav_home";
  icon.className = "fas fa-home";
  span.className = "nav__text";
  span.innerText = "홈";
  nav_box.appendChild(icon);
  nav_box.appendChild(span);
  a.appendChild(nav_box);
  document.querySelector("nav").appendChild(a);
};
const navList = (iconName, title, navPath, id) => {
  const nav_item = document.createElement("div");
  const nav_box = document.createElement("div");
  const navIcon = document.createElement("i");
  const span = document.createElement("span");
  const form = document.createElement("form");
  const input = document.createElement("input");
  nav_item.className = "nav__item";
  nav_box.className = "nav__box";
  nav_box.id = navPath;
  navIcon.className = iconName;
  span.className = "nav__text";
  span.innerText = title;
  form.action = "./list.jsp";
  input.type = "hidden";
  input.name = "title";
  input.value = id;
  nav_box.appendChild(navIcon);
  nav_box.appendChild(span);
  form.appendChild(input);
  nav_item.appendChild(nav_box);
  nav_item.appendChild(form);
  nav_item.addEventListener("click", e =>
    e.currentTarget.lastElementChild.submit()
  );
  document.querySelector("nav").appendChild(nav_item);
};
const navHelp = () => {
  const nav_item = document.createElement("div");
  const nav_box = document.createElement("div");
  const navIcon = document.createElement("i");
  const span = document.createElement("span");
  const form = document.createElement("form");
  const input = document.createElement("input");
  nav_item.className = "nav__item";
  nav_box.className = "nav__box";
  nav_box.id = "nav_help";
  navIcon.className = "fas fa-question";
  span.className = "nav__text";
  span.innerText = "도움말";
  form.action = "./whatsNew.jsp";
  input.type = "hidden";
  input.name = "title";
  input.value = "help";
  nav_box.appendChild(navIcon);
  nav_box.appendChild(span);
  form.appendChild(input);
  nav_item.appendChild(nav_box);
  nav_item.appendChild(form);
  nav_item.addEventListener("click", e =>
    e.currentTarget.lastElementChild.submit()
  );
  document.querySelector("nav").appendChild(nav_item);
};

(function() {
  navHome();
  navList("fas fa-fire", "인기", "nav_popular", "popular");
  navList("fas fa-clock", "상영중", "nav_nowPlaying", "nowPlaying");
  navList("fas fa-star", "높은평점", "nav_topRated", "topRated");
  navList("fas fa-exclamation", "개봉예정", "nav_upComing", "upComing");
  navList("fas fa-thumbs-up", "좋아요", "nav_like", "like");
  navHelp();
  if (location.pathname.includes("index") === true) {
    navActive("nav_home");
  }
  if (location.search.includes("popular") === true) {
    navActive("nav_popular");
  }
  if (location.search.includes("nowPlaying") === true) {
    navActive("nav_nowPlaying");
  }
  if (location.search.includes("topRated") === true) {
    navActive("nav_topRated");
  }
  if (location.search.includes("upComing") === true) {
    navActive("nav_upComing");
  }
  if (location.search.includes("like") === true) {
    navActive("nav_like");
  }
  if (location.href.includes("help") === true) {
    navActive("nav_help");
  }
})();

// search
const searchBtn = document.querySelector(".search__box");
const mobileSearchBtn = document.querySelector(".mobile__search");
const mobileBackBtn = document.querySelector("#backBtn");
const header__form = document.getElementById("form");
const header__btn = document.getElementById("form__btn");
const header__logo = document.getElementById("logo");
const header__menu = document.getElementById("loginStatus");
const header__backBtn = document.getElementById("backBtn");

let isClicked = false;

const handleClick = e => {
  if (e.target.previousElementSibling !== null) {
    if (!e.target.previousElementSibling["0"].value) {
      alert("검색어를 입력하세요");
      return;
    }
    e.target.previousElementSibling.submit();
  }

  if (e.target.ownerDocument.forms[0] !== null) {
    if (!e.currentTarget.previousElementSibling.firstElementChild.value) {
      alert("검색어를 입력하세요");
      return;
    }
    e.target.ownerDocument.forms[0].submit();
  }
  header__form.style.display = "none";
  header__btn.style.display = "none";
};
const mobileHandleClick = e => {
  e.preventDefault();
  const afterClick = () => {
    isClicked = true;
    header__btn.style.display = "flex";
    header__logo.style.display = "none";
    header__backBtn.style.display = "flex";
    header__form.style.display = "flex";
    header__menu.style.display = "none";
    document.getElementById("input").focus();
  };
  const restore = () => {
    isClicked = false;
    header__btn.style.display = "none";
    header__logo.style.display = "flex";
    header__backBtn.style.display = "none";
    header__form.style.display = "none";
    header__menu.style.display = "flex";
  };
  if (isClicked === false) {
    afterClick();
  } else {
    restore();
  }
};
(function() {
  searchBtn.addEventListener("click", handleClick);
  mobileSearchBtn.addEventListener("click", mobileHandleClick);
  mobileBackBtn.addEventListener("click", mobileHandleClick);
})();
