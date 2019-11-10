const navEvent = term => document.getElementById(term).classList.add("active");

function init() {
  const nav = document.querySelectorAll(".nav__item");
  nav.forEach(item =>
    item.addEventListener("click", e =>
      e.currentTarget.lastElementChild.submit()
    )
  );
}
init();
