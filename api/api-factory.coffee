express = require "express"
router = express.Router()
#Note: Not really sure if the "Repository" term is correct here
Repository = require "./repository"
Mapper = require("./mapper")

module.exports = (name, type) ->
    mapper = new Mapper type
    schema = mapper.schema
    Model = new Repository name, schema
    
    router.route("/#{name}")
        .post (req, res) ->
            model = new Model()
            mapper.map(req.body).to(model)
            model.save (err, model) ->
                res.send(err || model)
        .get (req, res) ->
            Model.find (err, list) ->
                res.send(err || list)
        
    router.route("/#{name}/:id([0-9a-fA-F]{24})")
        .get (req, res) ->
            Model.findById req.params.id, (err, model) ->
                res.send(err || model)
        .put (req, res) ->
            Model.findById req.params.id, (err, model) ->
                if err
                    res.send err
                else
                    mapper.map(req.body).to(model)
                    model.save (err, model) ->
                        res.send(err || model)
        .delete (req, res) ->
            Model.remove { 
                _id: req.params.id 
                }, (err) ->
                    res.send(err || {message: "deleted"})
                
    router.route("/#{name}/schema")
        .get (req, res) ->
            res.json type
            
    return router