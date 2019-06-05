const page = document.getElementById("browse-page");

if (page) {
  var lookups = document.getElementById("query");
  lookups.addEventListener("keyup", function() {
    var input, filter, cards, cardContainer, title, i;
    input = document.getElementById("query");
    filter = input.value.toUpperCase();
    cardContainer = document.getElementById("myItems");
    cards = cardContainer.getElementsByClassName("card-product");
    for (i = 0; i < cards.length; i++) {
      title = cards[i].querySelector(".lookup");
      if (title.innerText.toUpperCase().indexOf(filter) > -1) {
        cards[i].style.display = "";
      } else {
        cards[i].style.display = "none";
      }
  }
});