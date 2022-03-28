const dotenv = require('dotenv')
const { resolve } = require('path')
dotenv.config({ path: resolve(__dirname, './local.env') })

module.exports = {
  type: 'mysql',
  host: process.env.SQL_HOST,
  port: parseInt(process.env.SQL_PORT),
  username: process.env.SQL_USER,
  password: process.env.SQL_PASSWORD,
  database: process.env.SQL_DATABASE,
}