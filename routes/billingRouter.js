const Router = require('express')
const router = new Router()
const billingController = require('../controllers/billingController')


router.get('/render-quota/:workspaceId', billingController.renderBillingQuota)
router.post('/create-quota/:workspaceId', billingController.createBillingQuota)
router.post('/delete-quota/:id', billingController.deleteBillingQuota)

module.exports = router

