###TODO: Research recommended connection lifecycle for Mongoose. Should 
connections be opened/closed for each repo call or persist for the
life of the module?###

assert = require("assert") 
mongoose = require('mongoose') 

connection = mongoose.connection 

connection.on 'error', ->
    console.error 'DB connection error'
.once 'open', ->
    console.log 'DB open'

gracefulExit = -> 
  connection.close ->
    console.log 'Mongoose default connection disconnected through app termination'
    process.exit 0
 
process.on('SIGINT', gracefulExit)
       .on('SIGTERM', gracefulExit)

Schema = mongoose.Schema 
_proto = {} 

factory = (name) ->
    proto = _proto[name] 
    assert proto
        
    schema = new Schema proto
    Repository = mongoose.model(name, schema)
    
    #api tweak
    Repository.find = do (find = Repository.find, findById = Repository.findById) ->
        (callback, id) ->
            if id? 
                findById.call(this, id, callback)
            else 
                find.call(this, callback)
    
    return Repository 
    
factory.register = (name, proto) ->
    _proto[name] = proto 
    factory 
    
factory.configure = (callback) ->
    callback factory
    factory 
    
factory.connect = (mongoUrl) ->
    mongoose.connect mongoUrl
    factory

module.exports = factory 