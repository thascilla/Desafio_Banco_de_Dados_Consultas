WITH ultimas_transacoes AS (
    SELECT 
        CD_CLIENTE, 
        CD_TRANSACAO, 
        DT_TRANSACAO, 
        VR_TRANSACAO,
        ROW_NUMBER() OVER (PARTITION BY CD_CLIENTE, CD_TRANSACAO ORDER BY DT_TRANSACAO DESC) AS row_num
    FROM 
        TbTransacoes
)
SELECT 
    CD_CLIENTE, 
    CD_TRANSACAO,
    DT_TRANSACAO, 
    VR_TRANSACAO
FROM 
    ultimas_transacoes
WHERE 
    row_num = 1
ORDER BY 
    CD_CLIENTE, CD_TRANSACAO;
