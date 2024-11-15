-- Gerente de Projeto
CREATE USER 'gerente_projeto'@'localhost' IDENTIFIED BY 'senha_gerente_projeto';

GRANT SELECT, INSERT, UPDATE, DELETE ON projetos.* TO 'gerente_projeto'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON cronogramas_projetos.* TO 'gerente_projeto'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON alocacao_funcionarios.* TO 'gerente_projeto'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON etapas_projetos.* TO 'gerente_projeto'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON relatorios_progresso.* TO 'gerente_projeto'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON relatorios_funcionarios.* TO 'gerente_projeto'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON relatorios_gastos.* TO 'gerente_projeto'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON relatorios_despesas_funcionarios.* TO 'gerente_projeto'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON relatorios_despesas_materiais.* TO 'gerente_projeto'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON previsoes_orcamentarias.* TO 'gerente_projeto'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON despesas_materiais.* TO 'gerente_projeto'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON despesas_gerais.* TO 'gerente_projeto'@'localhost';



-- Engenheiro
CREATE USER 'engenheiro'@'localhost' IDENTIFIED BY 'senha_engenheiro';

GRANT SELECT ON cronogramas_projetos.* TO 'engenheiro'@'localhost';
GRANT SELECT ON alocacao_funcionarios.* TO 'engenheiro'@'localhost';
GRANT SELECT ON etapas_projetos.* TO 'engenheiro'@'localhost';
GRANT SELECT ON relatorios_progresso.* TO 'engenheiro'@'localhost';
GRANT SELECT ON relatorios_funcionarios.* TO 'engenheiro'@'localhost';



-- Fornecedor
CREATE USER 'fornecedor'@'localhost' IDENTIFIED BY 'senha_fornecedor';

GRANT SELECT ON fornecedores.* TO 'fornecedor'@'localhost';
GRANT SELECT ON materiais.* TO 'fornecedor'@'localhost';
GRANT SELECT, INSERT ON pedidos_materiais.* TO 'fornecedor'@'localhost';
GRANT SELECT ON entregas_materiais.* TO 'fornecedor'@'localhost';
GRANT SELECT ON inventario_materiais.* TO 'fornecedor'@'localhost';





