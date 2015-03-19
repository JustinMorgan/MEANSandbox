mapper = require "../common/mapper"
repository = require "../common/repository"
    
mapper.configure require("./mapper.config")
repository.configure require("./repository.config")
repository.connect require("./connection").mongoUrl