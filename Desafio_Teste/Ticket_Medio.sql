WITH ultimas_transacoes AS (
    SELECT 
        CD_CLIENTE, 
        VR_TRANSACAO,
        ROW_NUMBER() OVER (PARTITION BY CD_CLIENTE ORDER BY DT_TRANSACAO DESC) AS row_num
    FROM 
        TbTransacoes
)
SELECT 
    CD_CLIENTE,
    AVG(VR_TRANSACAO) AS ticket_medio
FROM 
    ultimas_transacoes
WHERE 
    row_num <= 4  
GROUP BY 
    CD_CLIENTE
ORDER BY 
    ticket_medio DESC;
