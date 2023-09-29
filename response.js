const response = (statusCode, data, message, res) => {
    res.status(statusCode).json ([
        {
            payload: data,
            message,
        },
    ])
}

module.exports = response