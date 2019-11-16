const users = data => {
  const table = document.createElement("table");
  const thead = document.createElement("thead");
  const tbody = document.createElement("tbody");
  const thead_tr = document.createElement("tr");
  const th1 = document.createElement("th");
  const th2 = document.createElement("th");
  const th3 = document.createElement("th");

  th1.innerText = "Username";
  th2.innerText = "Email";
  th3.innerText = "Password";
  thead_tr.appendChild(th1);
  thead_tr.appendChild(th2);
  thead_tr.appendChild(th3);

  Array.from(data).forEach(item => {
    const td1 = document.createElement("td");
    const td2 = document.createElement("td");
    const td3 = document.createElement("td");
    const tr = document.createElement("tr");
    td1.innerText = item.userName;
    td2.innerText = item.email;
    td3.innerText = item.passcode;
    tr.appendChild(td1);
    tr.appendChild(td2);
    tr.appendChild(td3);
    tbody.appendChild(tr);
  });
  table.appendChild(thead_tr);
  table.appendChild(tbody);
  document.getElementById("rightComponent").appendChild(table);
};

const reset = () => {
  const target = document.getElementById("rightComponent");
  while (target.firstChild) {
    target.removeChild(target.firstChild);
  }
};
