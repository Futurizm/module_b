const Router = require('express');
const router = new Router()
const billsController = require('../controllers/billsController')


router.get('/bills-list', billsController.renderBills)
// router.post('/bills-list', billsController.watchBills)

module.exports = router