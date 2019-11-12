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
  a.addEventListener("click", e => e.currentTarget.lastElementChild.submit());
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

function init() {
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
}
init();
