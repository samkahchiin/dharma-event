$(document).ready ->
  $("select").select2()

  $("#area-filter").select2
    placeholder: "Select areas",
    allowClear: true

  $("#language-filter").select2
    placeholder: "Select languages",
    allowClear: true

  $('[data-form-prepend]').click (e) ->
    obj = $($(this).attr('data-form-prepend'))
    obj.find('input, select, textarea').each ->
      $(this).attr 'name', ->
        $(this).attr('name').replace 'new_record', (new Date).getTime()
    obj.insertBefore this
    $("select").select2()
    false
