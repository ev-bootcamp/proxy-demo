const express = require('express')
const app = express()
const port = 3000

app.get('/hello', (req, res) => {
    console.log('Received hello request')
    res.send('Hello World!')
})

app.listen(port, () => {
    console.log(`Example app listening on port ${port}`)
})

