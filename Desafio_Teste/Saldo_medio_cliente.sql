SELECT 
    CD_CLIENTE,
    AVG(VR_TRANSACAO) AS saldo_medio_novembro
FROM 
    TbTransacoes
WHERE 
    EXTRACT(MONTH FROM DT_TRANSACAO) = 11
GROUP BY 
    CD_CLIENTE
ORDER BY 
    saldo_medio_novembro DESC
LIMIT 1;
