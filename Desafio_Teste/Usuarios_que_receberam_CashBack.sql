WITH clientes_cashback AS (
    SELECT 
        CD_CLIENTE,
        MAX(DT_TRANSACAO) AS ultima_transacao_cashback
    FROM 
        TbTransacoes
    WHERE 
        CD_TRANSACAO = '000'  
    GROUP BY 
        CD_CLIENTE
),
clientes_com_interacao AS (
    SELECT 
        t.CD_CLIENTE
    FROM 
        TbTransacoes t
    JOIN 
        clientes_cashback c ON t.CD_CLIENTE = c.CD_CLIENTE
    WHERE 
        t.DT_TRANSACAO > c.ultima_transacao_cashback  
)
SELECT 
    COUNT(DISTINCT CD_CLIENTE) AS qtd_usuarios_com_interacao
FROM 
    clientes_com_interacao;
