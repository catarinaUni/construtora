DELIMITER $$

CREATE PROCEDURE gerar_relatorio_custo_materiais(projetoId INT)
BEGIN
    DECLARE nomeProjeto VARCHAR(255);

    SELECT nome INTO nomeProjeto FROM projetos WHERE id = projetoId;

    SELECT CONCAT('Relatório de Custo de Materiais para o Projeto: ', nomeProjeto) AS titulo_relatorio;

    SELECT 
        m.nome AS nome_material,
        pm.quantidade AS quantidade_utilizada,
        (dm.valor_total / dm.quantidade) AS valor_unitario,
        dm.valor_total AS valor_total_material
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



-- adicionais


DELIMITER $$

CREATE PROCEDURE gerar_relatorio_conograma_projeto(projetoId INT)
BEGIN
	SELECT p.nome nome_projeto
		 , e.nome
         , e.status status_etapa
         , e.data_inicio
         , e.data_fim
      FROM cronogramas_projetos cp
	  JOIN projetos P
		ON cp.projeto_id = p.id
	  JOIN etapas_projetos e
        ON  cp.etapa_id = e.id
	 WHERE P.id = projetoId
  ORDER BY cp.created_at;
END $$

DESCRIBE cronogramas_projetos;

DELIMITER ;




DELIMITER $$

CREATE PROCEDURE gerar_relatorio_despesas_no_projeto(projetoId INT)
BEGIN
	SELECT p.nome nome_projeto
         , td.nome
         , td.descricao descricao_despesa
         , dg.valor
	  FROM despesas_gerais dg
      JOIN projetos p
        ON dg.projeto_id = p.id
	  JOIN tipos_despesas td
        ON dg.tipo_despesa_id = td.id
	 WHERE p.id = projetoId;
END $$

DESCRIBE cronogramas_projetos;

DELIMITER ;

