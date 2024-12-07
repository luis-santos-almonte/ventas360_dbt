WITH raw_ventas AS (
    SELECT
        v.ID_VENTA,
        v.ID_CLIENTE,
        v.FECHA_VENTA,
        v.TOTAL,
        v.ESTADO,
        dv.ID_PRODUCTO,
        dv.CANTIDAD,
        dv.PRECIO_UNITARIO,
        dv.SUBTOTAL
    FROM {{ source('raw', 'ventas') }} v
    JOIN {{ source('raw', 'detalle_ventas') }} dv
        ON v.ID_VENTA = dv.ID_VENTA
)
SELECT * FROM raw_ventas;
