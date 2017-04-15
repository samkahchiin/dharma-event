$(document).ready ->
  $("select").select2()

  $("#area-filter").select2
    placeholder: "Select areas",
    allowClear: true

  $("#language-filter").select2
    placeholder: "Select languages",
    allowClear: true
