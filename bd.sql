drop database test;
create database test;
use test;

CREATE TABLE `projetos` (
  `id` integer PRIMARY KEY,
  `nome` varchar(255),
  `descricao` text,
  `data_inicio` date,
  `data_fim_prevista` date,
  `status` varchar(255),
  `cliente_id` integer,
  `orcamento_id` integer,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE `cronogramas_projetos` (
  `id` integer PRIMARY KEY,
  `projeto_id` integer,
  `etapa_id` integer,
  `data_inicio` date,
  `data_fim_prevista` date,
  `status` varchar(255),
 `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE `orcamentos` (
  `id` integer PRIMARY KEY,
  `projeto_id` integer,
  `valor_total` decimal(18,2),
  `moeda` varchar(255),
  `status` varchar(255),
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE `etapas_projetos` (
  `id` integer PRIMARY KEY,
  `projeto_id` integer,
  `nome` varchar(255),
  `descricao` text,
  `data_inicio` date,
  `data_fim` date,
  `status` varchar(255),
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE `funcionarios` (
  `id` integer PRIMARY KEY,
  `nome` varchar(255),
  `cargo` varchar(255),
  `salario` decimal(18,2),
  `departamento_id` integer,
  `data_contratacao` date,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE `engenheiros` (
  `id` integer PRIMARY KEY,
  `funcionario_id` integer,
  `numero_crea` varchar(255),
  `especializacao` varchar(255),
  `created_at` timestamp
);

CREATE TABLE `pedreiros` (
  `id` integer PRIMARY KEY,
  `funcionario_id` integer,
  `experiencia` varchar(255),
  `created_at` timestamp
);

CREATE TABLE `arquitetos` (
  `id` integer PRIMARY KEY,
  `funcionario_id` integer,
  `portifolio_url` varchar(255),
  `especializacao` varchar(255),
  `created_at` timestamp
);

CREATE TABLE `outros_funcionarios` (
  `id` integer PRIMARY KEY,
  `funcionario_id` integer,
  `especialidade` varchar(255),
  `created_at` timestamp
);

CREATE TABLE `alocacao_funcionarios` (
  `id` integer PRIMARY KEY,
  `projeto_id` integer,
  `funcionario_id` integer,
  `data_inicio` date,
  `data_fim` date,
  `created_at` timestamp
);

CREATE TABLE `departamentos` (
  `id` integer PRIMARY KEY,
  `nome` varchar(255),
  `descricao` text,
 `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE `materiais` (
  `id` integer PRIMARY KEY,
  `nome` varchar(255),
  `especificacao` text,
  `categoria_id` integer,
  `quantidade_em_estoque` integer,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE `inventario_materiais` (
  `id` integer PRIMARY KEY,
  `material_id` integer,
  `quantidade` integer,
  `projeto_id` integer,
  `created_at` timestamp
);

CREATE TABLE `fornecedores` (
  `id` integer PRIMARY KEY,
  `nome` varchar(255),
  `contato_id` integer,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE `pedidos_materiais` (
  `id` integer PRIMARY KEY,
  `material_id` integer,
  `fornecedor_id` integer,
  `quantidade` integer,
  `data_pedido` date,
  `status` varchar(255),
  `created_at` timestamp
);

CREATE TABLE `entregas_materiais` (
  `id` integer PRIMARY KEY,
  `pedido_id` integer,
  `data_entrega` date,
  `quantidade_entregue` integer,
  `status` varchar(255),
  `created_at` timestamp
);

CREATE TABLE `categorias_materiais` (
  `id` integer PRIMARY KEY,
  `nome` varchar(255),
  `descricao` text,
  `created_at` timestamp
);

CREATE TABLE `projetos_materiais` (
  `id` integer PRIMARY KEY,
  `projeto_id` integer,
  `material_id` integer,
  `quantidade` integer,
  `created_at` timestamp
);

CREATE TABLE `folha_pagamento` (
  `id` integer PRIMARY KEY,
  `funcionario_id` integer,
  `valor` decimal(18,2),
  `data_pagamento` date,
  `descricao` text,
  `created_at` timestamp
);

CREATE TABLE `pagamentos_funcionarios` (
  `id` integer PRIMARY KEY,
  `folha_pagamento_id` integer,
  `funcionario_id` integer,
  `data_pagamento` date,
  `valor` decimal(18,2),
  `status` varchar(255),
  `created_at` timestamp
);

CREATE TABLE `despesas_materiais` (
  `id` integer PRIMARY KEY,
  `projeto_id` integer,
  `material_id` integer,
  `quantidade` integer,
  `valor_total` decimal(18,2),
  `created_at` timestamp
);

CREATE TABLE `pagamentos_fornecedores` (
  `id` integer PRIMARY KEY,
  `fornecedor_id` integer,
  `valor` decimal(18,2),
  `data_pagamento` date,
  `descricao` text,
  `status` varchar(255),
  `created_at` timestamp
);

CREATE TABLE `despesas_gerais` (
  `id` integer PRIMARY KEY,
  `projeto_id` integer,
  `descricao` text,
  `valor` decimal(18,2),
  `tipo_despesa_id` integer,
  `data_despesa` date,
  `created_at` timestamp
);

CREATE TABLE `tipos_despesas` (
  `id` integer PRIMARY KEY,
  `nome` varchar(255),
  `descricao` text,
  `created_at` timestamp
);

CREATE TABLE `relatorios_progresso` (
  `id` integer PRIMARY KEY,
  `projeto_id` integer,
  `descricao` text,
  `data_relatorio` date,
  `status` varchar(255),
  `created_at` timestamp
);

CREATE TABLE `relatorios_gastos` (
  `id` integer PRIMARY KEY,
  `projeto_id` integer,
  `descricao` text,
  `valor_total` decimal(18,2),
  `data_relatorio` date,
  `created_at` timestamp
);

CREATE TABLE `previsoes_orcamentarias` (
  `id` integer PRIMARY KEY,
  `projeto_id` integer,
  `descricao` text,
  `valor_previsto` decimal(18,2),
  `created_at` timestamp
);

CREATE TABLE `relatorios_despesas_materiais` (
  `id` integer PRIMARY KEY,
  `projeto_id` integer,
  `material_id` integer,
  `valor_total` decimal(18,2),
  `data_relatorio` date,
  `created_at` timestamp
);

CREATE TABLE `relatorios_despesas_funcionarios` (
  `id` integer PRIMARY KEY,
  `projeto_id` integer,
  `funcionario_id` integer,
  `valor_total` decimal(18,2),
  `data_relatorio` date,
  `created_at` timestamp
);

CREATE TABLE `enderecos` (
  `id` integer PRIMARY KEY,
  `endereco` varchar(255),
  `cidade` varchar(255),
  `estado` varchar(255),
  `cep` varchar(255),
  `created_at` timestamp
);

CREATE TABLE `contatos` (
  `id` integer PRIMARY KEY,
  `telefone` varchar(255),
  `email` varchar(255),
  `created_at` timestamp
);

CREATE TABLE `clientes` (
  `id` integer PRIMARY KEY,
  `nome_usuario` varchar(255),
  `senha` varchar(255),
  `role` varchar(255),
  `endereco_id` integer,
  `contato_id` integer,
 `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

ALTER TABLE `projetos` ADD FOREIGN KEY (`orcamento_id`) REFERENCES `orcamentos` (`id`);

ALTER TABLE `projetos` ADD FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`);

ALTER TABLE `alocacao_funcionarios` ADD FOREIGN KEY (`funcionario_id`) REFERENCES `funcionarios` (`id`);

ALTER TABLE `alocacao_funcionarios` ADD FOREIGN KEY (`projeto_id`) REFERENCES `projetos` (`id`);

ALTER TABLE `folha_pagamento` ADD FOREIGN KEY (`funcionario_id`) REFERENCES `funcionarios` (`id`);

ALTER TABLE `cronogramas_projetos` ADD FOREIGN KEY (`etapa_id`) REFERENCES `etapas_projetos` (`id`);

ALTER TABLE `cronogramas_projetos` ADD FOREIGN KEY (`projeto_id`) REFERENCES `projetos` (`id`);

ALTER TABLE `clientes` ADD FOREIGN KEY (`endereco_id`) REFERENCES `enderecos` (`id`);

ALTER TABLE `clientes` ADD FOREIGN KEY (`contato_id`) REFERENCES `contatos` (`id`);

ALTER TABLE `funcionarios` ADD FOREIGN KEY (`departamento_id`) REFERENCES `departamentos` (`id`);

ALTER TABLE `arquitetos` ADD FOREIGN KEY (`funcionario_id`) REFERENCES `funcionarios` (`id`);

ALTER TABLE `pedreiros` ADD FOREIGN KEY (`funcionario_id`) REFERENCES `funcionarios` (`id`);

ALTER TABLE `engenheiros` ADD FOREIGN KEY (`funcionario_id`) REFERENCES `funcionarios` (`id`);

ALTER TABLE `outros_funcionarios` ADD FOREIGN KEY (`funcionario_id`) REFERENCES `funcionarios` (`id`);

ALTER TABLE `inventario_materiais` ADD FOREIGN KEY (`material_id`) REFERENCES `materiais` (`id`);

ALTER TABLE `inventario_materiais` ADD FOREIGN KEY (`projeto_id`) REFERENCES `projetos` (`id`);

ALTER TABLE `fornecedores` ADD FOREIGN KEY (`contato_id`) REFERENCES `contatos` (`id`);

ALTER TABLE `projetos_materiais` ADD FOREIGN KEY (`projeto_id`) REFERENCES `projetos` (`id`);

ALTER TABLE `projetos_materiais` ADD FOREIGN KEY (`material_id`) REFERENCES `materiais` (`id`);

ALTER TABLE `despesas_materiais` ADD FOREIGN KEY (`projeto_id`) REFERENCES `projetos` (`id`);

ALTER TABLE `despesas_materiais` ADD FOREIGN KEY (`material_id`) REFERENCES `materiais` (`id`);

ALTER TABLE `pagamentos_fornecedores` ADD FOREIGN KEY (`fornecedor_id`) REFERENCES `fornecedores` (`id`);

ALTER TABLE `pagamentos_funcionarios` ADD FOREIGN KEY (`folha_pagamento_id`) REFERENCES `folha_pagamento` (`id`);

ALTER TABLE `pagamentos_funcionarios` ADD FOREIGN KEY (`funcionario_id`) REFERENCES `funcionarios` (`id`);

ALTER TABLE `despesas_gerais` ADD FOREIGN KEY (`projeto_id`) REFERENCES `projetos` (`id`);

ALTER TABLE `despesas_gerais` ADD FOREIGN KEY (`tipo_despesa_id`) REFERENCES `tipos_despesas` (`id`);

ALTER TABLE `previsoes_orcamentarias` ADD FOREIGN KEY (`projeto_id`) REFERENCES `projetos` (`id`);

ALTER TABLE `materiais` ADD FOREIGN KEY (`categoria_id`) REFERENCES `categorias_materiais` (`id`);

ALTER TABLE `relatorios_gastos` ADD FOREIGN KEY (`projeto_id`) REFERENCES `projetos` (`id`);

ALTER TABLE `relatorios_progresso` ADD FOREIGN KEY (`projeto_id`) REFERENCES `projetos` (`id`);

ALTER TABLE `relatorios_despesas_funcionarios` ADD FOREIGN KEY (`funcionario_id`) REFERENCES `funcionarios` (`id`);

ALTER TABLE `relatorios_despesas_funcionarios` ADD FOREIGN KEY (`projeto_id`) REFERENCES `projetos` (`id`);

ALTER TABLE `relatorios_despesas_materiais` ADD FOREIGN KEY (`material_id`) REFERENCES `materiais` (`id`);

ALTER TABLE `relatorios_despesas_materiais` ADD FOREIGN KEY (`projeto_id`) REFERENCES `projetos` (`id`);





-- POPULAR TABELAS!!

INSERT INTO tipos_despesas (id, nome, descricao, created_at)
VALUES
(1, 'Administrativa', 'Despesas relacionadas à gestão administrativa do projeto, como taxas e impostos.', NOW()),
(2, 'Operacional', 'Despesas com operação, como custo de materiais e contratação de serviços.', NOW()),
(3, 'Logística', 'Custos com transporte, armazenamento e movimentação de materiais e pessoal.', NOW()),
(4, 'Jurídica', 'Despesas relacionadas a serviços legais e jurídicos do projeto.', NOW()),
(5, 'Consultoria', 'Despesas com serviços de consultoria contratados para o projeto.', NOW()),
(6, 'Marketing', 'Despesas relacionadas a ações de marketing e publicidade do projeto.', NOW()),
(7, 'Treinamento', 'Custos com treinamento e capacitação da equipe do projeto.', NOW()),
(8, 'Tecnologia', 'Despesas com aquisição e manutenção de equipamentos e software para o projeto.', NOW()),
(9, 'Segurança', 'Despesas com segurança do projeto, como contratação de vigilantes e sistemas de segurança.', NOW()),
(10, 'Imprevistos', 'Despesas não previstas, relacionadas a situações emergenciais e imprevistas no decorrer do projeto.', NOW());


INSERT INTO categorias_materiais (id, nome, descricao, created_at)
VALUES
(1, 'Tijolos', 'Materiais de construção utilizados para levantar paredes.', NOW()),
(2, 'Cimento', 'Produto utilizado para assentar tijolos e realizar fundações.', NOW()),
(3, 'Areia', 'Usada para a fabricação de concreto e assentamento de tijolos.', NOW()),
(4, 'Aço', 'Utilizado para armação de concreto e construção de estruturas metálicas.', NOW()),
(5, 'Madeira', 'Usada principalmente em acabamentos, telhados e pisos.', NOW()),
(6, 'Vidro', 'Material utilizado em janelas e fachadas.', NOW()),
(7, 'Ferragens', 'Inclui portas, fechaduras, dobradiças e outros itens metálicos.', NOW()),
(8, 'Tintas', 'Produtos para acabamento de superfícies, como paredes e madeiras.', NOW()),
(9, 'Elétricos', 'Cabos, fios e materiais necessários para a instalação elétrica.', NOW()),
(10, 'Tubos e Conexões', 'Materiais utilizados para instalações hidráulicas e sanitárias.', NOW());

INSERT INTO enderecos (id, endereco, cidade, estado, cep, created_at)
VALUES
(1, 'Rua A, 123', 'São Paulo', 'SP', '01000-000', NOW()),
(2, 'Rua B, 456', 'Rio de Janeiro', 'RJ', '20000-000', NOW()),
(3, 'Rua C, 789', 'Belo Horizonte', 'MG', '30000-000', NOW()),
(4, 'Rua D, 101', 'Curitiba', 'PR', '80000-000', NOW()),
(5, 'Rua E, 202', 'Porto Alegre', 'RS', '90000-000', NOW()),
(6, 'Rua F, 303', 'Salvador', 'BA', '40000-000', NOW()),
(7, 'Rua G, 404', 'Fortaleza', 'CE', '60000-000', NOW()),
(8, 'Rua H, 505', 'Recife', 'PE', '50000-000', NOW()),
(9, 'Rua I, 606', 'Brasília', 'DF', '70000-000', NOW()),
(10, 'Rua J, 707', 'Manaus', 'AM', '69000-000', NOW());

INSERT INTO contatos (id, telefone, email, created_at)
VALUES
(1, '11987654321', 'cliente1@email.com', NOW()),
(2, '21987654321', 'cliente2@email.com', NOW()),
(3, '31987654321', 'cliente3@email.com', NOW()),
(4, '41987654321', 'cliente4@email.com', NOW()),
(5, '51987654321', 'cliente5@email.com', NOW()),
(6, '61987654321', 'cliente6@email.com', NOW()),
(7, '71987654321', 'cliente7@email.com', NOW()),
(8, '81987654321', 'cliente8@email.com', NOW()),
(9, '91987654321', 'cliente9@email.com', NOW()),
(10, '10987654321', 'cliente10@email.com', NOW());

INSERT INTO departamentos (id, nome, descricao, created_at, updated_at)
VALUES
(1, 'Recursos Humanos', 'Departamento responsável por recrutamento, seleção e gestão de pessoas.', NOW(), NOW()),
(2, 'Financeiro', 'Departamento responsável pelo controle financeiro e contabilidade da empresa.', NOW(), NOW()),
(3, 'Operações', 'Departamento responsável pela execução e gerenciamento de processos operacionais.', NOW(), NOW()),
(4, 'Vendas', 'Departamento responsável por promover e vender os produtos ou serviços da empresa.', NOW(), NOW()),
(5, 'Marketing', 'Departamento responsável pela criação e implementação de estratégias de marketing e comunicação.', NOW(), NOW()),
(6, 'TI (Tecnologia da Informação)', 'Departamento responsável pela infraestrutura de TI, desenvolvimento de sistemas e segurança da informação.', NOW(), NOW()),
(7, 'Jurídico', 'Departamento responsável por assessoria jurídica, elaboração de contratos e resolução de questões legais.', NOW(), NOW()),
(8, 'Compras', 'Departamento responsável pela aquisição de materiais, equipamentos e serviços necessários para a empresa.', NOW(), NOW()),
(9, 'Logística', 'Departamento responsável pela gestão de estoque, transporte e distribuição de materiais e produtos.', NOW(), NOW()),
(10, 'Atendimento ao Cliente', 'Departamento responsável por oferecer suporte e atendimento aos clientes da empresa.', NOW(), NOW());

INSERT INTO clientes (id, nome_usuario, senha, role, endereco_id, contato_id, created_at, updated_at)
VALUES
(1, 'cliente1', 'senha123', 'Admin', 1, 1, NOW(), NOW()),
(2, 'cliente2', 'senha234', 'User', 2, 2, NOW(), NOW()),
(3, 'cliente3', 'senha345', 'User', 3, 3, NOW(), NOW()),
(4, 'cliente4', 'senha456', 'Admin', 4, 4, NOW(), NOW()),
(5, 'cliente5', 'senha567', 'User', 5, 5, NOW(), NOW()),
(6, 'cliente6', 'senha678', 'Admin', 6, 6, NOW(), NOW()),
(7, 'cliente7', 'senha789', 'User', 7, 7, NOW(), NOW()),
(8, 'cliente8', 'senha890', 'Admin', 8, 8, NOW(), NOW()),
(9, 'cliente9', 'senha901', 'User', 9, 9, NOW(), NOW()),
(10, 'cliente10', 'senha012', 'Admin', 10, 10, NOW(), NOW());

INSERT INTO fornecedores (id, nome, contato_id, created_at, updated_at)
VALUES
(1, 'Fornecedor A', 1, NOW(), NOW()),
(2, 'Fornecedor B', 2, NOW(), NOW()),
(3, 'Fornecedor C', 3, NOW(), NOW()),
(4, 'Fornecedor D', 4, NOW(), NOW()),
(5, 'Fornecedor E', 5, NOW(), NOW()),
(6, 'Fornecedor F', 6, NOW(), NOW()),
(7, 'Fornecedor G', 7, NOW(), NOW()),
(8, 'Fornecedor H', 8, NOW(), NOW()),
(9, 'Fornecedor I', 9, NOW(), NOW()),
(10, 'Fornecedor J', 10, NOW(), NOW());

INSERT INTO materiais (id, nome, especificacao, categoria_id, quantidade_em_estoque, created_at, updated_at)
VALUES
(1, 'Cimento', 'Cimento Portland de alta resistência', 1, 500, NOW(), NOW()),
(2, 'Tijolos', 'Tijolos cerâmicos de 30x20x10 cm', 1, 2000, NOW(), NOW()),
(3, 'Areia', 'Areia média para construção', 1, 800, NOW(), NOW()),
(4, 'Custo de Trabalho', 'Valor estimado para custos de trabalho', 2, 0, NOW(), NOW()),
(5, 'Ferro de Construção', 'Barras de ferro para armaduras', 1, 400, NOW(), NOW()),
(6, 'Madeira', 'Madeira de lei para estrutura', 1, 350, NOW(), NOW()),
(7, 'Prego', 'Prego de aço galvanizado 5 cm', 3, 10000, NOW(), NOW()),
(8, 'Cimento Queimado', 'Cimento queimado para acabamento de pisos', 1, 300, NOW(), NOW()),
(9, 'Tinta', 'Tinta acrílica de alta qualidade', 3, 500, NOW(), NOW()),
(10, 'Pedra Brita', 'Pedra britada para fundação e concreto', 1, 1500, NOW(), NOW());

INSERT INTO funcionarios (id, nome, cargo, salario, departamento_id, data_contratacao, created_at, updated_at)
VALUES
(1, 'Ana Silva', 'Gerente de Projetos', 8000.00, 1, '2023-01-15', NOW(), NOW()),
(2, 'Carlos Souza', 'Arquiteto', 7500.00, 2, '2022-10-22', NOW(), NOW()),
(3, 'Beatriz Lima', 'Engenheira Civil', 7000.00, 3, '2023-02-05', NOW(), NOW()),
(4, 'João Pereira', 'Pedreiro', 3500.00, 3, '2024-03-10', NOW(), NOW()),
(5, 'Pedro Costa', 'Assistente Administrativo', 2500.00, 4, '2021-09-30', NOW(), NOW()),
(6, 'Mariana Souza', 'Analista de RH', 4000.00, 5, '2023-01-01', NOW(), NOW()),
(7, 'Ricardo Martins', 'Mestre de Obras', 4500.00, 3, '2023-11-20', NOW(), NOW()),
(8, 'Juliana Silva', 'Técnico em Segurança do Trabalho', 3000.00, 6, '2022-06-25', NOW(), NOW()),
(9, 'Fabiana Rocha', 'Arquiteta', 8000.00, 2, '2021-04-10', NOW(), NOW()),
(10, 'Rafael Oliveira', 'Engenheiro de Obras', 9000.00, 3, '2023-07-15', NOW(), NOW());

INSERT INTO projetos (id, nome, descricao, data_inicio, data_fim_prevista, status, cliente_id, orcamento_id, created_at, updated_at)
VALUES
(1, 'Projeto Alfa', 'Construção de um prédio comercial', '2024-01-01', '2024-12-31', 'Em andamento', 1, 1, NOW(), NOW()),
(2, 'Projeto Beta', 'Reforma de um shopping center', '2024-02-01', '2024-10-31', 'Em andamento', 2, 2, NOW(), NOW()),
(3, 'Projeto Gamma', 'Construção de uma ponte sobre o rio', '2024-03-15', '2025-03-15', 'Planejamento', 3, 3, NOW(), NOW()),
(4, 'Projeto Delta', 'Instalação de redes de esgoto em bairro', '2024-04-01', '2024-07-30', 'Em andamento', 4, 4, NOW(), NOW()),
(5, 'Projeto Epsilon', 'Construção de uma estrada rural', '2024-05-10', '2025-05-10', 'Planejamento', 5, 5, NOW(), NOW()),
(6, 'Projeto Zeta', 'Reforma de hospital público', '2024-06-01', '2024-11-30', 'Em andamento', 6, 6, NOW(), NOW()),
(7, 'Projeto Eta', 'Construção de um centro cultural', '2024-07-01', '2025-07-01', 'Em andamento', 7, 7, NOW(), NOW()),
(8, 'Projeto Theta', 'Instalação de painéis solares em edifícios públicos', '2024-08-15', '2025-08-15', 'Planejamento', 8, 8, NOW(), NOW()),
(9, 'Projeto Iota', 'Desenvolvimento de parque eólico', '2024-09-01', '2026-09-01', 'Planejamento', 9, 9, NOW(), NOW()),
(10, 'Projeto Kappa', 'Ampliação de estação de tratamento de água', '2024-10-01', '2025-10-01', 'Em andamento', 10, 10, NOW(), NOW());

INSERT INTO orcamentos (id, projeto_id, valor_total, moeda, status, created_at, updated_at)
VALUES
(1, 1, 1500000.00, 'BRL', 'Aprovado', NOW(), NOW()),
(2, 2, 800000.00, 'BRL', 'Em análise', NOW(), NOW()),
(3, 3, 5000000.00, 'USD', 'Aprovado', NOW(), NOW()),
(4, 4, 1200000.00, 'BRL', 'Rejeitado', NOW(), NOW()),
(5, 5, 3500000.00, 'USD', 'Aprovado', NOW(), NOW()),
(6, 6, 2000000.00, 'BRL', 'Em análise', NOW(), NOW()),
(7, 7, 4500000.00, 'BRL', 'Aprovado', NOW(), NOW()),
(8, 8, 1000000.00, 'BRL', 'Rejeitado', NOW(), NOW()),
(9, 9, 3000000.00, 'USD', 'Aprovado', NOW(), NOW()),
(10, 10, 700000.00, 'BRL', 'Em análise', NOW(), NOW());

INSERT INTO etapas_projetos (id, projeto_id, nome, descricao, data_inicio, data_fim, status, created_at, updated_at)
VALUES
(1, 1, 'Planejamento', 'Planejamento do Projeto de Construção Alfa', '2024-01-01', '2024-01-10', 'Concluído', NOW(), NOW()),
(2, 1, 'Execução', 'Execução das obras de construção do Projeto Alfa', '2024-01-11', '2024-03-05', 'Em andamento', NOW(), NOW()),
(3, 2, 'Planejamento', 'Planejamento do Projeto Beta', '2024-02-01', '2024-02-10', 'Concluído', NOW(), NOW()),
(4, 2, 'Execução', 'Execução do Projeto Beta - Fase de construção', '2024-02-11', '2024-04-10', 'Em andamento', NOW(), NOW()),
(5, 3, 'Planejamento', 'Planejamento do Projeto Gamma', '2024-03-15', '2024-04-05', 'Concluído', NOW(), NOW()),
(6, 3, 'Execução', 'Execução das obras do Projeto Gamma', '2024-04-06', '2024-06-15', 'Planejamento', NOW(), NOW()),
(7, 4, 'Planejamento', 'Planejamento para o Projeto Delta', '2024-04-01', '2024-04-10', 'Concluído', NOW(), NOW()),
(8, 4, 'Execução', 'Execução das obras do Projeto Delta', '2024-04-11', '2024-07-01', 'Em andamento', NOW(), NOW()),
(9, 5, 'Planejamento', 'Planejamento da construção da estrada - Projeto Epsilon', '2024-05-05', '2024-06-05', 'Concluído', NOW(), NOW()),
(10, 5, 'Execução', 'Execução da construção da estrada - Projeto Epsilon', '2024-06-06', '2024-08-05', 'Em andamento', NOW(), NOW());

INSERT INTO cronogramas_projetos (id, projeto_id, etapa_id, data_inicio, data_fim_prevista, status, created_at, updated_at)
VALUES
(1, 1, 1, '2024-01-05', '2024-03-05', 'Em andamento', NOW(), NOW()),
(2, 1, 2, '2024-03-06', '2024-06-06', 'Planejamento', NOW(), NOW()),
(3, 2, 3, '2024-02-10', '2024-04-10', 'Em andamento', NOW(), NOW()),
(4, 2, 4, '2024-04-11', '2024-07-11', 'Planejamento', NOW(), NOW()),
(5, 3, 5, '2024-03-15', '2024-06-15', 'Em andamento', NOW(), NOW()),
(6, 3, 6, '2024-06-16', '2024-09-16', 'Planejamento', NOW(), NOW()),
(7, 4, 7, '2024-04-01', '2024-07-01', 'Em andamento', NOW(), NOW()),
(8, 4, 8, '2024-07-02', '2024-10-02', 'Planejamento', NOW(), NOW()),
(9, 5, 9, '2024-05-05', '2024-08-05', 'Em andamento', NOW(), NOW()),
(10, 5, 10, '2024-08-06', '2024-11-06', 'Planejamento', NOW(), NOW());

INSERT INTO alocacao_funcionarios (id, projeto_id, funcionario_id, data_inicio, data_fim, created_at)
VALUES
(1, 1, 1, '2024-01-15', '2024-06-15', NOW()),
(2, 1, 2, '2024-01-20', '2024-06-20', NOW()),
(3, 2, 3, '2024-02-01', '2024-07-01', NOW()),
(4, 2, 4, '2024-02-05', '2024-07-05', NOW()),
(5, 3, 5, '2024-03-10', '2024-08-10', NOW()),
(6, 3, 6, '2024-03-15', '2024-08-15', NOW()),
(7, 4, 7, '2024-04-01', '2024-09-01', NOW()),
(8, 4, 8, '2024-04-05', '2024-09-05', NOW()),
(9, 5, 9, '2024-05-01', '2024-10-01', NOW()),
(10, 5, 10, '2024-05-10', '2024-10-10', NOW());


INSERT INTO inventario_materiais (id, material_id, quantidade, projeto_id, created_at)
VALUES
(1, 1, 100, 1, NOW()),
(2, 2, 500, 2, NOW()),
(3, 3, 300, 3, NOW()),
(4, 4, 50, 1, NOW()),
(5, 5, 150, 2, NOW()),
(6, 6, 200, 4, NOW()),
(7, 7, 8000, 3, NOW()),
(8, 8, 120, 5, NOW()),
(9, 9, 250, 6, NOW()),
(10, 10, 1000, 2, NOW());


INSERT INTO pedidos_materiais (id, material_id, fornecedor_id, quantidade, data_pedido, status, created_at)
VALUES
(1, 1, 1, 100, '2024-11-01', 'Pendente', NOW()),
(2, 2, 2, 500, '2024-11-02', 'Concluído', NOW()),
(3, 3, 3, 300, '2024-11-03', 'Pendente', NOW()),
(4, 4, 4, 50, '2024-11-04', 'Em andamento', NOW()),
(5, 5, 5, 150, '2024-11-05', 'Pendente', NOW()),
(6, 6, 6, 200, '2024-11-06', 'Concluído', NOW()),
(7, 7, 7, 8000, '2024-11-07', 'Pendente', NOW()),
(8, 8, 8, 120, '2024-11-08', 'Em andamento', NOW()),
(9, 9, 9, 250, '2024-11-09', 'Pendente', NOW()),
(10, 10, 10, 1000, '2024-11-10', 'Concluído', NOW());


INSERT INTO entregas_materiais (id, pedido_id, data_entrega, quantidade_entregue, status, created_at)
VALUES
(1, 1, '2024-11-05', 100, 'Concluída', NOW()),
(2, 2, '2024-11-06', 500, 'Concluída', NOW()),
(3, 3, '2024-11-07', 300, 'Pendente', NOW()),
(4, 4, '2024-11-08', 50, 'Em andamento', NOW()),
(5, 5, '2024-11-09', 150, 'Pendente', NOW()),
(6, 6, '2024-11-10', 200, 'Concluída', NOW()),
(7, 7, '2024-11-11', 8000, 'Pendente', NOW()),
(8, 8, '2024-11-12', 120, 'Em andamento', NOW()),
(9, 9, '2024-11-13', 250, 'Pendente', NOW()),
(10, 10, '2024-11-14', 1000, 'Concluída', NOW());


INSERT INTO projetos_materiais (id, projeto_id, material_id, quantidade, created_at)
VALUES
(1, 1, 1, 500, NOW()),
(2, 1, 2, 200, NOW()),
(3, 2, 3, 150, NOW()),
(4, 2, 4, 100, NOW()),
(5, 3, 5, 50, NOW()),
(6, 3, 6, 30, NOW()),
(7, 4, 7, 20, NOW()),
(8, 4, 8, 40, NOW()),
(9, 5, 9, 100, NOW()),
(10, 5, 10, 60, NOW());

INSERT INTO folha_pagamento (id, funcionario_id, valor, data_pagamento, descricao, created_at)
VALUES
(1, 1, 3000.00, '2024-10-01', 'Salário referente ao mês de setembro', NOW()),
(2, 2, 3200.00, '2024-10-01', 'Salário referente ao mês de setembro', NOW()),
(3, 3, 2800.00, '2024-10-01', 'Salário referente ao mês de setembro', NOW()),
(4, 4, 3500.00, '2024-10-01', 'Salário referente ao mês de setembro', NOW()),
(5, 5, 4000.00, '2024-10-01', 'Salário referente ao mês de setembro', NOW()),
(6, 6, 2500.00, '2024-10-01', 'Salário referente ao mês de setembro', NOW()),
(7, 7, 3300.00, '2024-10-01', 'Salário referente ao mês de setembro', NOW()),
(8, 8, 3600.00, '2024-10-01', 'Salário referente ao mês de setembro', NOW()),
(9, 9, 3100.00, '2024-10-01', 'Salário referente ao mês de setembro', NOW()),
(10, 10, 2800.00, '2024-10-01', 'Salário referente ao mês de setembro', NOW());


INSERT INTO pagamentos_funcionarios (id, folha_pagamento_id, funcionario_id, data_pagamento, valor, status, created_at)
VALUES
(1, 1, 1, '2024-10-01', 3000.00, 'pago', NOW()),
(2, 2, 2, '2024-10-01', 3200.00, 'pago', NOW()),
(3, 3, 3, '2024-10-01', 2800.00, 'pago', NOW()),
(4, 4, 4, '2024-10-01', 3500.00, 'pago', NOW()),
(5, 5, 5, '2024-10-01', 4000.00, 'pago', NOW()),
(6, 6, 6, '2024-10-01', 2500.00, 'pago', NOW()),
(7, 7, 7, '2024-10-01', 3300.00, 'pago', NOW()),
(8, 8, 8, '2024-10-01', 3600.00, 'pago', NOW()),
(9, 9, 9, '2024-10-01', 3100.00, 'pago', NOW()),
(10, 10, 10, '2024-10-01', 2800.00, 'pago', NOW());


INSERT INTO pagamentos_fornecedores (id, fornecedor_id, valor, data_pagamento, descricao, status, created_at)
VALUES
(1, 1, 1500.00, '2024-11-01', 'Pagamento pela entrega de materiais para o projeto X', 'Pago', NOW()),
(2, 2, 2500.00, '2024-11-05', 'Pagamento pela entrega de cimento e tijolos para o projeto Y', 'Pago', NOW()),
(3, 3, 3200.00, '2024-11-10', 'Pagamento pelo fornecimento de equipamentos para o projeto Z', 'Pendente', NOW()),
(4, 4, 4500.00, '2024-11-12', 'Pagamento pela entrega de materiais para o projeto A', 'Pago', NOW()),
(5, 5, 1200.00, '2024-11-15', 'Pagamento pelo fornecimento de madeira e ferragens para o projeto B', 'Pendente', NOW()),
(6, 6, 2300.00, '2024-11-18', 'Pagamento pela entrega de materiais de acabamento para o projeto C', 'Pago', NOW()),
(7, 7, 1500.00, '2024-11-20', 'Pagamento pelo fornecimento de materiais para o projeto D', 'Pago', NOW()),
(8, 8, 2800.00, '2024-11-22', 'Pagamento pela entrega de aço para o projeto E', 'Pendente', NOW()),
(9, 9, 3500.00, '2024-11-25', 'Pagamento pelo fornecimento de equipamentos para o projeto F', 'Pago', NOW()),
(10, 10, 2000.00, '2024-11-28', 'Pagamento pelo fornecimento de materiais diversos para o projeto G', 'Pendente', NOW());


INSERT INTO despesas_gerais (id, projeto_id, descricao, valor, tipo_despesa_id, data_despesa, created_at)
VALUES
(1, 1, 'Taxa administrativa do projeto X', 500.00, 1, '2024-11-01', NOW()),
(2, 2, 'Custo com licenças de software para o projeto Y', 1200.00, 2, '2024-11-03', NOW()),
(3, 3, 'Despesas operacionais do projeto Z', 1500.00, 3, '2024-11-05', NOW()),
(4, 4, 'Taxas legais e jurídicas para o projeto A', 800.00, 1, '2024-11-07', NOW()),
(5, 5, 'Custo com materiais extras para o projeto B', 2000.00, 2, '2024-11-10', NOW()),
(6, 6, 'Serviços de consultoria para o projeto C', 3000.00, 3, '2024-11-12', NOW()),
(7, 7, 'Despesas com transporte de materiais para o projeto D', 650.00, 2, '2024-11-15', NOW()),
(8, 8, 'Aluguel de equipamentos para o projeto E', 1200.00, 3, '2024-11-18', NOW()),
(9, 9, 'Custos com alimentação para a equipe do projeto F', 500.00, 1, '2024-11-20', NOW()),
(10, 10, 'Despesas com fornecedores para o projeto G', 1800.00, 2, '2024-11-22', NOW());


INSERT INTO despesas_materiais (id, projeto_id, material_id, quantidade, valor_total, created_at)
VALUES
(1, 1, 1, 50, 1000.00, NOW()),
(2, 1, 2, 30, 600.00, NOW()),
(3, 2, 3, 100, 1500.00, NOW()),
(4, 2, 4, 200, 2000.00, NOW()),
(5, 3, 5, 150, 1200.00, NOW()),
(6, 3, 6, 80, 800.00, NOW()),
(7, 4, 7, 20, 400.00, NOW()),
(8, 4, 8, 10, 250.00, NOW()),
(9, 5, 9, 60, 1200.00, NOW()),
(10, 5, 10, 120, 2400.00, NOW());


INSERT INTO relatorios_progresso (id, projeto_id, descricao, data_relatorio, status, created_at)
VALUES
(1, 1, 'Relatório de progresso inicial do projeto X.', '2024-01-15', 'Em andamento', NOW()),
(2, 1, 'Relatório de progresso detalhado para o mês de fevereiro.', '2024-02-15', 'Em andamento', NOW()),
(3, 2, 'Relatório de progresso finalizado para o mês de janeiro.', '2024-01-20', 'Finalizado', NOW()),
(4, 2, 'Relatório de progresso do projeto Y com atrasos.', '2024-02-10', 'Atrasado', NOW()),
(5, 3, 'Relatório de progresso do projeto Z, início das atividades.', '2024-03-01', 'Em andamento', NOW()),
(6, 4, 'Relatório de progresso detalhado para o mês de março.', '2024-03-10', 'Em andamento', NOW()),
(7, 5, 'Relatório de progresso do projeto W, finalizado após revisão.', '2024-01-30', 'Finalizado', NOW()),
(8, 6, 'Relatório de progresso com análise de riscos e mitigação.', '2024-02-25', 'Em andamento', NOW()),
(9, 7, 'Relatório de progresso com foco na execução do projeto.', '2024-03-15', 'Em andamento', NOW()),
(10, 8, 'Relatório de progresso de planejamento e execução do projeto.', '2024-03-05', 'Finalizado', NOW());


INSERT INTO relatorios_gastos (id, projeto_id, descricao, valor_total, data_relatorio, created_at)
VALUES
(1, 1, 'Relatório de gastos referente à compra de materiais e contratação de serviços.', 12000.50, '2024-01-15', NOW()),
(2, 1, 'Relatório de gastos do mês de fevereiro, revisão de orçamento e despesas.', 15500.75, '2024-02-15', NOW()),
(3, 2, 'Relatório de gastos do projeto Y, custos com fornecedores e serviços.', 9500.00, '2024-01-20', NOW()),
(4, 2, 'Relatório de gastos com atraso no pagamento de fornecedores e aumento de custos.', 10000.25, '2024-02-10', NOW()),
(5, 3, 'Relatório de gastos iniciais do projeto Z, custos com equipe e materiais.', 6000.00, '2024-03-01', NOW()),
(6, 4, 'Relatório de gastos do mês de março, custos adicionais e ajustes no orçamento.', 13000.00, '2024-03-10', NOW()),
(7, 5, 'Relatório de gastos finais do projeto W, verificação de fechamento de contas.', 18000.00, '2024-01-30', NOW()),
(8, 6, 'Relatório de gastos do projeto X com recursos imprevistos.', 11000.00, '2024-02-25', NOW()),
(9, 7, 'Relatório de gastos de execução do projeto, custos com alocação de pessoal e materiais.', 14000.50, '2024-03-15', NOW()),
(10, 8, 'Relatório de gastos com despesas de planejamento, análise e revisão de custos.', 8000.00, '2024-03-05', NOW());



INSERT INTO engenheiros (id, funcionario_id, numero_crea, especializacao, created_at)
VALUES
(1, 1, '123456789', 'Engenharia Civil', NOW()),
(2, 2, '234567890', 'Engenharia Estrutural', NOW()),
(3, 3, '345678901', 'Engenharia Elétrica', NOW()),
(4, 4, '456789012', 'Engenharia Mecânica', NOW()),
(5, 5, '567890123', 'Engenharia de Segurança', NOW()),
(6, 6, '678901234', 'Engenharia Ambiental', NOW()),
(7, 7, '789012345', 'Engenharia Hidráulica', NOW()),
(8, 8, '890123456', 'Engenharia de Transportes', NOW()),
(9, 9, '901234567', 'Engenharia Civil', NOW()),
(10, 10, '012345678', 'Engenharia de Computação', NOW());




INSERT INTO pedreiros (id, funcionario_id, experiencia, created_at)
VALUES
(1, 1, '5 anos de experiência em obras de alvenaria e fundações', NOW()),
(2, 2, '7 anos de experiência em construção de muros e estrutura de concreto', NOW()),
(3, 3, '10 anos de experiência em obras de acabamento e revestimentos', NOW()),
(4, 4, '6 anos de experiência em obras de alvenaria e instalações elétricas', NOW()),
(5, 5, '8 anos de experiência em reformas e construções residenciais', NOW()),
(6, 6, '12 anos de experiência em grandes obras de infraestrutura', NOW()),
(7, 7, '9 anos de experiência em construções comerciais e industriais', NOW()),
(8, 8, '4 anos de experiência em obras de alvenaria e escavação', NOW()),
(9, 9, '15 anos de experiência em obras de grande porte e fundações profundas', NOW()),
(10, 10, '3 anos de experiência em obras de pequena escala e acabamentos', NOW());



INSERT INTO arquitetos (id, funcionario_id, portifolio_url, especializacao, created_at)
VALUES
(1, 1, 'http://portifolio.arquitetojose.com', 'Arquitetura Residencial', NOW()),
(2, 2, 'http://portifolio.arquitetalucia.com', 'Arquitetura Comercial', NOW()),
(3, 3, 'http://portifolio.arquitetomario.com', 'Urbanismo', NOW()),
(4, 4, 'http://portifolio.arquitetoana.com', 'Arquitetura Corporativa', NOW()),
(5, 5, 'http://portifolio.arquitetoandre.com', 'Arquitetura de Interiores', NOW()),
(6, 6, 'http://portifolio.arquitetosofia.com', 'Paisagismo e Arquitetura', NOW()),
(7, 7, 'http://portifolio.arquitetogustavo.com', 'Arquitetura de Restaurantes', NOW()),
(8, 8, 'http://portifolio.arquitetobarbara.com', 'Arquitetura Sustentável', NOW()),
(9, 9, 'http://portifolio.arquitetojulia.com', 'Arquitetura de Lojas e Vitrines', NOW()),
(10, 10, 'http://portifolio.arquitetotomas.com', 'Arquitetura de Eventos e Exposições', NOW());



INSERT INTO outros_funcionarios (id, funcionario_id, especialidade, created_at)
VALUES
(1, 1, 'Assistente Administrativo', NOW()),
(2, 2, 'Gerente de Projetos', NOW()),
(3, 3, 'Técnico de Segurança do Trabalho', NOW()),
(4, 4, 'Coordenador de Logística', NOW()),
(5, 5, 'Supervisor de Obras', NOW()),
(6, 6, 'Analista de Custos', NOW()),
(7, 7, 'Consultor de Sustentabilidade', NOW()),
(8, 8, 'Designer Gráfico', NOW()),
(9, 9, 'Consultor Jurídico', NOW()),
(10, 10, 'Especialista em TI', NOW());


INSERT INTO previsoes_orcamentarias (id, projeto_id, descricao, valor_previsto, created_at)
VALUES
(1, 1, 'Previsão orçamentária para o projeto X, incluindo materiais e serviços.', 50000.00, NOW()),
(2, 1, 'Ajuste na previsão orçamentária para o projeto X, com aumento de custo.', 52000.00, NOW()),
(3, 2, 'Previsão orçamentária para o projeto Y, custos iniciais e equipe.', 30000.00, NOW()),
(4, 2, 'Revisão da previsão orçamentária do projeto Y com novos custos previstos.', 32000.00, NOW()),
(5, 3, 'Previsão orçamentária do projeto Z, custos com materiais e contratação de serviços.', 60000.00, NOW()),
(6, 4, 'Previsão orçamentária de custos adicionais para o projeto W.', 15000.00, NOW()),
(7, 5, 'Previsão orçamentária para o projeto X, revisão e ajustes no valor.', 48000.00, NOW()),
(8, 6, 'Previsão orçamentária para o projeto W com base em estimativas mais conservadoras.', 14000.00, NOW()),
(9, 7, 'Previsão orçamentária do projeto Z para os próximos três meses.', 55000.00, NOW()),
(10, 8, 'Previsão orçamentária final do projeto Y, após análise de fornecedores.', 35000.00, NOW());

INSERT INTO relatorios_despesas_materiais (id, projeto_id, material_id, valor_total, data_relatorio, created_at)
VALUES
(1, 1, 1, 10000.50, '2024-01-10', NOW()),
(2, 1, 2, 2000.75, '2024-01-15', NOW()),
(3, 2, 3, 1500.00, '2024-02-01', NOW()),
(4, 2, 4, 3000.25, '2024-02-05', NOW()),
(5, 3, 5, 8000.00, '2024-03-10', NOW()),
(6, 4, 6, 5000.00, '2024-03-15', NOW()),
(7, 5, 7, 12000.00, '2024-03-20', NOW()),
(8, 6, 8, 4000.50, '2024-03-25', NOW()),
(9, 7, 9, 9500.75, '2024-04-01', NOW()),
(10, 8, 10, 6500.00, '2024-04-05', NOW());


INSERT INTO relatorios_despesas_funcionarios (id, projeto_id, funcionario_id, valor_total, data_relatorio, created_at)
VALUES
(1, 1, 1, 3000.50, '2024-01-10', NOW()),
(2, 1, 2, 4000.00, '2024-01-15', NOW()),
(3, 2, 3, 2500.75, '2024-02-01', NOW()),
(4, 2, 4, 3500.00, '2024-02-05', NOW()),
(5, 3, 5, 2200.00, '2024-03-10', NOW()),
(6, 4, 6, 1700.25, '2024-03-15', NOW()),
(7, 5, 7, 1500.00, '2024-03-20', NOW()),
(8, 6, 8, 2900.50, '2024-03-25', NOW()),
(9, 7, 9, 3200.00, '2024-04-01', NOW()),
(10, 8, 10, 2100.75, '2024-04-05', NOW());

