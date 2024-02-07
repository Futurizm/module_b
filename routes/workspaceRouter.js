const Router = require('express')
const router = new Router()
const workspaceController = require('../controllers/workspaceController')


router.post('/workspace-demo1', workspaceController.createWorkspaceDemo1)
router.get('/workspace-demo1', workspaceController.renderWorkspaceDemo1)
router.post('/workspace-demo2', workspaceController.createWorkspaceDemo2)
router.get('/workspace-demo2', workspaceController.renderWorkspaceDemo2)

router.post('/delete-workspace/:id', workspaceController.deleteWorkspace)

router.get('/update-workspace/:id', workspaceController.renderUpdateWorkspace)
router.post('/update-workspace/:id', workspaceController.updateWorkspaceDemo)


module.exports = router