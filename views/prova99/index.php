<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SENAI - Instrutores</title>
    <link rel="stylesheet" href="styless.css">
</head>
<body>
    <section class="dashboard my-classes">
        <header>
                <div class="header-main">
                <img class="homeicon" src="home.png">
                <h1 class="minhaturma">Minhas turmas</h1>
                <select name="Turmas" id="turma" class="seletor" onchange="loadNotas(this.value)">
                    <option value="1">Turma A</option>
                    <option value="2">Turma B</option>
                    <option value="3">Turma C</option>
                </select>
            </div>

            </div>  
        </header>

        <div class="union">
                <img class="seta" src="seta.png">
                <h1 class="turma">Técnico em Informática para Internet</h1>
                <img class="tresbarras" src="tresbarras.png">
            </div>
            </div>
        <!-- Tabela de Notas -->
        <table id="notas-table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nota</th>
                    <th>Turma</th>
                    <th>Aluno</th>
                </tr>
            </thead>
            <tbody>
                <?php
                $host = 'localhost';
                $dbname = 'prova99';
                $usuario = 'root';
                $senha = '';

                try {
                    $pdo = new PDO("mysql:host=$host;dbname=$dbname", $usuario, $senha);
                    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                } catch (PDOException $e) {
                    die("Erro ao conectar: " . $e->getMessage());
                }

                if (isset($_GET['turmaId'])) {
                    $turmaId = $_GET['turmaId'];
                    $sql = "
                        SELECT notas.id, notas.nota, turmas.nome AS turma_nome, users.name AS aluno_nome
                        FROM notas
                        JOIN turmas ON notas.turma_id = turmas.id
                        JOIN users ON notas.user_id = users.id
                        WHERE turmas.id = :turmaId
                        ORDER BY notas.nota ASC
                    ";
                    $stmt = $pdo->prepare($sql);
                    $stmt->bindParam(':turmaId', $turmaId, PDO::PARAM_INT);
                    $stmt->execute();

                    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                        echo "<tr>";
                        echo "<td>{$row['id']}</td>";
                        echo "<td>{$row['nota']}</td>";
                        echo "<td>{$row['turma_nome']}</td>";
                        echo "<td>{$row['aluno_nome']}</td>";
                        echo "</tr>";
                    }
                } else {
                    echo "<tr><td colspan='4'>Selecione uma turma</td></tr>";
                }

                $pdo = null;
                ?>
            </tbody>
        </table>
    </section>

    <footer>
        <div class="hotbar"></div>
        <img class="logosenai" src="logosenai.png">
        <img class="profile" src="profile.png">
        <h1 class="nomeprofessor">Painel do profissional</h1>
    </footer>

    <script>
        function loadNotas(turmaId) {
            window.location.href = `?turmaId=${turmaId}`;
        }

        document.addEventListener('DOMContentLoaded', () => {
            const seletor = document.getElementById('turma');
            if (window.location.search.includes('turmaId')) {
                const params = new URLSearchParams(window.location.search);
                const turmaId = params.get('turmaId');
                seletor.value = turmaId;
            } else {
                loadNotas(seletor.value);
            }
        });
    </script>
</body>
</html>
