const connection = require('../config/mysql')

module.exports = {
  registerUserModel: (setData) => {
    return new Promise((resolve, reject) => {
      connection.query('INSERT INTO users SET ?', setData, (error, result) => {
        if (!error) {
          const newResult = {
            user_id: result.insertId,
            ...setData
          }
          delete newResult.user_password
          resolve(newResult)
        } else {
          reject(new Error(error))
        }
      })
    })
  },
  checkEmailModel: (email) => {
    return new Promise((resolve, reject) => {
      connection.query(
        'SELECT user_id, user_name, user_email, user_password FROM users WHERE user_email = ?',
        email,
        (error, result) => {
          !error ? resolve(result) : reject(new Error(error))
        }
      )
    })
  }
}
