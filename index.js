const express = require('express')
const cors = require('cors');
const app = express()
const port = 3001
const bodyParser = require('body-parser')
const db = require('./connection.js')
const response = require('./response.js')
const crypto = require('crypto')



// Middleware untuk mengizinkan CORS (Cross-Origin Resource Sharing)
app.use(function(req, res, next) {
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Origin', 'http://127.0.0.1:5500');
  res.setHeader('Access-Control-Allow-Origin', 'http://127.0.0.1:5501');
  res.setHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE');
  res.setHeader('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content-Type, Accept');
  next();
});
app.use(cors({
  origin: 'http://127.0.0.1:5501',
}));


app.use(bodyParser.json())


app.get('/', (req, res) => {
  response(200, "Ini data", `Ini adalah API daily deals. (backend capstone projek section palembang group 3.
    Gunakan /menu untuk get all menu. \n
    Gunakan /menu/burger untuk get menu by ketegori burger. \n
    Gunakan /menu/sandwich untuk get menu by ketegori sandwich. \n
    Gunakan /menu/dessertAndDrink untuk get menu by ketegori dessert & drink. \n
    Gunakan /menu/sides untuk get menu by ketegori sides. \n
    Gunakan /register untuk register (post).\n
    Gunakan /login untuk login (post).`, res)
})

// Get all menu
app.get('/menu', (req, res) => {
  const sql = "SELECT * FROM menu"
  db.query(sql, (err, fields) => {
    if (err) throw err
    response(200, fields, "menu get list", res)
  })
})

//Get menu by kategori
app.get('/menu/:kategori', (req, res) => {
  const kategori = req.params.kategori
  const sql = `SELECT * FROM menu WHERE kategori = "${kategori}"`
  db.query(sql, (err, fields) => {
    if (err) throw err
    response(200, fields, "filter menu by kategori", res)
  })
})

// Get all user
app.get('/user', (req, res) => {
  const sql = "SELECT * FROM user"
  db.query(sql, (err, fields) => {
    if (err) throw err
    response(200, fields, "user get list", res)
  })
})

// Post user (untuk register)
app.post('/register', (req, res) => {
  const { username, email, password } = req.body;
  // Enkripsi password menggunakan MD5
  const md5 = crypto.createHash('md5');
  const encryptedPassword = md5.update(password).digest('hex');

  const sql = `INSERT INTO user (username, email, password) VALUES ("${username}", "${email}", "${encryptedPassword}")`;
  db.query(sql, (err, fields) => {
    if (err) response(500, "invalid", "error", res);
    if (fields.affectedRows > 0){
      const data = {
        isSuccess: true,
        id: fields.insertID,
      };
      response(200, data, "Data Added Succes", res);
    }
  });
});

// post user (untuk login)
app.post('/login', (req, res) => {
  const { username, password } = req.body;
  
  // Enkripsi password yang diinputkan oleh pengguna untuk mencocokkan dengan yang ada di database
  const md5 = crypto.createHash('md5');
  const encryptedPassword = md5.update(password).digest('hex');

  const sql = `SELECT * FROM user WHERE username = "${username}" AND password = "${encryptedPassword}"`;
  
  db.query(sql, (err, results) => {
    if (err) {
      response(500, "invalid", "error", res);
    } else {
      if (results.length === 1) {
        const user = results[0];
        // Jika ada hasil yang cocok, maka akan mengizinkan pengguna masuk
        const data = {
          isSuccess: true,
          id: user.id,
          username: user.username,
          email: user.email,
        };
        response(200, data, "Login Successful", res);
      } else {
        // Jika tidak ada hasil yang cocok, maka akan memberi tahu pengguna bahwa login gagal
        response(401, "invalid", "Login Failed", res);
      }
    }
  });
});


// Route untuk menambahkan data ke tabel "keranjang"
app.post('/keranjang', (req, res) => {
  const { jumlah, total_harga, id_menu, id_user, tanggal } = req.body;

  const sql = 'INSERT INTO keranjang (jumlah, total_harga, id_menu, id_user, tanggal) VALUES (?, ?, ?, ?, ?)';
  const values = [jumlah, total_harga, id_menu, id_user, tanggal];

  db.query(sql, values, (err, result) => {
    if (err) {
      console.error('Error inserting data into keranjang:', err);
      res.status(500).json({ message: 'Internal server error' });
    } else {
      res.status(200).json({ message: 'Data added to keranjang successfully' });
    }
  });
});



app.put('/menu', (req, res) => {
  const { id, nama, deskripsi, harga, gambar, kategori } = req.body
  const sql = `UPDATE menu SET nama='${nama}', deskripsi='${deskripsi}', harga=${harga}, 
  gambar='${gambar}', kategori='${kategori}'`

  db.query(sql, (err, fields) => {
    if (err) response(500, "invalid", "error", res)
    if (fields?.affectedRows){
      const data = {
        isSuccess: fields.affectedRows,
        message: fields.message,
      }
      response(200, data, "Succes update menu", res)
    } else {
      response(404, "menu not found", "error", res)
    }
  })
})

app.delete('/menu', (req, res) => {
  const { id } = req.body
  const sql = `DELETE FROM menu WHERE id=${id}`
  db.query(sql, (err, fields) => {
    if (err) response(500, "invalid", "error", res)
    if (fields?.affectedRows){
      const data = {
        isDeleted: fields.affectedRows,
      }
      response(200, data, "Deleted menu succes", res)
    } else {
      response(404, "menu not found", "error", res)
    }
  })
})

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})

// const sql = `INSERT INTO user (username, email, password) VALUES ("${username}", "${email}", "CryptoJS.MD5(${password})")`