const { createPayment } = require('../model/payment')
const midtransClient = require('midtrans-client')
const helper = require('../helper/response')

module.exports = {
  postPayment: async (request, response) => {
    try {
      console.log('BERHASIL')
      const { bookingId, nominal } = request.body
      // [model 1] = proses menyimpan data ke database
      // jika behasil akan mendapatkan booking_id
      // [model 2]
      const booking = await createPayment(bookingId, nominal)
      return helper.response(response, 200, 'Success Booking Schedule', booking)
    } catch (error) {
      console.log(error)
    }
  },
  postMidtransNotif: async (request, response) => {
    try {
      const snap = new midtransClient.Snap({
        isProduction: false,
        serverKey: 'SB-Mid-server-KItkJVnyFsZRa-JD5HL_x_DC',
        clientKey: 'SB-Mid-client-lyiBVkXY-ImOkiuQ'
      })

      snap.transaction.notification(request.body).then((statusResponse) => {
        const orderId = statusResponse.order_id
        const transactionStatus = statusResponse.transaction_status
        const fraudStatus = statusResponse.fraud_status

        console.log(
          `Transaction notification received. Order ID: ${orderId}. Transaction status: ${transactionStatus}. Fraud status: ${fraudStatus}`
        )

        // Sample transactionStatus handling logic

        if (transactionStatus == 'capture') {
          // capture only applies to card transaction, which you need to check for the fraudStatus
          if (fraudStatus == 'challenge') {
            // TODO set transaction status on your databaase to 'challenge'
          } else if (fraudStatus == 'accept') {
            // TODO set transaction status on your databaase to 'success'
            // [model 1] proses itu untuk mengubah status booking menjadi berhasil
          }
        } else if (transactionStatus == 'settlement') {
          // TODO set transaction status on your databaase to 'success'
          // [model 1] proses itu untuk mengubah status booking menjadi berhasil
        } else if (transactionStatus == 'deny') {
          // TODO you can ignore 'deny', because most of the time it allows payment retries
          // and later can become success
        } else if (
          transactionStatus == 'cancel' ||
          transactionStatus == 'expire'
        ) {
          // TODO set transaction status on your databaase to 'failure'
        } else if (transactionStatus == 'pending') {
          // TODO set transaction status on your databaase to 'pending' / waiting payment
        }
      })
    } catch (error) {}
  }
}
