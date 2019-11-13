const key = "87bdf1c229a761bf9f16745293c2fc6c";
const getDetail = id =>
  fetch(
    `https://api.themoviedb.org/3/movie/${id}?api_key=${key}&language=ko-kor`
  )
    .then(res => res.json())
    .then(data => data);
const getSearchMovies = (term, page = 1) =>
  fetch(
    `https://api.themoviedb.org/3/search/movie?api_key=${key}&language=ko-kor&query=${term}&page=${page}&include_adult=false&region=kr`
  )
    .then(res => res.json())
    .then(data => data);
const getNowPlaying = (page = 1) =>
  fetch(
    `https://api.themoviedb.org/3/movie/now_playing?api_key=${key}&language=ko-kor&page=${page}&region=KR`
  )
    .then(res => res.json())
    .then(data => data);
const getPopular = (page = 1) =>
  fetch(
    `https://api.themoviedb.org/3/movie/popular?api_key=${key}&language=ko-kor&page=${page}&region=KR`
  )
    .then(res => res.json())
    .then(data => data);
const getTopRated = (page = 1) =>
  fetch(
    `https://api.themoviedb.org/3/movie/top_rated?api_key=${key}&language=ko-kor&page=${page}&region=KR`
  )
    .then(res => res.json())
    .then(data => data);
const getUpcoming = (page = 1) =>
  fetch(`
https://api.themoviedb.org/3/movie/upcoming?api_key=${key}&language=ko-kor&page=${page}&region=KR`)
    .then(res => res.json())
    .then(data => data);
const getSimilar = (id, page = 1) =>
  fetch(
    `https://api.themoviedb.org/3/movie/${id}/similar?api_key=${key}&language=ko-kor&page=${page}`
  )
    .then(res => res.json())
    .then(data => data);
