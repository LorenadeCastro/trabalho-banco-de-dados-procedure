DELIMITER //

CREATE PROCEDURE GenerateDailySalesReport()
BEGIN
    DECLARE report_date DATE;
    
    -- Define a data para o relatório (o dia anterior)
    SET report_date = CURDATE() - INTERVAL 1 DAY;
    
    -- Limpa os dados do relatório para a data especificada
    DELETE FROM daily_sales_report WHERE report_date = report_date;

    -- Insere os dados de vendas diárias na tabela de relatório
    INSERT INTO daily_sales_report (report_date, product_id, quantity_sold)
    SELECT 
        sale_date AS report_date,
        product_id,
        SUM(quantity) AS quantity_sold
    FROM 
        sales
    WHERE 
        sale_date = report_date
    GROUP BY 
        sale_date, product_id;
END //

DELIMITER;

-- Para executar a stored procedure, você pode simplesmente chamar:
CALL GenerateDailySalesReport();

-- Para garantir que a stored procedure seja executada diariamente, você pode configurar um evento no MySQL (se o seu MySQL Server suportar eventos):

DELIMITER //

CREATE EVENT DailySalesReportEvent
ON SCHEDULE EVERY 1 DAY
STARTS '2024-05-30 00:00:00'
DO
    CALL GenerateDailySalesReport();

DELIMITER ;


