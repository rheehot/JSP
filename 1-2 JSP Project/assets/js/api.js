const key = "87bdf1c229a761bf9f16745293c2fc6c";
(function() {
  if (typeof key === "undefined") {
    document.querySelector(".networkError").innerText =
      "Add your API key to load movie data.";
    document.querySelector(".networkError").style.color = "peru";
  }
})();

const getDetail = id =>
  fetch(
    `https://api.themoviedb.org/3/movie/${id}?api_key=${key}&language=ko-kor&append_to_response=recommendations`
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
