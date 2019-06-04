const card_container = document.getElementById('api-refresh');
const user = document.querySelector('.user-info').id

// const product = document.querySelector('.hiive-card').id;

const apiFetch = () => {
  fetch(`http://localhost:3000//api/v1/users/${user}/products`)
  .then(response => response.json())
  .then((data) => {
    card_container.innerHTML = "";
    data.forEach((result) => {
      console.log(result.id);
      const productCard = `
          <div class="col-4 hiive-card-container">
          <div class="hiive-card" id="${result.id}"">

          <div class="hiive-card-photo" style="background-image: url(${result.photo.url})";>
          </div>

          <div class="hiive-card-content">
          <p class="hiive-card-title">${result.title}</p>
          <p class="hiive-card-price">${result.price}</p>
          </div>
          </div>

          <form class="button_to" method="get" action="/products/${result.id}"><input class="col-6 hiive-card-btn hiive-card-btn-left" type="submit" value="more info"></form>
          <form class="button_to" method="post" action="/products/${result.id}"><input type="hidden" name="_method" value="delete"><input data-confirm="Erm... are you sure?" class="col-6 hiive-card-btn hiive-card-btn-right hiive-card-btn-delete" type="submit" value="remove"></form>
          </div>`;

      card_container.insertAdjacentHTML("afterbegin", productCard);
    })
  });
}

if (card_container) {
  apiFetch();
  setInterval((apiFetch), 1000);
};
