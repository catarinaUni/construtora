SELECT
    p.nome AS projeto_nome,
    m.nome AS material_nome,
    SUM(pm.quantidade) AS total_quantidade,
    RANK() OVER (PARTITION BY p.nome ORDER BY SUM(pm.quantidade) DESC) AS ranking_material
FROM
    projetos p
INNER JOIN projetos_materiais pm ON p.id = pm.projeto_id
INNER JOIN materiais m ON pm.material_id = m.id
GROUP BY
    p.nome, m.nome
ORDER BY
    p.nome, ranking_material;
