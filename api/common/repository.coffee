###TODO: Research recommended connection lifecycle for Mongoose. Should 
connections be opened/closed for each repo call or persist for the
life of the module?###

assert = require("assert") 
mongoose = require('mongoose') 

connection = mongoose.connection 

connection.on 'error', (err) ->
    console.error 'DB connection error', err
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
    return Repository = mongoose.model(name, schema)
    
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