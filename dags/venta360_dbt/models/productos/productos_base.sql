WITH raw_productos AS (
    SELECT
        ID_PRODUCTO,
        NOMBRE,
        DESCRIPCION,
        PRECIO,
        STOCK,
        CATEGORIA,
        FECHA_CREACION
    FROM {{ source('raw', 'productos') }}
)
SELECT * FROM raw_productos;
