SELECT 
    CD_CLIENTE,
    AVG(VR_TRANSACAO) AS saldo_medio_cashback
FROM 
    TbTransacoes
WHERE 
    CD_TRANSACAO = '000' 
GROUP BY 
    CD_CLIENTE
ORDER BY 
    saldo_medio_cashback DESC;
