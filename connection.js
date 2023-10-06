const mysql = require('mysql')

const db = mysql.createConnection({
    host: "b9b9aottiooh6egdqsku-mysql.services.clever-cloud.com",
    user: "uqpbwhwstmid9izt",
    password: "A1Q3wKffeK3viigreLip",
    database: "b9b9aottiooh6egdqsku",
    port: 3306
})

module.exports = db