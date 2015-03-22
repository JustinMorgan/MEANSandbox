exports.index = (req, res) ->
  res.render 'index', {
    title: req.params.appName
    appName: req.params.appName
  }
  