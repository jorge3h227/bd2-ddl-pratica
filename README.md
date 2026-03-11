# Banco de Dados 2 - DLL - Prática
Prática com instruções SQL DDL. Disciplina Banco de Dados 2

### Iniciar o ambiente
    docker compose up -d

### Acessar o banco de dados
    docker exec -it mysql_bd2 mysql -u dev -p'minhasenha' --database universidade

Os parâmetros desse comando são definidos no docker-compose.yml

### Encerrar o ambiente
    exit
    docker compose down

[! IMPORTANTE] O comando docker compose down irá apagar todas as alterações realizadas

# Prática

### Comandos para visualizar/explorar a database e as tabelas
    SHOW CREATE DATABASE nome_da_database;
    DESC nome_da_tabela;
    SHOW INDEX FROM nome_da_tabela;


### Desafio 1 - Adicione uma nova coluna

A tabela aluno deve armazenar o telefone do estudante.

Requisitos:
 - o campo deve armazenar números de telefone
 - deve permitir até 20 caracteres
 - pode aceitar valores nulos

Após a alteração, a tabela aluno deve conter um campo adicional para telefone.

### Desafio 2 - Modifique a estrutura da tabela matricula 

Altere a coluna curso da tabela matriculas para que a coluna passe a suportar até 150 caracteres.

### Desafio 3 - Crie um relacionamento entre:

- matricula.aluno_id 

    e
- aluno.id

Esse relacionamento deve garantir integridade referencial, impedindo que uma matrícula seja registrada para um aluno inexistente.


### Desafio 4 - Criando uma View

Para facilitar consultas administrativas, deseja-se criar uma visão que mostre:

- id do aluno
- nome do aluno
- curso
- data da matrícula

Essa visão deve combinar dados das tabelas alunos e matriculas

### Execução
[! IMPORTANTE] Salve todos os comandos em um arquivo nomeado `instrucoes.sql` na raiz do repositório

### Validação

#### -  Tente deletar a tabela alunos
Resultado esperado: o SGBD deve bloquear devido a integridade da chave estrangeira com a tabela matrícula

#### - Faça um insert na tabela alunos com o campo telefone com valor nulo e outro com um valor com mais de 20 caracteres, exemplo: `INSERT INTO alunos (id, nome, telefone) VALUES (4, 'Seu nome', null),(5, 'Outro aluno', '+55brasil+ddd32999219921')
Resultado esperado: O valor nulo deve ser aceito, mas o valor do campo telefone com mais de 20 caracteres deve retornar um erro.

#### - Faça uma consulta na VIEW criada, exemplo: `SELECT * FROM nome_da_view`
Resultado esperado: O SGBD deve retornar os dados do aluno e matrícula contendo os campos (id do aluno, nome do aluno, curso, data da matrícula)