class @GroupedByButton extends React.Component
  groupEvent: (e) ->
    e.preventDefault()
    sortParam = $(e.target).data("filter-option")
    $.ajax
      url: "events"
      data: { sort_param: sortParam, ajax: true }
      method: "GET"
      dataType: "html"
      success: (data) ->
        $("#event-list-section").html(data)
      error: (jqXHR, textStatus, errorMessage) ->
        console.log "Request failed: #{textStatus} - #{errorMessage}"

  render: ->
    `<div className="btn-group" data-toggle="buttons">
       <label className="grouped-by-month btn btn-default active" onClick={this.groupEvent} data-filter-option="month">Month
          <input autoComplete="off" name="options" type="radio"></input>
       </label>
       <label className="grouped-by-area btn btn-default" onClick={this.groupEvent} data-filter-option="area">Area
          <input autoComplete="off" name="options" type="radio"></input>
       </label>
       <label className="grouped-by-language btn btn-default" onClick={this.groupEvent} data-filter-option="language">Language
          <input autoComplete="off" name="options" type="radio"></input>
       </label>
     </div>`
