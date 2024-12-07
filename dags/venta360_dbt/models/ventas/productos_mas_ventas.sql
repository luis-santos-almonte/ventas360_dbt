WITH ventas_base AS (
    SELECT
        v.id_venta,
        v.id_producto,
        v.cantidad,
        v.precio_unitario,
        v.subtotal
    FROM
        {{ ref('ventas_base') }}
        v
    WHERE
        v.estado = 'COMPLETADA'
)
SELECT
    p.nombre AS nombre_producto,
    SUM(
        v.cantidad
    ) AS cantidad_vendida,
    SUM(
        v.subtotal
    ) AS total_vendido
FROM
    ventas_base v
    JOIN {{ ref('productos_base') }}
    p
    ON v.id_producto = p.id_producto
GROUP BY
    p.nombre
ORDER BY
    cantidad_vendida DESC
LIMIT
    10
