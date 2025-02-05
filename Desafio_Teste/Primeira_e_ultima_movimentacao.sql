WITH saldo_cliente AS (
    SELECT 
        CD_CLIENTE,
        SUM(CASE 
                WHEN CD_TRANSACAO IN ('110', '000') THEN VR_TRANSACAO  
                WHEN CD_TRANSACAO = '220' THEN -VR_TRANSACAO          
                ELSE 0 
            END) AS saldo
    FROM 
        TbTransacoes
    GROUP BY 
        CD_CLIENTE
),
clientes_com_saldo_maior_100 AS (
    SELECT 
        CD_CLIENTE
    FROM 
        saldo_cliente
    WHERE 
        saldo > 100  
),
primeira_ultima_transacao AS (
    SELECT 
        t.CD_CLIENTE,
        MIN(t.DT_TRANSACAO) AS primeira_transacao, 
        MAX(t.DT_TRANSACAO) AS ultima_transacao    
    FROM 
        TbTransacoes t
    JOIN 
        clientes_com_saldo_maior_100 c ON t.CD_CLIENTE = c.CD_CLIENTE
    GROUP BY 
        t.CD_CLIENTE
)
SELECT 
    p.CD_CLIENTE, 
    p.primeira_transacao, 
    p.ultima_transacao
FROM 
    primeira_ultima_transacao p
ORDER BY 
    p.CD_CLIENTE;
