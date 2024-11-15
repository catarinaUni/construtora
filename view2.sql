--visualizar projetos que estão em andamento no momento

CREATE VIEW vw_projetos_em_andamento AS
SELECT p.id AS projeto_id,
       p.nome AS projeto_nome,
       p.status AS projeto_status,
       p.data_inicio,
       p.data_fim_prevista,
       c.nome_usuario AS cliente_nome
FROM projetos p
JOIN clientes c ON p.cliente_id = c.id
WHERE p.status != 'concluído';


-- quais materiais no estoque estão abaixo der 1000 unidades e seus respectivos fornecedores para possíveis novos pedidos

CREATE VIEW vw_materiais_estoque_abaixo_1000 AS
SELECT 
    m.id AS material_id,
    m.nome AS material_nome,
    im.quantidade AS quantidade_estoque,
    f.id AS fornecedor_id,
    f.nome AS fornecedor_nome
FROM 
    materiais m
JOIN 
    inventario_materiais im ON m.id = im.material_id
JOIN 
    pedidos_materiais pm ON m.id = pm.material_id
JOIN 
    fornecedores f ON pm.fornecedor_id = f.id
WHERE 
    im.quantidade < 1000;
