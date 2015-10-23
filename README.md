# MEAN-Sandbox
This is a playground project to explore Node.js and the MEAN (MongoDB, Express, Angular, and Node) stack. It's an experimental project, and very much a work in progress. **Comments, suggestions, and pull requests welcome.**

#Features
##Dynamic REST API generation
This is the most useful feature of the project. Given a connection string and a JSON schema list, the site will automagically wire up a REST back-end for each data type in the list.

##Dynamic Angular front-end generation
Using the same schema.json file as the API factory, the front end produces an Angular CRUD SPA for each data type.

##CoffeeScript and Stylus bundling
All server- and client-side scripts are written in CoffeeScript. All stylesheets are written in Stylus. In production mode, client-side (and possibly server-side) code will be precompiled, bundled together, and minified. In dev mode, client js/css is rendered on the fly.

#Topics for exploration
I'll be experimenting with implementation, code organization, design patterns, and best practices in various areas of Node development.
- REST API
- Jade view templates
- SASS, LESS, and/or Stylus
- Authentication
- Code generation (generate API, client, and templates according to schema)
- Angular model validation
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

#Setup
**Note: Not tested recently; beware of missing dependencies.** This will be more automated soon.

1. Pull the repo onto your filesystem and run the following:

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
4. Take a look at the "known issues" section below.

#Known issues
1. ~~BundleUp is broken in Express 4.0.0, see my pull request on the BundleUp project: https://github.com/Cowboy-coder/bundle-up/pull/40.~~ **RESOLVED: Now using `connect-assets` for asset management.**
2. ~~Poor support for rendering SASS on the fly.~~ **RESOLVED: Now using Stylus instead, with much better results.**
3. Production mode may require more configuration, especially for `connect-assets`.

#Next steps
- [x] Dynamically generate multiple AngularJS front-ends from a schema description **(done)**
- [x] Dynamically bind Jade templates to the schema **(done, but discarded in favor of Angular)**
- [ ] Explore Bower and Browserify
- [ ] Automate installation
- [ ] Unit testing
- [ ] Input validation
