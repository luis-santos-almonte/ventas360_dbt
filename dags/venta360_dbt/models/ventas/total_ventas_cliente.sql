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
    EXTRACT(YEAR FROM v.FECHA_VENTA) AS ANIO,
    EXTRACT(MONTH FROM v.FECHA_VENTA) AS MES,
    SUM(v.TOTAL) AS TOTAL_COMPRADO
FROM ventas_base v
JOIN {{ ref('clientes_base') }} c
    ON v.ID_CLIENTE = c.ID_CLIENTE
WHERE v.ESTADO = 'COMPLETADA'
GROUP BY v.ID_CLIENTE, c.NOMBRE, EXTRACT(YEAR FROM v.FECHA_VENTA), EXTRACT(MONTH FROM v.FECHA_VENTA)
ORDER BY ANIO DESC, MES DESC, TOTAL_COMPRADO DESC