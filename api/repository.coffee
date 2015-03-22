###TODO: Research recommended connection lifecycle for Mongoose. Should 
connections be opened/closed for each repo call or persist for the
life of the module?###

mongoose = require "mongoose" 
connection = mongoose.connection 
mongoose.connect process.env.MONGOLAB_URI

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

factory = (name, schema) ->
    mongoStructure = new Schema schema
    return Repository = mongoose.model(name, mongoStructure)

module.exports = factory 