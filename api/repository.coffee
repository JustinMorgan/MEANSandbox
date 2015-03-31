mongoose = require "mongoose" 
connection = mongoose.connection 
mongoose.connect process.env.MONGOLAB_URI

connection.on 'error', (err) ->
              console.error 'DB connection error', err
          .on 'open', ->
              console.log 'DB open'
          .on 'close', ->
              console.log 'DB closed'

gracefulExit = -> 
    connection.close ->
        console.log 'Mongoose default connection disconnected through app termination'
        process.exit 0
 
process.on 'SIGINT', gracefulExit
       .on 'SIGTERM', gracefulExit

Schema = mongoose.Schema 

module.exports = (name, dataStructure) ->
    schema = new Schema dataStructure
    return mongoose.model name, schema