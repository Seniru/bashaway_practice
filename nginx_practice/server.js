const express = require("express")
const os = require("os")
const app = express()

app.use((req, res, next) => {
    console.log(req.method, req.path)
    next()
})

app.get("/", (req, res, next) => {
    res.json({
        message: "Hello world",
        hostname: os.hostname()
    })
})


app.listen(3000, (err) => {
    if (err) console.error(err)
    console.log("Listening on port 3000")
})