express = require("express")
repoBuilder = require("./repository")

module.exports = (modelType, mapper) ->
    router = express.Router()
    Repo = repoBuilder modelType
    
    router.route("/#{modelType}")
        .post (req, res) ->
            model = new Repo()
            model = mapper(modelType).toModel(req.body, model)
            model.save (err, model) ->
                res.send(err || model)
        .get (req, res) ->
            Repo.find (err, list) ->
                res.send(err || list)
        
    router.route("/#{modelType}/:id")
        .get (req, res) ->
            Repo.findById req.params.id, (err, model) ->
                res.send(err || model)
        .put (req, res) ->
            Repo.findById req.params.id, (err, model) ->
                if err
                    res.send err
                else
                    model = mapper(modelType).toModel(req.body, model)
                    model.save (err, model) ->
                        res.send(err || model)
        .delete (req,res) ->
            Repo.remove { 
                _id: req.params.id 
                }, (err) ->
                    res.send(err || {message: "deleted"})
    router