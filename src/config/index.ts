const dotenv = require("dotenv");
const {resolve} = require("path");

dotenv.config({ path: resolve(__dirname, '../../local.env') })

export default {
    host_values: {
        host: process.env.HOST,
        port: process.env.PORT
    },
    sql_values: {
        sql_host : process.env.SQL_HOST,
        sql_port : process.env.SQL_PORT,
        sql_user : process.env.SQL_USER,
        sql_password : process.env.PASSWORD,
        sql_database : process.env.SQL_DATABASE
    }
}