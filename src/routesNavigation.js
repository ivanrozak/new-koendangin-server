const router = require('express').Router()

const product = require('./routes/product')
const category = require('./routes/category')
const user = require('./routes/user')
const payment = require('./routes/payment')

router.use('/product', product) // http://localhost:3000/product
router.use('/category', category) // http://localhost:3000/category
router.use('/user', user)
router.use('/payment', payment)

module.exports = router
