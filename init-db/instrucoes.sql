ALTER TABLE alunos ADD telefone varchar(20);
ALTER TABLE matriculas MODIFY COLUMN curso varchar(150);
ALTER TABLE matriculas ADD CONSTRAINT fk_matricula_aluno FOREIGN KEY (aluno_id) REFERENCES alunos(id);
CREATE VIEW alunos_matriculados2 AS SELECT a.id, a.nome, m.curso, m.data_matricula FROM alunos a JOIN matriculas m ON a.id = m.aluno_id;
