const router = require('express').Router()
const {
  registerUser,
  loginUser,
  forgotPassword,
  refreshToken
} = require('../controller/user')

router.post('/register', registerUser)
router.post('/login', loginUser)
router.post('/forgot', forgotPassword)
router.post('/refresh', refreshToken)

module.exports = router
