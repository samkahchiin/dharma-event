$(document).ready ->
  $("#filter-button").click ->
    selectedAreas     = $("#area-filter").val()
    selectedStartDate = $("#start-date-filter").val()
    selectedEndDate   = $("#end-date-filter").val()
    selectedLanguages = $("#language-filter").val()

    $.ajax
      url: "events"
      data:
        area: selectedAreas
        start_time: selectedStartDate
        end_time: selectedEndDate
        language: selectedLanguages
        search: true
      method: "GET"
      dataType: "html"
      success: (data) ->
        $("#event-list-section").html(data)
      error: (jqXHR, textStatus, errorMessage) ->
        console.log "Request failed: #{textStatus} - #{errorMessage}"
