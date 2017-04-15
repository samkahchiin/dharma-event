$(document).ready ->
  $(".grouped-by-area").click ->
    $.ajax
      url: "events"
      data: { sort_param: "area", ajax: true }
      method: "GET"
      dataType: "html"
      success: (data) ->
        $("#event-list-section").html(data)
      error: (jqXHR, textStatus, errorMessage) ->
        console.log "Request failed: #{textStatus} - #{errorMessage}"

  $(".grouped-by-month").click ->
    $.ajax
      url: "events"
      data: { sort_param: "month", ajax: true }
      method: "GET"
      dataType: "html"
      success: (data) ->
        $("#event-list-section").html(data)
      error: (jqXHR, textStatus, errorMessage) ->
        console.log "Request failed: #{textStatus} - #{errorMessage}"

  $(".grouped-by-language").click ->
    $.ajax
      url: "events"
      data: { sort_param: "language", ajax: true }
      method: "GET"
      dataType: "html"
      success: (data) ->
        $("#event-list-section").html(data)
      error: (jqXHR, textStatus, errorMessage) ->
        console.log "Request failed: #{textStatus} - #{errorMessage}"
