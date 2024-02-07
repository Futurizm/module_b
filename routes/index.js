const Router = require('express')
const router = new Router()
const userRouter = require('./userRouter')
const workspaceRouter = require('./workspaceRouter')
const tokenRouter = require('./tokenRouter')
const billingRouter = require('./billingRouter')
const billsRouter = require('./billsRouter')


router.use('/user', userRouter)
router.use('/workspace', workspaceRouter)
router.use('/token', tokenRouter)
router.use('/billing-quota', billingRouter)
router.use('/bills', billsRouter)

module.exports = router