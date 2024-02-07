const ApiError = require('../errors/ApiError')
const {BillingQuota} = require('../models/models')


class BillingController {

    async renderBillingQuota(req, res, next) {
        const workspaceId = req.params.workspaceId
        try {
            const currentData = await BillingQuota.findAll({where: {workspaceId: workspaceId}})
            
            const demo1 = 'demo1'
            const demo2 = 'demo2'

            const userConstant = (req.user && req.user.username === 'demo1') ? demo1 : demo2;

            return res.render(`billing-quotas-${userConstant}`, {data: currentData, workspaceId: workspaceId})
        } catch (e) {
            next(ApiError.internal(e))
        }
    }

    async createBillingQuota(req, res, next) {
        const workspaceId = req.params.workspaceId
        try {
            if (req.method === 'POST') {
                const { limit } = req.body

                let billingQuota = await BillingQuota.findOne({where: {workspaceId: workspaceId}})

                if(limit > 100000) {
                    next(ApiError.internal("Слишком большое значение"))
                }

                if (!billingQuota) {
                    billingQuota = await BillingQuota.create({
                        limit, 
                        workspaceId
                    })
                } else {
                    billingQuota.limit = limit
                    await billingQuota.save()
                }


                return res.redirect(`/billing-quota/render-quota/${workspaceId}`)
            }
        } catch (e) {
            next(ApiError.internal(e))
        }
    }

    async deleteBillingQuota (req, res, next) {
        const id = req.params.id

        try {
            const billing = await BillingQuota.findOne({ where: { id: id } });
    
            await billing.destroy()
    
            return res.redirect('back')
        } catch (e) {
            next(ApiError.internal(e))            
        }
    }
}


module.exports = new BillingController()