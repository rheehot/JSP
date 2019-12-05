const hideSpinner = query => {
  const spinnerBox = document.querySelector(`${query}`);
  const main = document.querySelector("main");
  spinnerBox.style.display = "none";
  main.style.opacity = "1";
};

const paintPosters = (data, str, title, isSimillar = false) => {
  if (data.length !== 0) {
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
    if (isSimillar !== true) {
      mainColumn.appendChild(moreBox);
    }
    mainColumn.appendChild(hr);
    main.appendChild(mainColumn);
  }
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

const likeMovies = (data, str, likeCount) => {
  const mainColumn = document.createElement("div");
  const mainSectionText = document.createElement("span");
  const mainContents = document.createElement("div");
  const main = document.querySelector("main");
  mainContents.className = "main__contents";
  mainColumn.className = "main__column";
  mainSectionText.className = "main__sectionText";
  mainSectionText.innerText = str;
  data.forEach((item, index) => {
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
    mainContentsTextbox.className = "main__contents__likeTextBox";
    star.className = "fas fa-thumbs-up";
    mainContentsImgBoxText.className = "main__contents__imgBox__likeText";
    mainContentsImgBoxText.innerText = likeCount[index].likeCount;
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

const paintDetail = (data, id, email, isLiked) => {
  const backdrop = document.createElement("div");
  if (data.backdrop_path !== null) {
    backdrop.className = "detail__backdrop";
    backdrop.style.backgroundImage = `url("https://image.tmdb.org/t/p/original${data.backdrop_path}")`;
  }

  const content = document.createElement("div");
  const contentData = document.createElement("div");
  const dataHeader = document.createElement("div");
  const dataHeaderTitle = document.createElement("span");
  const dataHeaderIconBox = document.createElement("span");
  const dataHeaderForm = document.createElement("form");
  const dataHeaderInput = document.createElement("input");
  const dataHeaderInput1 = document.createElement("input");
  const dataHeaderInput2 = document.createElement("input");
  const dataHeaderIcon = document.createElement("i");
  const dataInfo = document.createElement("div");
  const dataInfoItem1 = document.createElement("span");
  const dataInfoItem2 = document.createElement("span");
  const dataInfoItem3 = document.createElement("div");
  const dataInfoItem4 = document.createElement("a");
  const dataOverview = document.createElement("div");
  const dataOverviewSpan = document.createElement("span");
  const dataRecommend = document.createElement("div");
  const dataRecommendTextBox = document.createElement("div");
  const dataRecommendTitle = document.createElement("span");
  const dataRecommendShow = document.createElement("span");
  const container = document.createElement("div");

  content.className = "content";
  contentData.className = "content__data";
  dataHeader.className = "data__header";
  dataHeaderTitle.className = "data__header__title";
  dataHeaderIconBox.className = "data__header__icon";
  dataHeaderIconBox.id = "js-like";
  if (isLiked === true) {
    dataHeaderIcon.className = "fas fa-thumbs-up";
    dataHeaderForm.action = "./jsp/handleDeleteLike.jsp";
  } else {
    dataHeaderIcon.className = "far fa-thumbs-up";
    dataHeaderForm.action = "./jsp/handleLike.jsp";
  }

  dataHeaderForm.id = "js-likeForm";
  dataInfo.className = "data__info";
  dataInfoItem1.className = "info__item";
  dataInfoItem2.className = "info__item";
  dataInfoItem3.className = "info__item";
  dataInfoItem4.className = "info__item";
  dataOverview.className = "data__overview";
  dataRecommend.className = "data__recommendations";
  dataRecommendTextBox.className = "recommendations__box";
  dataRecommendTitle.className = "recommendations__title";
  dataRecommendTitle.innerText = "추천";
  dataRecommendShow.className = "recommendations__show";
  dataRecommendShow.id = "showHide";
  dataRecommendShow.innerText = "숨기기";
  // like input
  dataHeaderInput.type = "hidden";
  dataHeaderInput.name = "id";
  dataHeaderInput.value = id;
  dataHeaderInput1.type = "hidden";
  dataHeaderInput1.name = "email";
  dataHeaderInput1.value = email;

  dataHeaderForm.appendChild(dataHeaderInput);
  dataHeaderForm.appendChild(dataHeaderInput1);

  dataHeaderTitle.innerText = data.title;
  dataInfoItem1.innerText = data.release_date;
  dataInfoItem2.innerText = `${data.runtime} minutes`;
  data.genres.forEach((item, index) => {
    const dataInfoItemGenre = document.createElement("span");
    dataInfoItemGenre.className = "info__genre";
    if (index < data.genres.length - 1) {
      dataInfoItemGenre.innerText = `${item.name} / `;
    } else {
      dataInfoItemGenre.innerText = item.name;
    }
    dataInfoItem3.appendChild(dataInfoItemGenre);
  });
  dataInfoItem4.innerText = "🎬 IMDB";
  dataInfoItem4.href = `https://www.imdb.com/title/${data.imdb_id}`;
  dataInfoItem4.target = "_blank";
  dataOverviewSpan.innerText = data.overview;

  dataHeaderIconBox.appendChild(dataHeaderIcon);
  dataHeader.appendChild(dataHeaderTitle);
  dataHeader.appendChild(dataHeaderIconBox);
  dataHeader.appendChild(dataHeaderForm);

  dataInfo.appendChild(dataInfoItem1);
  dataInfo.appendChild(dataInfoItem2);
  dataInfo.appendChild(dataInfoItem3);
  dataInfo.appendChild(dataInfoItem4);

  dataOverview.appendChild(dataOverviewSpan);

  if (data.recommendations.results.length !== 0) {
    data.recommendations.results.forEach(item => {
      const Item = document.createElement("div");
      const img = document.createElement("img");
      const title = document.createElement("span");
      const star = document.createElement("span");
      const form = document.createElement("form");
      const input = document.createElement("input");

      container.className = "recommendations__container";
      container.id = "recommendContents";
      Item.className = "recommendations__item";
      star.className = "recommendations__star";
      img.className = "recommendations__img";
      title.className = "recommendations__title";

      img.src = `https://image.tmdb.org/t/p/w300${item.poster_path}`;
      title.innerText = item.title;
      star.innerText = `🍅 ${item.vote_average} / 10`;
      form.action = "./detail.jsp";
      input.type = "hidden";
      input.name = "id";
      input.value = item.id;

      form.appendChild(input);
      Item.appendChild(img);
      Item.appendChild(title);
      Item.appendChild(star);
      Item.appendChild(form);
      container.appendChild(Item);
    });
    dataRecommendTextBox.appendChild(dataRecommendTitle);
    dataRecommendTextBox.appendChild(dataRecommendShow);
    dataRecommend.appendChild(dataRecommendTextBox);
    dataRecommend.appendChild(container);
  }

  contentData.appendChild(dataHeader);
  contentData.appendChild(dataInfo);
  contentData.appendChild(dataOverview);
  contentData.appendChild(dataRecommend);

  content.appendChild(backdrop);
  content.appendChild(contentData);

  document.getElementById("detail").appendChild(content);
};
