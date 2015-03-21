# MeanSandbox
This is a playground project to explore Node.js and the MEAN stack. I'll be experimenting with implementation,
code organization, design patterns, and best practices in various areas of Node development.
- REST API
- Jade view templates
- SASS, LESS, and/or Stylus
- Authentication
- Code generation (generate API, client, and templates according to schema)
- Node development in CoffeeScript 
  - Server-side, with and without precompilation
  - Client-side, rendering as JS on the fly
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

Note that this is an experimental project, and very much a work in progress. It's getting refactored, reorganized, and improved. **Comments, suggestions, and pull requests are welcome.**

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
3. Examine the "known issues" section below.

#Known issues
1. ~~BundleUp is broken in Express 4.0.0, see my pull request on the BundleUp project: https://github.com/Cowboy-coder/bundle-up/pull/40.~~ **RESOLVED: Now using `connect-assets` for asset management.**
2. ~~Poor support for rendering SASS on the fly.~~ **RESOLVED: Now using Stylus instead, with much better results.**
3. Production mode may require more configuration, especially for `connect-assets`.

#Next steps
1. Dynamically generate multiple Angular front-ends from a list of schemas. I'm already doing this on the back end with dynamic REST APIs.
2. Automate installation.
3. Unit testing.