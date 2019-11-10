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
