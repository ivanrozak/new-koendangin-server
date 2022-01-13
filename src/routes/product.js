const router = require('express').Router()
const uploadImage = require('../middleware/multer')
const { authorization, isAdmin } = require('../middleware/auth')
// const {
//   getProductByIdRedis,
//   getProductRedis,
//   clearDataProductRedis
// } = require('../middleware/redis')
const {
  getProduct,
  getProductById,
  postProduct,
  patchProduct
} = require('../controller/product')

router.get('/', authorization, isAdmin,  getProduct) // http://localhost:3000/product
router.get('/:id',  getProductById) // http://localhost:3000/product/1
router.post('/', uploadImage, postProduct)
router.patch('/:id', patchProduct)

module.exports = router
