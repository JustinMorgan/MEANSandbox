# MeanSandbox
This is a playground project to experiment with Node.js and the MEAN stack. I'll be experimenting with implementation,
design patterns, and best practices in various aspects of Node development:
- RESTful API
- Direct parsing of CoffeScript (not compiling to JS first)
- Mongoose best practices
- Unit testing
- Authentication (OAuth)
- Integration with cloud app/DB hosting
- Jade view templates
- SASS and/or LESS

#Setup
(Note: Not tested recently; beware of missing dependencies) 

1. Pull the repo onto your filesystem and run the following:

    ```
    npm install -g coffee-script
    npm install
    ```
2. Create `/api/config/connection.json`. It should look like this:

    ```
    {
        "mongoUrl":"<your.mongoDb.connection.string>"
    }
    ```
3. Examine the "known issues" section below.

#Known issues
1. If you're going to use BundleUp to render coffee and sass files, look for a reference to `@app.locals` in `/node_modules/bundle-up/lib/bundle_up.coffee`. `app.locals` is no longer a function in Express 4, so change it to this:

    ```
    @app.locals.renderStyles = (namespace=@css.defaultNamespace) =>
        return @css.render(namespace)
    @app.locals.renderJs = (namespace=@js.defaultNamespace) =>
        return @js.render(namespace)
    ```    
2. I can't find a single NPM package that supports rendering .sass files, only .scss. The plain `sass` package supports doing it from the command line, but I can't get it to work inside the server. Current best workaround is to save the .sass file, then do one of the following from the command line:

    ```
    sass assets/stylesheets/style.sass public/stylesheets/style.css 
    ```
or

    ```
    sass-convert assets/stylesheets/style.sass assets/stylesheets/style.scss  
    ```
3. Production mode is currently only partially set up and probably won't work as-is.