WITH ventas_base AS (
    SELECT
        ID_VENTA,
        ID_CLIENTE,
        FECHA_VENTA,
        TOTAL,
        ESTADO
    FROM {{ ref('ventas_base') }} 
)

SELECT
    v.ID_CLIENTE,
    c.NOMBRE AS NOMBRE_CLIENTE,
    COUNT(v.ID_VENTA) AS NUMERO_COMPRAS
FROM ventas_base v
JOIN {{ ref('clientes_base') }} c
    ON v.ID_CLIENTE = c.ID_CLIENTE
WHERE v.ESTADO = 'COMPLETADA'
GROUP BY v.ID_CLIENTE, c.NOMBRE
ORDER BY NUMERO_COMPRAS DESC
LIMIT 10