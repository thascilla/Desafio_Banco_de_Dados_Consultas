WITH transacoes_ordenadas AS (
    SELECT 
        CD_CLIENTE,
        DT_TRANSACAO,
        VR_TRANSACAO,
        ROW_NUMBER() OVER (PARTITION BY CD_CLIENTE ORDER BY DT_TRANSACAO DESC) AS rn
    FROM 
        TbTransacoes
),
ultimas_4_transacoes AS (
    SELECT 
        CD_CLIENTE,
        VR_TRANSACAO
    FROM 
        transacoes_ordenadas
    WHERE 
        rn <= 4  
)
SELECT 
    CD_CLIENTE,
    AVG(VR_TRANSACAO) AS ticket_medio_ultimas_4_transacoes
FROM 
    ultimas_4_transacoes
GROUP BY 
    CD_CLIENTE
ORDER BY 
    ticket_medio_ultimas_4_transacoes DESC;
