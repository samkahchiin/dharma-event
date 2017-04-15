$(document).ready ->
  $("#by-location").click ->
    $.ajax
      url: "events"
      data: { sort_param: "location", ajax: true }
      method: "GET"
      dataType: "html"
      success: (data) ->
        $("#event-list-section").html(data)
      error: (jqXHR, textStatus, errorMessage) ->
        console.log "Request failed: #{textStatus} - #{errorMessage}"

  $("#by-month").click ->
    $.ajax
      url: "events"
      data: { sort_param: "month", ajax: true }
      method: "GET"
      dataType: "html"
      success: (data) ->
        $("#event-list-section").html(data)
      error: (jqXHR, textStatus, errorMessage) ->
        console.log "Request failed: #{textStatus} - #{errorMessage}"

  $("#by-language").click ->
    $.ajax
      url: "events"
      data: { sort_param: "language", ajax: true }
      method: "GET"
      dataType: "html"
      success: (data) ->
        $("#event-list-section").html(data)
      error: (jqXHR, textStatus, errorMessage) ->
        console.log "Request failed: #{textStatus} - #{errorMessage}"
