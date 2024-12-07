WITH raw_ventas AS (
    SELECT
        v.id_venta,
        v.id_cliente,
        v.fecha_venta,
        v.total,
        v.estado,
        dv.id_producto,
        dv.cantidad,
        dv.precio_unitario,
        dv.subtotal
    FROM
        {{ source(
            'raw',
            'ventas'
        ) }}
        v
        JOIN {{ source(
            'raw',
            'detalle_ventas'
        ) }}
        dv
        ON v.id_venta = dv.id_venta
)
SELECT
    *
FROM
    raw_ventas
