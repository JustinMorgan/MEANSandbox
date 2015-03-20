#### TODO: sass/coffeescript pre-compilation and bundling ####
module.exports = (assets) -> 
    assets.root = __dirname
    assets.addJs '/apps/bears/**', 'bears'
    assets.addCss '/stylesheets/**.scss'
    return