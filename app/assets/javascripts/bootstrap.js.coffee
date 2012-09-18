jQuery ->
  $("a[rel=popover]").popover()
  $(".tooltip").tooltip()
  $("a[rel=tooltip]").tooltip()


$('#new-button').click ->
  $('div#new-happy-form').slideToggle()
