const {Workspace, User} = require('../models/models')
const ApiError = require('../errors/ApiError')
const billingController = require('./billingController');


class WorkspaceController {
    async createWorkspaceDemo1(req, res, next) {
        try {
            if (req.method === 'POST') {
                const { title, description } = req.body;

                // Пример выполнения запроса INSERT с использованием Sequelize
                await Workspace.create({
                    title,
                    description,
                })      

                return res.redirect('/workspace/workspace-demo1');
            }
        } catch (e) {
            next(ApiError.internal(e))
        }
    }

    async renderWorkspaceDemo1 (req, res, next) {
        try {
            const workspaces = await Workspace.findAll()
            
            return res.render('workspace-demo1', {data: workspaces})
        } catch (e) {
            next(ApiError.internal(e))
        }
    }




    async deleteWorkspace (req, res, next) {
        const id = req.params.id

        try {
            const workspace = await Workspace.findOne({ where: { id: id } });
    
            await workspace.destroy()
    
            return res.redirect('back')
        } catch (e) {
            next(ApiError.internal(e))            
        }
    }

    async renderUpdateWorkspace (req, res, next) {
        const id = req.params.id
        try {
            const currentData = await Workspace.findOne({where: {id: id}})

            res.render('update-workspace', {data: currentData})
        } catch (e) {
            next(ApiError.internal(e))
        }
    }

    async updateWorkspaceDemo (req, res, next) {
        try {
            const {title, description, id} = req.body
            const demo1 = 'demo1'
            const demo2 = 'demo2'
            
            if (title !== undefined && description !== undefined && id !== undefined) {
                await Workspace.update(
                    { title, description },
                    {
                        where: { id },
                    }
                )
            } else {
                console.error('Данные из формы не определены или отсутствует идентификатор.');
            }

            const userConstant = (req.user && req.user.username === 'demo1') ? demo1 : demo2;


            res.redirect(`/workspace/workspace-${userConstant}`)
        } catch (e) {
            next(ApiError.internal(e))
        }
    }


    async createWorkspaceDemo2(req, res, next) {
        try {
            if (req.method === 'POST') {
                const { title, description } = req.body;

                // Пример выполнения запроса INSERT с использованием Sequelize
                await Workspace.create({
                    title,
                    description,
                })      

                return res.redirect('/workspace/workspace-demo2');
            }
        } catch (e) {
            next(ApiError.internal(e))
        }
    }

    async renderWorkspaceDemo2 (req, res, next) {
        try {
            const workspaces = await Workspace.findAll()
            
            return res.render('workspace-demo2', {data: workspaces})
        } catch (e) {
            next(ApiError.internal(e))
        }
    }



}

module.exports = new WorkspaceController()