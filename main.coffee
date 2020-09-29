express = require "express"
app = express()

superagent = require "superagent"

app.set "json spaces", 2

app.get "/", (req, res) ->
    res.json { hello: "world" }

app.get "/api", (req, res) ->
    res.json { api: "this is api" }

app.get "/api/brainly", (req, res) ->
    if !req.query.q
        res.json { err: "empty query" }
    
    data = await superagent.get "https://brainlya.hanifdwyputra.xyz/?q=#{req.query.q}"
    res.json data.body

app.get "/api/instagram", (req, res) ->
    if !req.query.username
        res.json { invalid: "username query" }
    
    data = await superagent.get "https://instagram.hanifdwyputra.xyz/?username=#{req.query.username}" 
    res.json data.body

listener = app.listen 8080, () ->
    console.log "Express running on %d", listener.address().port