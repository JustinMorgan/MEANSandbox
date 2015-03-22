express = require "express"
router = express.Router()
Repository = require "./repository"
Mapper = require("./mapper")

module.exports = (name, fields) ->
    mapper = new Mapper fields
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
        
    router.route("/#{name}/:id")
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
    router