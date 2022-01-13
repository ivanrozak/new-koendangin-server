const router = require('express').Router()
const { getCategory } = require('../controller/category')

router.get('/', getCategory)

module.exports = router