const paintPosters = (data, str, title) => {
  const mainColumn = document.createElement("div");
  const mainSectionText = document.createElement("span");
  const mainContents = document.createElement("div");
  const moreBox = document.createElement("div");
  const more = document.createElement("span");
  const hr = document.createElement("hr");
  const form = document.createElement("form");
  const input = document.createElement("input");
  const main = document.querySelector("main");
  mainContents.className = "main__contents";
  mainColumn.className = "main__column";
  mainSectionText.className = "main__sectionText";
  mainSectionText.innerText = str;
  moreBox.className = "more__box";
  more.className = "more__box__text";
  more.innerText = "더보기";
  form.action = "./list.jsp";
  input.type = "hidden";
  input.name = "title";
  input.value = title;
  data.slice(0, 8).forEach(item => {
    const mainContentsItem = document.createElement("div");
    const mainContentsImgBox = document.createElement("div");
    const posterImage = document.createElement("img");
    const mainContentsTextbox = document.createElement("div");
    const star = document.createElement("i");
    const mainContentsImgBoxText = document.createElement("span");
    const title = document.createElement("span");
    const mainContentsForm = document.createElement("form");
    const mainContentsFormInput = document.createElement("input");
    mainContentsItem.className = "main__contents__item";
    mainContentsItem.id = `${item.id}`;
    mainContentsImgBox.className = "main__contents__imgBox";
    posterImage.src = `https://image.tmdb.org/t/p/w300${item.poster_path}`;
    mainContentsTextbox.className = "main__contents__textBox";
    star.className = "fas fa-star";
    mainContentsImgBoxText.className = "main__contents__imgBox__text";
    mainContentsImgBoxText.innerText = `${item.vote_average} / 10`;
    title.innerText = `${
      item.title.length > 8 ? `${item.title.substring(0, 10)}...` : item.title
    }`;
    title.className = "posterTitle";
    mainContentsForm.action = "./detail.jsp";
    mainContentsFormInput.type = "hidden";
    mainContentsFormInput.name = "id";
    mainContentsFormInput.value = `${item.id}`;
    mainContentsTextbox.appendChild(star);
    mainContentsTextbox.appendChild(mainContentsImgBoxText);
    mainContentsImgBox.appendChild(posterImage);
    mainContentsImgBox.appendChild(mainContentsTextbox);
    mainContentsForm.appendChild(mainContentsFormInput);
    mainContentsItem.appendChild(mainContentsImgBox);
    mainContentsItem.appendChild(title);
    mainContentsItem.appendChild(mainContentsForm);
    mainContents.appendChild(mainContentsItem);
  });
  form.appendChild(input);
  moreBox.appendChild(more);
  moreBox.appendChild(form);
  mainColumn.appendChild(mainSectionText);
  mainColumn.appendChild(mainContents);
  mainColumn.appendChild(moreBox);
  mainColumn.appendChild(hr);
  main.appendChild(mainColumn);
};
const searchMovies = (data, str) => {
  const mainColumn = document.createElement("div");
  const mainSectionText = document.createElement("span");
  const mainContents = document.createElement("div");
  const message = document.createElement("span");
  const main = document.querySelector("main");
  mainContents.className = "main__contents";
  mainColumn.className = "main__column";
  mainSectionText.className = "main__sectionText";
  mainSectionText.innerText = `${str} 의 검색결과`;
  data.forEach(item => {
    const mainContentsItem = document.createElement("div");
    const mainContentsImgBox = document.createElement("div");
    const posterImage = document.createElement("img");
    const mainContentsTextbox = document.createElement("div");
    const star = document.createElement("i");
    const mainContentsImgBoxText = document.createElement("span");
    const title = document.createElement("span");
    const mainContentsForm = document.createElement("form");
    const mainContentsFormInput = document.createElement("input");
    mainContentsItem.className = "main__contents__item";
    mainContentsItem.id = `${item.id}`;
    mainContentsImgBox.className = "main__contents__imgBox";
    posterImage.src =
      item.poster_path === null
        ? "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRhLinI3xZpIuFviNZcJ3X1qonvcA0rHcLhY57qgBAYwkNbQmgL"
        : `https://image.tmdb.org/t/p/w300${item.poster_path}`;
    mainContentsTextbox.className = "main__contents__textBox";
    star.className = "fas fa-star";
    mainContentsImgBoxText.className = "main__contents__imgBox__text";
    mainContentsImgBoxText.innerText = `${item.vote_average} / 10`;
    title.innerText = `${
      item.title.length > 8 ? `${item.title.substring(0, 10)}...` : item.title
    }`;
    title.className = "posterTitle";
    mainContentsForm.action = "./detail.jsp";
    mainContentsFormInput.type = "hidden";
    mainContentsFormInput.name = "id";
    mainContentsFormInput.value = `${item.id}`;
    mainContentsTextbox.appendChild(star);
    mainContentsTextbox.appendChild(mainContentsImgBoxText);
    mainContentsImgBox.appendChild(posterImage);
    mainContentsImgBox.appendChild(mainContentsTextbox);
    mainContentsForm.appendChild(mainContentsFormInput);
    mainContentsItem.appendChild(mainContentsImgBox);
    mainContentsItem.appendChild(title);
    mainContentsItem.appendChild(mainContentsForm);
    mainContents.appendChild(mainContentsItem);
  });
  mainColumn.appendChild(mainSectionText);
  if (data.length === 0) {
    message.className = "main__message";
    message.innerText = "결과 없음";
    mainColumn.appendChild(message);
  }
  mainColumn.appendChild(mainContents);
  main.appendChild(mainColumn);
};
const listMovies = (data, str) => {
  const mainColumn = document.createElement("div");
  const mainSectionText = document.createElement("span");
  const mainContents = document.createElement("div");
  const main = document.querySelector("main");
  mainContents.className = "main__contents";
  mainColumn.className = "main__column";
  mainSectionText.className = "main__sectionText";
  mainSectionText.innerText = str;
  data.forEach(item => {
    const mainContentsItem = document.createElement("div");
    const mainContentsImgBox = document.createElement("div");
    const posterImage = document.createElement("img");
    const mainContentsTextbox = document.createElement("div");
    const star = document.createElement("i");
    const mainContentsImgBoxText = document.createElement("span");
    const title = document.createElement("span");
    const mainContentsForm = document.createElement("form");
    const mainContentsFormInput = document.createElement("input");
    mainContentsItem.className = "main__contents__item";
    mainContentsItem.id = `${item.id}`;
    mainContentsImgBox.className = "main__contents__imgBox";
    posterImage.src =
      item.poster_path === null
        ? "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRhLinI3xZpIuFviNZcJ3X1qonvcA0rHcLhY57qgBAYwkNbQmgL"
        : `https://image.tmdb.org/t/p/w300${item.poster_path}`;
    mainContentsTextbox.className = "main__contents__textBox";
    star.className = "fas fa-star";
    mainContentsImgBoxText.className = "main__contents__imgBox__text";
    mainContentsImgBoxText.innerText = `${item.vote_average} / 10`;
    title.innerText = `${
      item.title.length > 8 ? `${item.title.substring(0, 10)}...` : item.title
    }`;
    title.className = "posterTitle";
    mainContentsForm.action = "./detail.jsp";
    mainContentsFormInput.type = "hidden";
    mainContentsFormInput.name = "id";
    mainContentsFormInput.value = `${item.id}`;
    mainContentsTextbox.appendChild(star);
    mainContentsTextbox.appendChild(mainContentsImgBoxText);
    mainContentsImgBox.appendChild(posterImage);
    mainContentsImgBox.appendChild(mainContentsTextbox);
    mainContentsForm.appendChild(mainContentsFormInput);
    mainContentsItem.appendChild(mainContentsImgBox);
    mainContentsItem.appendChild(title);
    mainContentsItem.appendChild(mainContentsForm);
    mainContents.appendChild(mainContentsItem);
  });
  mainColumn.appendChild(mainSectionText);
  mainColumn.appendChild(mainContents);
  main.appendChild(mainColumn);
};
const hideSpinner = query => {
  const spinnerBox = document.querySelector(`${query}`);
  const main = document.querySelector("main");
  spinnerBox.style.display = "none";
  main.style.opacity = "1";
};

(function() {
  if (typeof key === "undefined") {
    document.querySelector(".networkError").innerText =
      "Add your API key to load movie data.";
    document.querySelector(".networkError").style.color = "peru";
  }
})();
