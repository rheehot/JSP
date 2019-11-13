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
