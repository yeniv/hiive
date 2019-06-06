const card_container = document.getElementById('api-refresh');

const apiFetch = () => {
  const user = document.querySelector('.user-info').id
  fetch(`${location.origin}//api/v1/users/${user}/products`)
  .then(response => response.json())
  .then((data) => {
    card_container.innerHTML = "";
    data.forEach((result) => {
      const productCard = `
          <div class="col-3 hiive-card-container">
          <div class="hiive-card" id="${result.id}"">

          <div class="hiive-card-photo" style="background-image: url(${result.photo.url})";>
          </div>

          <div class="hiive-card-content">
          <p class="hiive-card-title">${result.title}</p>
          <p class="hiive-card-price">${(result.price == '') ? 'discontinued' : result.price }</p>
          </div>
          </div>

          <form class="button_to" method="post" action="/products/${result.id}"><input type="hidden" name="_method" value="delete"><input class="col-6 hiive-card-btn hiive-card-btn-left hiive-card-btn-delete" type="submit" value="remove"></form>
          <form class="button_to" method="get" action="/products/${result.id}"><input class="col-6 hiive-card-btn hiive-card-btn-right" type="submit" value="more info"></form>
          </div>`;

      card_container.insertAdjacentHTML("afterbegin", productCard);
    })
  });
}

if (card_container) {
  apiFetch();
  setInterval((apiFetch), 700);
};
