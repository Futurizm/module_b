const ApiError = require('../errors/ApiError')
const {User} = require('../models/models')
const bcrypt = require('bcrypt')

class UserController {
    async login (req, res, next) {
        const {username, password} = req.body
        const user = await User.findOne({where: {username}})

        if (!user) {
            return res.json({message: "Пользователь с таким именем не найден"})
        }

        if (password !== user.password) {
            return res.json({message: "Неверный пароль"})
        }

        if (password === user.password) {
            if (username === 'demo1') {
                return res.redirect('/workspace/workspace-demo1')
            } else if(username === 'demo2') {
                return res.redirect('/workspace/workspace-demo2')
            }
        }

        return res.json({message: "Все отлично"})
    }

    async renderUser (req, res, next) {
        try {
            const user = await User.findAll()
            
            
            return res.render('login', {data: user})
        } catch (e) {
            return res.json({message: e})
        }
    }
    
}


module.exports = new UserController()