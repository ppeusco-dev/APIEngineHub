# APIEngineHub

**APIEngineHub** es un proyecto modular y monolítico basado en Ruby on Rails, que se compone de múltiples engines diseñados para proporcionar diferentes funcionalidades a través de APIs. Este repositorio centraliza la gestión de estos engines y define las bases arquitectónicas para su integración y funcionamiento.

## Componentes del Proyecto

El proyecto **APIEngineHub** está compuesto por los siguientes engines:

### 1. **CurrencyConverterEngine**
   - **Descripción**: Proporciona una API para la conversión de divisas entre diferentes monedas. Utiliza un servicio externo para obtener los tipos de cambio y realizar cálculos de conversión.
   - **Componentes Clave**:
     - **ConversionService**: Un service object que maneja la lógica de conversión de divisas, interactuando con la API externa para obtener los tipos de cambio y realizando las conversiones necesarias.
     - **QueryParamsBuilder**: Un service object que construye y valida los parámetros de la consulta que se envía a la API externa.
     - **ConversionController**: Un controller que expone la API para convertir divisas. Maneja las solicitudes, valida parámetros y retorna las conversiones o errores según corresponda.

### 2. **WeatherEngine** *(ejemplo, si este es uno de los engines)*
   - **Descripción**: Proporciona una API para consultar el clima en diferentes ubicaciones. Consume un servicio externo de datos meteorológicos.
   - **Componentes Clave**:
     - **WeatherService**: Un service object que obtiene datos meteorológicos y los procesa para ser utilizados en las respuestas de la API.
     - **WeatherController**: Un controller que expone la API para consultar el clima en diversas ubicaciones.

### 3. **NewsFeedEngine** *(ejemplo, si este es uno de los engines)*
   - **Descripción**: Proporciona una API para obtener las últimas noticias de diversas fuentes. Interactúa con un servicio externo de noticias.
   - **Componentes Clave**:
     - **NewsService**: Un service object que maneja la obtención y procesamiento de noticias desde una API externa.
     - **NewsController**: Un controller que expone la API para consultar las noticias.

## Decisiones de Arquitectura

### 1. **Modularidad y Monolitismo**
   - Hemos decidido estructurar el proyecto como un monolito modular, donde cada funcionalidad principal se encapsula dentro de un engine independiente. Esto permite un desarrollo paralelo y desacoplado, facilitando la reutilización de componentes en diferentes aplicaciones.

### 2. **Uso de Service Objects**
   - Todos los engines utilizan service objects para encapsular la lógica de negocio y las interacciones con servicios externos. Esto proporciona una clara separación de responsabilidades y hace que el código sea más fácil de probar y mantener.

### 3. **Gema Compartida de Servicios**
   - Para evitar la duplicación de código, hemos creado una gema compartida llamada `shared_services`. Esta gema incluye funcionalidad común, como la gestión de respuestas estandarizadas (`success_response`, `failure_response`) y la construcción de parámetros para servicios externos.

### 4. **Integración de HTTPX para Soporte de HTTP/2 y HTTP/3**
   - Hemos integrado `httpx` como el adaptador HTTP para manejar las solicitudes a servicios externos. Esto permite aprovechar HTTP/2 y HTTP/3, mejorando el rendimiento y la eficiencia en las conexiones.

### 5. **Validación de Parámetros y Manejo de Errores**
   - Se ha implementado un sistema de validación de parámetros en los controllers utilizando métodos privados, que asegura que todas las solicitudes a las APIs estén correctamente formateadas antes de ser procesadas. Esto reduce la posibilidad de errores y asegura que las respuestas sean consistentes.

### 6. **Levantamiento de las Aplicaciones**

## Para probar el proyecto completo, es necesario levantar tres aplicaciones Rails:

1. **Aplicación `rails7_app`**:
   - Esta es la aplicación principal que monta los engines. Debe levantarse en el puerto 3000.

   ```
   cd rails7_app
   rails server -p 3000
    ```
Aplicaciones de Prueba de Servicios:

Hay dos aplicaciones adicionales utilizadas para probar los servicios que exponen los engines:

rails5_app: Debe levantarse en el puerto 3001.
rails6_app: Debe levantarse en el puerto 3002.

# Para `rails5_app`:
  ```
cd path/to/rails5_app
rails server -p 3001
  ```

# Para `rails6_app`:
  ```
cd path/to/rails6_app
rails server -p 3002
  ```
### 7. **Configuración de Variables de Entorno**
Cada engine requiere variables de entorno específicas para interactuar con las APIs externas. Asegúrate de configurar las siguientes variables en cada aplicación:

Currency Converter Engine (rails7_app):
CURRENCY_API_KEY=63651034ef6b351342a9c05871767c96
News Feed Engine (rails7_app):
NEWS_API_KEY=44f3459aac8b4053be029462a2e0742b
Weather Engine (rails7_app):
WEATHER_API_KEY=69d8d2a82ad6508eb70879b4693eb3d3
Estas variables deben configurarse en un archivo .env en la raíz de rails7_app o en las configuraciones del entorno del sistema operativo donde se ejecuta la aplicación.

### 8. **Probando las APIs desde rails5_app y rails6_app**
**Probando Currency Converter API**
URL:
  ```
GET http://localhost:3001/currency_converter/api/v1/convert?from_currency=USD&to_currency=EUR,GBP&amount=100
  ```
Comando curl:
  ```
curl "http://localhost:3001/currency_converter/api/v1/convert?from_currency=USD&to_currency=EUR,GBP&amount=100"
  ```
**Probando Weather API**
URL:
  ```
GET http://localhost:3002/weather/api/v1/current?city=London
  ```
Comando curl:
  ```
curl "http://localhost:3002/weather/api/v1/current?city=London"
  ```
**Probando News Feed API**
URL:
  ```
GET http://localhost:3002/news_feed/api/v1/latest?category=technology
  ```
Comando curl:
  ```
curl "http://localhost:3002/news_feed/api/v1/latest?category=technology"

  ```