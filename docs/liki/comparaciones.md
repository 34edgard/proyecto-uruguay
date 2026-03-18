esta es una comparación entre liki y laravel 12 
liki es un framenword php minimalistas que pesa 1.13mb tambien hay que destacar que 
en las pruevas solo se cargaron la pagina de inicio de cada framenword liki cargo solo su pagina de login
y laravel su pagina de bienvenida 

🚀 Estresando laravel en http://localhost:8000...            Peticiones: 100 | Concurrencia: 10
----------------------------------------------------------
✅ Total peticiones: 100
⚡ Promedio:         3.1675 seg
🚀 Más rápida:       0.3814 seg
🐢 Más lenta:        3.6345 seg
----------------------------------------------------------
Esos son los resultados de laravel en el servidor de php -S




🚀 Estresando a Liki en http://localhost:8080...
Peticiones: 100 | Concurrencia: 10
----------------------------------------------------------
✅ Total peticiones: 100
⚡ Promedio:         0.0779 seg
🚀 Más rápida:       0.0359 seg
🐢 Más lenta:        0.1198 seg
----------------------------------------------------------
Esos son los resultados de liki en el servidor de php -S con la misma concurrencia que laravel 


🚀 Estresando a Laravel en http://localhost:8000...
Peticiones: 100 | Concurrencia: 100
----------------------------------------------------------
✅ Total peticiones: 100
⚡ Promedio:         19.7671 seg
🚀 Más rápida:       1.6183 seg
🐢 Más lenta:        38.2101 seg
----------------------------------------------------------
Esos son los resultados de laravel en el servidor de php -S con 100c
❯ sh test
🚀 Estresando a Liki en http://localhost:8080...
Peticiones: 100 | Concurrencia: 100
----------------------------------------------------------
✅ Total peticiones: 100
⚡ Promedio:         0.5469 seg
🚀 Más rápida:       0.0872 seg
🐢 Más lenta:        0.6421 seg
----------------------------------------------------------
Estos son los resultados de liki en el servidor de php -S con 100c


🚀 Estresando a Laravel en http://localhost:8000...
Peticiones: 1000 | Concurrencia: 1000
----------------------------------------------------------
✅ Total peticiones: 1000
⚡ Promedio:         116.1347 seg
🚀 Más rápida:       6.0537 seg
🐢 Más lenta:        147.5302 seg
----------------------------------------------------------
Esos son los resultados de laravel con mil de concurrencia 


🚀 Estresando a Liki en http://localhost:8080...
Peticiones: 1000 | Concurrencia: 1000
----------------------------------------------------------
✅ Total peticiones: 1000
⚡ Promedio:         6.9862 seg
🚀 Más rápida:       0.1075 seg
🐢 Más lenta:        19.6675 seg
----------------------------------------------------------
Esos son los resultados de liki





comparacion con express aqui se uso Express 4 

 🚀 Estresando Expresses i en http://localhost:9960...
Peticiones: 100 | Concurrencia: 10
----------------------------------------------------------
✅ Total peticiones: 100
⚡ Promedio:         0.1444 seg
🚀 Más rápida:       0.0624 seg
🐢 Más lenta:        0.2567 seg
----------------------------------------------------------
  🚀 Estresando a express en http://localhost:9960...
Peticiones: 100 | Concurrencia: 100
----------------------------------------------------------
✅ Total peticiones: 100
⚡ Promedio:         1.7508 seg
🚀 Más rápida:       1.2132 seg
🐢 Más lenta:        2.0242 seg
----------------------------------------------------------
: 🚀 Estresando a express en http://localhost:9960...
Peticiones: 1000 | Concurrencia: 100
----------------------------------------------------------
✅ Total peticiones: 1000
⚡ Promedio:         1.5900 seg
🚀 Más rápida:       0.4265 seg
🐢 Más lenta:        2.1004 seg
----------------------------------------------------------
 : 🚀 Estresando a express en http://localhost:9960...
Peticiones: 1000 | Concurrencia: 1000
----------------------------------------------------------
✅ Total peticiones: 1000
⚡ Promedio:         3.6888 seg
🚀 Más rápida:       0.0023 seg
🐢 Más lenta:        9.6043 seg
----------------------------------------------------------


## Liki en Apache (página de login base)

Se realizaron pruebas de rendimiento usando Apache Benchmark (ab) contra Liki corriendo en Apache con mod_php.
La página testeada fue la página de login base (sin consultas a base de datos).

### Primera ronda

