WITH transacoes_ordenadas AS (
    SELECT 
        CD_CLIENTE,
        DT_TRANSACAO,
        CD_TRANSACAO,
        VR_TRANSACAO,
        ROW_NUMBER() OVER (PARTITION BY CD_CLIENTE ORDER BY DT_TRANSACAO DESC) AS rn
    FROM 
        TbTransacoes
),
ultimas_4_transacoes AS (
    SELECT 
        CD_CLIENTE,
        DT_TRANSACAO,
        CD_TRANSACAO,
        VR_TRANSACAO
    FROM 
        transacoes_ordenadas
    WHERE 
        rn <= 4  
)
SELECT 
    CD_CLIENTE,
    SUM(CASE 
            WHEN CD_TRANSACAO IN ('110', '000') THEN VR_TRANSACAO  
            WHEN CD_TRANSACAO = '220' THEN -VR_TRANSACAO          
            ELSE 0 
        END) AS saldo_ultimas_4_transacoes
FROM 
    ultimas_4_transacoes
GROUP BY 
    CD_CLIENTE
ORDER BY 
    saldo_ultimas_4_transacoes DESC;
