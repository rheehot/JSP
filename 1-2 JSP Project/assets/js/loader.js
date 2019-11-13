(function() {
  const box = document.createElement("div");
  const item1 = document.createElement("div");
  const item2 = document.createElement("div");
  const item3 = document.createElement("div");
  const item4 = document.createElement("div");
  const item5 = document.createElement("div");
  const item6 = document.createElement("div");

  box.className = "sk-chase";
  item1.className = "sk-chase-dot";
  item2.className = "sk-chase-dot";
  item3.className = "sk-chase-dot";
  item4.className = "sk-chase-dot";
  item5.className = "sk-chase-dot";
  item6.className = "sk-chase-dot";

  box.appendChild(item1);
  box.appendChild(item2);
  box.appendChild(item3);
  box.appendChild(item4);
  box.appendChild(item5);
  box.appendChild(item6);

  document.getElementById("indicator").appendChild(box);
})();
