module.exports = (assets) -> 
    assets.addJs './assets/apps/bears/**.coffee', 'bears'
    assets.addCss './assets/stylesheets/*.scss'
    return