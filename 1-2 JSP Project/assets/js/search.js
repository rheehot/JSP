const searchBtn = document.querySelector(".search__box");

const handleClick = e => {
  if (e.target.previousElementSibling !== null)
    e.target.previousElementSibling.submit();
  if (e.target.ownerDocument.forms[0] !== null)
    e.target.ownerDocument.forms[0].submit();
};

function init() {
  searchBtn.addEventListener("click", handleClick);
}
init();
