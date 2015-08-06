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
- AngularUI's UI-Router state engine
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
**Note: This is a living project. Watch out for missing steps or dependencies.** 

1. Pull down the Git repo.
2. Install Bower and CoffeeScript if you haven't yet:

    ```
    npm install -g coffee-script
    npm install -g bower-cli
    ```
3. Create `app-config.json` in the root folder. It should look something like this:

    ```
    {
        "env": "development",
        "mongoUrl": "mongodb://myUser:myPassword@myMongoServerUrl/myDatabase"
    }
    ```
   Whatever you set for `env` will be passed to Express with an `app.set("env", config.env)` call.
4. Modify `schema.json` to reflect the data structure in your Mongo store.
5. Use NPM, Bower, and Grunt to pull in all the dependencies:

    ```
    npm install
    bower install
    grunt
    ```
6. Run `coffee server.coffee`.

# Known issues
1. ~~BundleUp is broken in Express 4.0.0, see my pull request on the BundleUp project: https://github.com/Cowboy-coder/bundle-up/pull/40.~~ **RESOLVED: Now using `connect-assets` for asset management.**
2. ~~Poor support for rendering SASS on the fly.~~ **RESOLVED: Now using Stylus instead of SASS with much better results.**
3. I haven't done much testing of intial setup and config in production mode. It may require more initial configuration, especially for `connect-assets`.

#Next steps
- [x] Dynamically generate multiple Angular front-ends from a list of schemas. I'm already doing this on the back end with dynamic REST APIs.
- [x] Dynamic Jade templates
- [x] Bower
- [ ] Browserify
- [ ] Guided installation, most likely with Yeoman
- [ ] Unit testing
- [ ] Form validation
