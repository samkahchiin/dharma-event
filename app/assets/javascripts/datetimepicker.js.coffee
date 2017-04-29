$(document).ready ->
  $("#start-date-filter").datetimepicker
    minDate: moment(new Date())
    format: "DD/MM/YYYY"

  $("#end-date-filter").datetimepicker
    format: "DD/MM/YYYY"
    useCurrent: false

  $("#start-date-filter").on "dp.change", (e) ->
    $('#end-date-filter').data("DateTimePicker").minDate(e.date)

  $("#end-date-filter").on("dp.change", (e) ->
    $("#start-date-filter").data("DateTimePicker").maxDate(e.date)
  )

  $(".datetimepicker").datetimepicker()
  # $(".datepicker").datetimepicker
  #   format: "DD/MM/YYYY"