🚀 Estresando a Liki en Apache...
Peticiones: 100 | Concurrencia: 10
----------------------------------------------------------
✅ Total peticiones: 100
⚡ Promedio:         0.0398 seg
🚀 Más rápida:       0.0014 seg
🐢 Más lenta:        0.1840 seg
----------------------------------------------------------

🚀 Estresando a Liki en Apache...
Peticiones: 100 | Concurrencia: 100
----------------------------------------------------------
✅ Total peticiones: 100
⚡ Promedio:         0.0036 seg
🚀 Más rápida:       0.0013 seg
🐢 Más lenta:        0.0104 seg
----------------------------------------------------------

🚀 Estresando a Liki en Apache...
Peticiones: 1000 | Concurrencia: 100
----------------------------------------------------------
✅ Total peticiones: 1000
⚡ Promedio:         0.0034 seg
🚀 Más rápida:       0.0011 seg
🐢 Más lenta:        0.0173 seg
----------------------------------------------------------

🚀 Estresando a Liki en Apache...
Peticiones: 1000 | Concurrencia: 1000
----------------------------------------------------------
✅ Total peticiones: 1000
⚡ Promedio:         0.0035 seg
🚀 Más rápida:       0.0012 seg
🐢 Más lenta:        0.0169 seg
----------------------------------------------------------

### Segunda ronda (prueba de consistencia)

Se repitieron las pruebas para verificar consistencia en los resultados.

🚀 Estresando a Liki en Apache...
Peticiones: 100 | Concurrencia: 100 (ejecución 1)
----------------------------------------------------------
✅ Total peticiones: 100
⚡ Promedio:         0.0037 seg
----------------------------------------------------------

🚀 Estresando a Liki en Apache...
Peticiones: 100 | Concurrencia: 100 (ejecución 2)
----------------------------------------------------------
✅ Total peticiones: 100
⚡ Promedio:         0.0032 seg
----------------------------------------------------------

🚀 Estresando a Liki en Apache...
Peticiones: 100 | Concurrencia: 100 (ejecución 3)
----------------------------------------------------------
✅ Total peticiones: 100
⚡ Promedio:         0.0033 seg
----------------------------------------------------------

🚀 Estresando a Liki en Apache...
Peticiones: 1000 | Concurrencia: 100
----------------------------------------------------------
✅ Total peticiones: 1000
⚡ Promedio:         0.0034 seg
🚀 Más rápida:       0.0012 seg
🐢 Más lenta:        0.0308 seg
----------------------------------------------------------

🚀 Estresando a Liki en Apache...
Peticiones: 1000 | Concurrencia: 1000
----------------------------------------------------------
✅ Total peticiones: 1000
⚡ Promedio:         0.0033 seg
🚀 Más rápida:       0.0009 seg
🐢 Más lenta:        0.0164 seg
----------------------------------------------------------

🚀 Estresando a Liki en Apache...
Peticiones: 5000 | Concurrencia: 1000
----------------------------------------------------------
✅ Total peticiones: 5000
⚡ Promedio:         0.0035 seg
🚀 Más rápida:       0.0010 seg
🐢 Más lenta:        0.0275 seg
----------------------------------------------------------

### Prueba final

🚀 Estresando a Liki en Apache...
Peticiones: 10000 | Concurrencia: 1000
----------------------------------------------------------
✅ Total peticiones: 10000
⚡ Promedio:         0.0038 seg
🚀 Más rápida:       0.0010 seg
🐢 Más lenta:        0.0735 seg
----------------------------------------------------------


## Tabla comparativa de frameworks

| Framework | Servidor | 100 req 10c | 100 req 100c | 1000 req 1000c |
|---|---|---|---|---|
| Liki | php -S | 0.0779s | 0.5469s | 6.9862s |
| Liki | Apache | 0.0398s | 0.0036s | 0.0033s |
| Laravel 12 | php -S | 3.1675s | 19.7671s | -- |
| Express 4 | Node.js | 0.1444s | 1.7508s | 3.6888s |

### Notas

1. **Apache usa un modelo multi-proceso (MPM)** que maneja la concurrencia de forma nativa, a diferencia de `php -S` que es single-threaded. Esto explica la enorme diferencia de rendimiento entre Liki en `php -S` y Liki en Apache, especialmente bajo alta concurrencia.

2. **La página testeada fue la página de login base** (sin consultas a base de datos), lo cual mide el rendimiento puro del framework y el servidor.

3. **El tiempo promedio de respuesta se mantiene plano (~0.003-0.004s)** desde 100 hasta 10,000 peticiones en Apache, demostrando excelente escalabilidad y estabilidad bajo carga.
