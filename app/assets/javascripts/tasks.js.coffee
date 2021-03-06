$ ->
  params = get_params()

  $("th").click ->
    sort_by = $(this).text().toLowerCase()
    if params.sort? and params.sort is sort_by
      params.sort = "-#{sort_by}"
    else
      params.sort = sort_by
    set_params(params)

  $("td.points, td.course, td.category").click ->
    filter_by_key = $(this).attr('class')
    filter_by_value = $(this).text()
    if params[filter_by_key] is filter_by_value.replace(" ", "%20")
      delete params[filter_by_key]
    else
      params[filter_by_key] = filter_by_value
    set_params(params)

  $(".clear-param").click ->
    param_to_clear = $(this).data('clear')
    delete params[param_to_clear]
    set_params(params)

