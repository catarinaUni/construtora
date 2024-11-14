DELIMITER $$

CREATE PROCEDURE gerar_relatorio_custo_materiais(projetoId INT)
BEGIN
    DECLARE nomeProjeto VARCHAR(255);

    SELECT nome INTO nomeProjeto FROM projetos WHERE id = projetoId;

    SELECT CONCAT('Relatório de Custo de Materiais para o Projeto: ', nomeProjeto) AS titulo_relatorio;

    SELECT 
        m.nome AS nome_material,
        pm.quantidade AS quantidade_utilizada,
        CASE 
            WHEN pm.quantidade > 0 THEN dm.valor_total / pm.quantidade
            ELSE 0
        END AS valor_unitario,
        CASE 
            WHEN pm.quantidade > 0 THEN pm.quantidade * (dm.valor_total / pm.quantidade)
            ELSE 0
        END AS valor_total_material
    FROM 
        despesas_materiais dm
    JOIN 
        materiais m ON dm.material_id = m.id
    JOIN 
        projetos_materiais pm ON dm.material_id = pm.material_id AND dm.projeto_id = pm.projeto_id
    WHERE 
        dm.projeto_id = projetoId;

END $$

DELIMITER ;
