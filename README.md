# Proyecto de Análisis de Ventas

Este proyecto tiene como objetivo analizar los datos de ventas de una tienda utilizando DBT y Airflow para realizar transformaciones, crear modelos y cargar los resultados en una base de datos.

## Descripción del Proyecto

Este proyecto utiliza **Astro** para la orquestación y despliegue de los modelos SQL. Los datos provienen de un conjunto de tablas que incluyen información sobre clientes, productos, ventas y detalles de ventas. El análisis de estos datos permite generar reportes útiles, como los productos más vendidos y el total de compras de los clientes.

### Modelos en DBT

Los modelos en DBT son los siguientes:

1. **`clientes_base`**: Extrae los datos base de la tabla `clientes` para ser utilizados en transformaciones posteriores.
2. **`productos_base`**: Extrae los datos base de la tabla `productos`, incluyendo información sobre precios, categorías y stock.
3. **`ventas_base`**: Extrae los datos base de las tablas `ventas` y `detalle_ventas`, uniendo las ventas con sus detalles y filtrando las ventas completadas.
4. **`productos_mas_ventas`**: Analiza las ventas y calcula los productos más vendidos, tanto por cantidad como por total vendido.
5. **`clientes_mas_compras`**: Analiza las compras de los clientes y calcula el total gastado por cada uno, ordenado por el total de compras.
6. **`productos_con_categorias`**: Asocia productos con sus categorías para facilitar la clasificación de los productos vendidos.
7. **`clientes_enriquecidos`**: Realiza un enriquecimiento de los datos de los clientes, añadiendo más detalles y segmentaciones.

### Estructura de Carpetas

El proyecto tiene la siguiente estructura:

├───.astro ├───dags │ ├───venta360_dbt │ │ ├───analyses │ │ ├───dbt_packages │ │ │ └───dbt_utils │ │ ├───logs │ │ ├───macros │ │ ├───models │ │ │ ├───clientes │ │ │ ├───productos │ │ │ └───ventas │ │ ├───seeds │ │ ├───snapshots │ │ ├───target │ │ └───tests ├───include ├───logs ├───plugins └───tests └───dags

- **`dags/`**: Contiene todos los archivos relacionados con el procesamiento de datos, incluyendo los modelos DBT y las configuraciones de Airflow.
- **`models/`**: Aquí se encuentran los modelos SQL que definen las transformaciones de datos.
- **`macros/`**: Contiene macros reutilizables que ayudan en la transformación de datos.
- **`seeds/`**: Archivos de datos que pueden ser utilizados para crear tablas o vistas.
- **`snapshots/`**: Archivos que permiten almacenar el estado de los datos a lo largo del tiempo.
- **`target/`**: Contiene los archivos compilados y resultados generados por DBT.
- **`analyses/`**: Análisis adicionales realizados sobre los datos.
- **`logs/`**: Archivos de registro generados durante la ejecución de los procesos.

### Tecnologías Utilizadas

- **DBT**: Herramienta de transformación de datos basada en SQL que permite crear modelos, ejecutar transformaciones y gestionar dependencias entre tablas.
- **Airflow**: Plataforma de orquestación de flujo de trabajo que automatiza y programa las tareas de procesamiento de datos.
- **Snowflake**: Base de datos en la nube utilizada para almacenar y procesar los datos.
- **Docker**: Se utiliza para ejecutar los servicios de Airflow y DBT en contenedores, facilitando su gestión y despliegue.

### Instalación y Configuración

Para instalar y configurar el proyecto en tu entorno local, sigue estos pasos:

1. **Clona el repositorio**:

   ```bash
   git clone https://github.com/luis-santos-almonte/ventas360_dbt.git

   ```

1. **Instalar dependencias**: Asegúrate de tener todas las dependencias necesarias instaladas en tu entorno de desarrollo.
   ```bash
   npm install



1. **Inicia servidor de desarrollo**:
   ```bash
   astro dev start
   ```

### Participantes

**Nombre:** Luis Reynaldo Santos Almonte  
**Matrícula:** 2020-0754
