require('dotenv').config()
const express = require('express')
const sequelize = require('./db')
const { importCSV } = require('./importCSV')
const bodyParser = require('body-parser')
const path = require('path')
const router = require('./routes/index')
const session = require('express-session')
const PORT = process.env.PORT || 7000
const app = express();


app.use(express.static(path.resolve(__dirname, 'static')))
app.use(bodyParser.urlencoded({ extended: true }))
app.set('view engine', 'ejs');
app.set('views', path.join(__dirname, 'views'))
app.use(express.json())
app.use('/', router)

// importCSV()  // использовать только один раз

const start = async () => {
    try {
      await sequelize.authenticate()
      await sequelize.sync()
      app.listen(PORT,() => console.log(`Started on port ${PORT}`))
    } catch (error) {
      console.log(error)
    }
}


start()