exports.index = (req, res) ->
  res.render 'index', {
    title: 'Bears app'
    appName: 'bears'
  }