const express = require('express');
const bodyParser = require('body-parser');
const mysql = require('mysql');
const path = require('path');

const app = express();
const port = 3000;

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

// Configuração para servir arquivos estáticos
app.use(express.static(path.join(__dirname, 'public')));

// Rota para servir o arquivo HTML principal
app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, 'views', 'index.html'));
});

// Rota para servir o arquivo HTML da seção 'usuario'
app.get('/usuario', (req, res) => {
    res.sendFile(path.join(__dirname, 'views', 'usuario', 'index.html'));
});

// Configuração da conexão com o banco de dados MySQL
const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'prova99'
});

db.connect((err) => {
    if (err) {
        console.error('Erro ao conectar ao banco de dados:', err);
        return;
    }
    console.log('Conectado ao banco de dados MySQL');
});

// Rota para processar o formulário de login
app.post('/submit-form', (req, res) => {
    const { email, senha, role } = req.body;

    const sql = 'SELECT * FROM users WHERE email = ? AND password = ?';
    db.query(sql, [email, senha], (err, results) => {
        if (err) {
            console.error('Erro ao executar consulta SQL:', err);
            res.status(500).send('Erro interno ao tentar fazer login');
            return;
        }

        if (results.length > 0) {
            const user = results[0];
            if ((role === 'professor' && !user.isAdmin) || (role === 'aluno' && user.isAdmin)) {
                res.status(400).send('Inserção de dados incorreta');
                return;
            }
            if (user.isAdmin && role === 'professor') {
                res.redirect('http://localhost/shadcnui-sch/views/prova99/index.php');
            } else if (role === 'aluno') {
                res.redirect('/usuario');
            } else {
                res.status(401).send('Usuário não autorizado');
            }
        } else {
            res.status(401).send('Email ou senha incorretos');
        }
    });
});

// Inicia o servidor na porta especificada
app.listen(port, () => {
    console.log(`Servidor rodando na porta ${port}`);
});
