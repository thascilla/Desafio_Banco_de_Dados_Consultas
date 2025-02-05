SELECT 
    CD_CLIENTE,
	SUM(CASE 
	         WHEN CD_TRANSACAO = '110' THEN VR_TRANSACAO
	         WHEN CD_TRANSACAO = '120' THEN -VR_TRANSACAO
	         ELSE 0 
		END) AS saldo_cliente
	
FROM
   TbTransacoes

GROUP BY
    CD_CLIENTE
	
ORDER BY
   saldo_cliente DESC;