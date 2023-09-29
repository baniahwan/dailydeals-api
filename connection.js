const mysql = require('mysql')

const db = mysql.createConnection({
    host: "sql12.freesqldatabase.com",
    user: "sql12649840",
    password: "xy9iyTMuqQ",
    database: "sql12649840",
    port: 3306
})

module.exports = db