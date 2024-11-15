DELIMITER $$

CREATE TRIGGER atualizar_status_tarefa_concluida
AFTER UPDATE ON alocacao_funcionarios
FOR EACH ROW
BEGIN

    DECLARE qtd_funcionarios INT;
    DECLARE qtd_funcionarios_concluidos INT;
    DECLARE projeto_id INT;

    SET projeto_id = NEW.projeto_id;

    SELECT COUNT(*) INTO qtd_funcionarios
    FROM relatorios_funcionarios rf
    WHERE rf.relatorio_id = projeto_id;

    SELECT COUNT(*) INTO qtd_funcionarios_concluidos
    FROM alocacao_funcionarios af
    JOIN relatorios_funcionarios rf ON rf.funcionario_id = af.funcionario_id
    WHERE rf.relatorio_id = projeto_id
      AND af.status = 'Concluído';

    IF qtd_funcionarios = qtd_funcionarios_concluidos THEN
        UPDATE relatorios_progresso
        SET status = 'Concluído'
        WHERE id = projeto_id;
    END IF;
END $$

DELIMITER ;




-- trigger adicional

DELIMITER $$

CREATE TRIGGER  atualizar_status_projeto_quando_todos_relatorios_concluidos
AFTER UPDATE ON relatorios_progresso
FOR EACH ROW
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM relatorios_progresso
        WHERE projeto_id = NEW.projeto_id
        AND status != 'Concluído'
    ) THEN
        UPDATE projetos
        SET status = 'Concluído'
        WHERE id = NEW.projeto_id;
    END IF;
END $$

DELIMITER ;
