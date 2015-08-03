# MeanSandbox
This is a playground project to explore Node.js and the MEAN stack. It's an experimental project, and very much a work in progress. **Comments, suggestions, and pull requests welcome.**

# Features
## Dynamic REST API generation
This is the most useful feature of the project. Given a MongoDB connection string and a JSON map of your data structure, the site will automagically wire up a REST API for each data type in the schema.

## Dynamic Angular front-end generation
Using the same schema.json file as the API factory, the front end produces an Angular CRUD SPA for each data type.

## CoffeeScript and Stylus bundling
All server- and client-side scripts are written in CoffeeScript. All stylesheets are written in Stylus. In production mode, client-side (and possibly server-side) code will be precompiled, bundled together, and minified. In dev mode, client js/css is rendered on the fly.

# Topics for exploration
I'll be experimenting with implementation, code organization, design patterns, and best practices in various areas of Node development.
- REST API
- Jade view templates
- SASS, LESS, and/or Stylus
- Authentication
- Code generation (generate API, client, and templates according to schema)
- Angular model validation
- Angular routing with UI-Router
- Node development in CoffeeScript 
  - Rendering CoffeeScript assets as JS
  - Performance when not precompiled
- MongoDB and Mongoose
  - Optimal lifecycle for connections and DB objects
- Testing
  - Server-side unit tests
  - Angular unit tests
  - Automated UI tests
- Automation and package management
  - Building 
  - Installing 
  - Client-side dependency management
  - Bower, Yeoman, Grunt, Browserify, etc.

# Setup
**Note: Not tested recently; beware of missing dependencies.** This will be more automated soon.

1. Pull the Git repo onto your filesystem and run the following:

    ```
    npm install -g coffee-script
    npm install
    ```
2. Create `config.json` in the root folder. It should look something like this:

    ```
    {
        "env": <"development" or "production">,
        "mongoUrl": "mongodb://<user>:<password>@<server-url>/<database>"
    }
    ```
3. Modify `schema.json` to reflect your data structure.
4. Type `coffee server.coffee` to run the app.

# Known issues
1. ~~BundleUp is broken in Express 4.0.0, see my pull request on the BundleUp project: https://github.com/Cowboy-coder/bundle-up/pull/40.~~ **RESOLVED: Now using `connect-assets` for asset management.**
2. ~~Poor support for rendering SASS on the fly.~~ **RESOLVED: Now using Stylus instead of SASS with much better results.**
3. I haven't done much testing of intial setup and config in production mode. It may require more initial configuration, especially for `connect-assets`.

#Next steps
- [x] Dynamically generate multiple Angular front-ends from a list of schemas. I'm already doing this on the back end with dynamic REST APIs.
- [x] Dynamic Jade templates
- [ ] Explore Bower and Browserify
- [ ] Automate installation
- [ ] Unit testing
- [ ] Form validation
