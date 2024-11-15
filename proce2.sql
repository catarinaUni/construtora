DELIMITER $$

CREATE TRIGGER update_projeto_status_on_all_reports_done
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
