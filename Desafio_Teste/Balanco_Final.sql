SELECT 
    CD_CLIENTE,
    SUM(CASE 
            WHEN CD_TRANSACAO IN ('110', '000') THEN VR_TRANSACAO 
            WHEN CD_TRANSACAO = '220' THEN -VR_TRANSACAO         
            ELSE 0 
        END) AS saldo_final_2021
FROM 
    TbTransacoes
WHERE 
    DT_TRANSACAO <= '2021-12-31' 
GROUP BY 
    CD_CLIENTE
ORDER BY 
    saldo_final_2021 DESC;
