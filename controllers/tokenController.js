const ApiError = require('../errors/ApiError')
const {ApiToken} = require('../models/models')
const { v4 } = require('uuid')

 
class TokenController {
    async getAllTokens(req, res, next) {
        const workspaceId = req.params.workspaceId
        try {
            const tokens = await ApiToken.findAll({
                where: {workspaceId: workspaceId}
            })

            const demo1 = 'demo1'
            const demo2 = 'demo2'

            const userConstant = (req.user && req.user.username === 'demo1') ? demo1 : demo2;

            res.header('Cache-Control', 'no-store, no-cache, must-revalidate, private')
            res.render(`api-tokens-${userConstant}`, { tokens: tokens, workspaceId: workspaceId });
        } catch (e) {
            next(ApiError.internal(e))
        }
    }

    async createToken(req, res, next) {
        const workspaceId = req.params.workspaceId
        try {
            const { title } = req.body
            console.log('Received Request Body:', req.body)

            const tokenValue = v4()

            await ApiToken.create({
                title: title,
                token: tokenValue,
                workspaceId: workspaceId,
            })

            const tokens = await ApiToken.findAll({
                where: {workspaceId: workspaceId}
            })
            
            console.log('Tokens after creation:', tokens)

            const demo1 = 'demo1'
            const demo2 = 'demo2'

            const userConstant = (req.user && req.user.username === 'demo1') ? demo1 : demo2;

            res.render(`api-tokens-${userConstant}`, {tokens: tokens, workspaceId: workspaceId, title: title, token: tokenValue})
        } catch (e) {
            next(ApiError.internal(e))
        }
    }

    async revokeTokenDemo1(req, res, next) {
        const tokenId = req.params.id
        const workspaceId = req.body.workspaceId
        try {
            await ApiToken.destroy({
                where: {id: tokenId},
            })
            
            res.redirect('back')
        } catch (e) {
            next(ApiError.internal(e))
        }
    }
}

module.exports = new TokenController()