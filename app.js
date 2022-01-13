const express = require('express')
const morgan = require('morgan')
const bodyParser = require('body-parser')
// ====================
const cors = require('cors')
// ====================
const routesNavigation = require('./src/routesNavigation')

const app = express()
app.use(morgan('dev'))

app.use(bodyParser.json())
app.use(bodyParser.urlencoded({ extended: false }))
// ====================
app.use(cors())
app.use((request, response, next) => {
  response.header('Access-Control-Allow-Origin', '*')
  response.header(
    'Access-Control-Allow-Headers',
    'Origin, X-Request-With, Content-Type, Accept, Authorization'
  )
  next()
})
// ====================

app.use('/api1', routesNavigation)
// ubah bagian static yang sebelumnya seperti :
// app.use(express.static('uploads'))
// menjadi :
app.use('/api1/fileUploadsApi1', express.static('uploads'))
// untuk akses gambarnya nanti akan https://backend-web6.fwebdev.online/api1/fileUploadsApi1/nama_gambarnya
// jika gambarnya masuk kedalam folder maka nanti akan https://backend-web6.fwebdev.online/api1/fileUploadsApi1/folder_gambar/nama_gambarnya

app.get('*', (request, response) => {
  response.status(404).send('Path not found !')
})

app.listen(3002, () => {
  console.log('Express app is listening 3002')
})
