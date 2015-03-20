# MeanSandbox
This is a playground project to experiment with Node.js and the MEAN stack. I'll be experimenting with implementation,
code organization, design patterns, and best practices in various aspects of Node development:
- REST API
- Developing in CoffeScript 
  - On-the-fly parsing (not compiling to JS first)
  - Performance when server code isn't precompiled
  - Performance when client scripts aren't precompiled
- MongoDB and Mongoose
  - Optimal lifecycle for connections and repositories
- Unit testing
  - Server-side
  - Client-side
  - Angular controllers
- Authentication
- Cloud-based development
  - Cloud-based IDE
  - Cloud hosting for app and DB
  - CDNs
- Jade view templates
- SASS, LESS, and/or Stylus
- Automation and package management
  - Building 
  - Installing 
  - Client-side dependency management
  - Bower, Yeoman, Grunt, Browserify, etc.
- Code generation (generate API, client, and templates based on a given schema)

Note that this is an experimental project, and very much a work in progress. It needs refactoring, bug fixes, and more automation. All these things are high priority and likely to improve soon. **Comments, suggestions, and pull requests are welcome.**

#Setup
Note: Not tested recently; beware of missing dependencies. This will be much more automated soon.

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
I will be submitting an issue and PR to the main BundleUp project about this.
    
2. I prefer the .sass coding style, but I can't find a single NPM package that supports rendering .sass files, only .scss. The plain `sass` NPM package supports doing it from the command line, but I can't get it to work inside the server. Current best workaround is to save the .sass file, then do one of the following from the command line:

    ```
    sass assets/stylesheets/style.sass public/stylesheets/style.css 
    ```
or

    ```
    sass-convert assets/stylesheets/style.sass assets/stylesheets/style.scss  
    ```
I plan to either 
  a) figure out how to do this on the fly, 
  b) automate the conversion (e.g. on saving a .sass file), or 
  c) switch over to Stylus. 
Leaning heavily toward c).
    
3. Production mode is only partially set up and probably won't work as-is. At the very least, paths and routes will need to change, and BundleUp will need to be reconfigured.
