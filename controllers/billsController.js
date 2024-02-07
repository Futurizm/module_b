const ApiError = require('../errors/ApiError')
const {Bill, ApiToken} = require('../models/models')
const Sequelize = require('sequelize')
const Op = Sequelize.Op


class BillsController {
    async renderBills(req, res, next) {
        try {
            let bills;
            
            const selectedMonth = req.query.selectedMonth;
            console.log(selectedMonth);
            if (selectedMonth) {
                // Парсим выбранный месяц и получаем соответствующий диапазон id
                let monthId

                if (selectedMonth === '2024-07') { 
                    monthId = { [Op.between]: [1, 114]}
                } else if (selectedMonth === '2024-08') {
                    monthId = { [Op.between]: [115, 172]}
                } else {
                    monthId = { [Op.between]: [1, 172]}
                }


                // Выполняем фильтрацию по диапазону id месяца
                bills = await Bill.findAll({
                    where: {
                        id: monthId
                    }
                });

                
            } else {
                bills = await Bill.findAll();
            }

            const demo1 = 'demo1'
            const demo2 = 'demo2'

            const userConstant = (req.user && req.user.username === 'demo2') ? demo1 : demo2;

            res.render(`bills-list-${userConstant}`, { bills: bills });
        } catch (e) {
            next(ApiError.internal(e));
        }
    }


    async watchBills(req, res, next) {
        try {
            
        } catch (e) {
            
        }
    }
}


module.exports = new BillsController()