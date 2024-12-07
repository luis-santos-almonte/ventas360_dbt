WITH raw_clientes AS (
    SELECT
        ID_CLIENTE,
        NOMBRE,
        CORREO,
        TELEFONO,
        DIRECCION,
        FECHA_REGISTRO,
        ESTADO
    FROM {{ source('raw', 'clientes') }}
)
SELECT * FROM raw_clientes;