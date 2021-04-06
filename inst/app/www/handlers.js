$( document ).ready(function() {
  Shiny.addCustomMessageHandler('alert', function(arg) {
    alert(arg)
  })
});
