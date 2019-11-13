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
