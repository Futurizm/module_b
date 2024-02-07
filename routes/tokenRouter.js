const Router = require('express')
const router = new Router()
const tokenController = require('../controllers/tokenController')


router.post('/create-token/:workspaceId', tokenController.createToken)
router.post('/revoke-token/:id', tokenController.revokeTokenDemo1)
router.get('/api-tokens/:workspaceId', tokenController.getAllTokens)


module.exports = router