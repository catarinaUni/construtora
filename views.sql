CREATE VIEW visao_status_tarefas AS
SELECT 
    rp.projeto_id,
    rp.descricao AS tarefa_descricao,
    rp.status AS tarefa_status,
    rp.data_relatorio AS tarefa_data_relatorio
FROM 
    relatorios_progresso rp;




SELECT * FROM visao_status_tarefas LIMIT 10;








CREATE VIEW visao_comparativo_status_tarefas AS
SELECT 
    rp.projeto_id,
    COUNT(*) AS total_tarefas,
    SUM(CASE WHEN rp.status = 'Concluída' THEN 1 ELSE 0 END) AS tarefas_concluidas,
    CONCAT(
        SUM(CASE WHEN rp.status = 'Concluída' THEN 1 ELSE 0 END), 
        ' de ', 
        COUNT(*)
    ) AS comparativo_tarefas
FROM 
    relatorios_progresso rp
GROUP BY 
    rp.projeto_id;



SELECT * FROM visao_comparativo_status_tarefas LIMIT 10;
