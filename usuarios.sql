--  Gerente de Projeto
CREATE USER 'gerente_projeto'@'localhost' IDENTIFIED BY 'senha_gerente_projeto';

GRANT SELECT, INSERT, UPDATE, DELETE ON projetos.* TO 'gerente_projeto'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON relatorios_progresso.* TO 'gerente_projeto'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON alocacao_funcionarios.* TO 'gerente_projeto'@'localhost';



-- Engenheiro
CREATE USER 'engenheiro'@'localhost' IDENTIFIED BY 'senha_engenheiro';

GRANT SELECT ON relatorios_progresso.* TO 'engenheiro'@'localhost';
GRANT SELECT ON alocacao_funcionarios.* TO 'engenheiro'@'localhost';



-- Criar o usuário para Fornecedor
CREATE USER 'fornecedor'@'localhost' IDENTIFIED BY 'senha_fornecedor';

GRANT SELECT ON fornecedores.* TO 'fornecedor'@'localhost';
GRANT SELECT ON materiais.* TO 'fornecedor'@'localhost';




