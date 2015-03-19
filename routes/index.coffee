exports.index = (req, res) ->
  res.locals.css = (url) -> "<link rel='stylesheet' href='#{url}' type='text/css'/>"
  res.locals.js = (url) -> "<script src='#{url}'></script>"
  res.render 'index', {
    title: 'Bears app'
    appName: 'bears'
  }