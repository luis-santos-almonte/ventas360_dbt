WITH raw_clientes AS (
    SELECT
        id_cliente,
        nombre,
        correo,
        telefono,
        direccion,
        fecha_registro,
        estado
    FROM
        {{ source(
            'raw',
            'clientes'
        ) }}
)
SELECT
    *
FROM
    raw_clientes
