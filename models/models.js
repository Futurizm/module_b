const sequelize = require('../db')
const {DataTypes} = require('sequelize')


const User = sequelize.define('user', {
    id: {type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true},
    username: {type: DataTypes.STRING, unique: true, allowNull: false},
    password: {type: DataTypes.STRING, allowNull: false}
})


const Workspace = sequelize.define('workspace', {
    id: {type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true},
    title: {type: DataTypes.STRING, unique: true, allowNull: false},
    description: {type: DataTypes.STRING, allowNull: false},
    // Внешние поля sequelize подключает сам (user_id)
})

const BillingQuota = sequelize.define('billing_quota', {
    id: {type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true},
    limit: {type: DataTypes.DECIMAL, allowNull: false},
    // Внешние поля sequelize подключает сам (workspace_id)
})

const ApiToken = sequelize.define('api_token', {
    id: {type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true},
    title: {type: DataTypes.STRING, allowNull: false, unique: true},
    token: {type: DataTypes.STRING, allowNull: false, unique: true},
    // Внешние поля sequelize подключает сам (workspace_id)
})
    
const Bill = sequelize.define('bill', {
    username: {type: DataTypes.STRING, allowNull: false},
    workspace_title: {type: DataTypes.STRING, allowNull: false},
    api_token_name: {type: DataTypes.STRING, allowNull: false},
    usage_duration_in_ms: {type: DataTypes.INTEGER, allowNull: false},
    usage_started_at: {type: DataTypes.DATE, allowNull: false},
    service_name: {type: DataTypes.STRING, allowNull: false},
    service_cost_per_ms: {type: DataTypes.DECIMAL(10, 6), allowNull: false},
})


User.hasMany(Workspace)
Workspace.belongsTo(User)

Workspace.hasOne(BillingQuota)
BillingQuota.belongsTo(Workspace)

Workspace.hasMany(ApiToken)
ApiToken.belongsTo(Workspace)

Workspace.hasOne(Bill)
Bill.belongsTo(Workspace)

Bill.hasMany(ApiToken)
ApiToken.belongsTo(Bill)

module.exports = {
    User,
    Workspace,
    BillingQuota,
    ApiToken,
    Bill
}

