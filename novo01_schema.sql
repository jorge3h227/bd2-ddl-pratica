USE universidade;

CREATE TABLE `alunos` (
  `id` int NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `data_nascimento` date DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
);

CREATE TABLE `matriculas` (
  `id` int NOT NULL,
  `curso` varchar(150) DEFAULT NULL,
  `data_matricula` date DEFAULT NULL,
  `aluno_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_matricula_aluno` (`aluno_id`),
  CONSTRAINT `fk_matricula_aluno` FOREIGN KEY (`aluno_id`) REFERENCES `alunos` (`id`)
);

INSERT INTO alunos VALUES
(1, 'Ana Silva', '2002-05-10', 'ana@email.com'),
(2, 'Carlos Souza', '2001-11-20', 'carlos@email.com'),
(3, 'Mariana Lima', '2003-03-15', 'mariana@email.com');

INSERT INTO matriculas VALUES
(1, 'Sistemas de Informação', '2024-02-10', 1),
(2, 'Ciência da Computação', '2024-02-11', 2),
(3, 'Engenharia de Software', '2024-02-12', 3);