const current_user_id = document.querySelector('#current_user_id').dataset.id;

App.messages = App.cable.subscriptions.create({ channel: 'ProductFlashesChannel', user_id: current_user_id }, {
  received: function(data) {
    let message = data.message
    let flash_color = data.flash_color
    let html = `<div class="flash flash-position flash-${flash_color} alert fade show alert-dismissible" role="alert">
                ${message}
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
                </div>`

    let flash_div = document.querySelector(".flash-container");

    if (flash_div) {
    flash_div.insertAdjacentHTML(
    'afterbegin', html)
    } else {
    flash_div.insertAdjacentHTML(
    'afterbegin',
    `<div class="flash-container">${html}</div>`)
    };
  }
});
