# trabalho-banco-de-dados-procedure
Trabalho desenvolvido para o curso de Introdução a Programação da Proz - cursos técnicos.

Estrutura das tabelas (exemplo):

    products
        product_id (INT, PK)
        product_name (VARCHAR)
        price (DECIMAL)

    sales
        sale_id (INT, PK)
        product_id (INT, FK)
        quantity (INT)
        sale_date (DATE)

Tabela para relatório:

    daily_sales_report
        report_date (DATE)
        product_id (INT, FK)
        quantity_sold (INT)
