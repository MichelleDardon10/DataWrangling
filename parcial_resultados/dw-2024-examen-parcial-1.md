dw-2024-parcial-1
================
Tepi
25/09/2024

# Examen parcial by Michelle:)

Indicaciones generales:

- Usted tiene el período de la clase para resolver el examen parcial.

- La entrega del parcial, al igual que las tareas, es por medio de su
  cuenta de github, pegando el link en el portal de MiU.

- Pueden hacer uso del material del curso e internet (stackoverflow,
  etc.). Sin embargo, si encontramos algún indicio de copia, se anulará
  el exámen para los estudiantes involucrados. Por lo tanto, aconsejamos
  no compartir las agregaciones que generen.

## Sección 0: Preguntas de temas vistos en clase (20pts)

- Responda las siguientes preguntas de temas que fueron tocados en
  clase.

1.  ¿Qué es una ufunc y por qué debemos de utilizarlas cuando
    programamos trabajando datos?

Ufunc es una colección de funcionaes qye significa “Universal Functions”
de NumPy que operan de forma rápida y eficiente sobre arrays. Estas
funciones están optimizadas para trabajar sobre estructuras de datos en
paralelo, aplicando operaciones elemento por elemento.Son útiles
justamente porque permiten manejar operaciones vectorizadas en arrays,
eliminando la necesidad de bucles explícitos y, por lo tanto, mejoran
significativamente el rendimiento de las operaciones, especialmente
cuando se trabaja con un volumen alto de datos.

2.  Es una técnica en programación numérica que amplía los objetos que
    son de menor dimensión para que sean compatibles con los de mayor
    dimensión. Describa cuál es la técnica y de un breve ejemplo en R.

La técnica se llama broadcasting. Un ejemplo en R para ajustar el objeto
a con el objeto b:

Vector de menor dimensión a \<- c(1, 2, 3)

Matriz de mayor dimensión b \<- matrix(1:9, nrow = 3, ncol = 3)

Broadcasting: R ajusta el vector ‘a’ para ser compatible con la matriz
‘b’

result \<- a + b

Cuando se hace a + b, el broadcasting expande el vector a para que cada
fila de la matriz b sume con el vector a. En este caso, el vector a se
“repite” tres veces para que coincida con las tres filas de la matriz b.

3.  ¿Qué es el axioma de elegibilidad y por qué es útil al momento de
    hacer análisis de datos?

El axioma de elegibilidad en teoría de conjuntos establece que, dado un
conjunto y una propiedad, es posible formar subconjuntos que contengan
solo los elementos que cumplen dicha propiedad. Es útil en análisis de
datos porque permite filtrar y seleccionar subconjuntos relevantes de un
conjunto de datos grande. Por ejemplo, cuando seleccionamos solo las
filas de una base de datos que cumplen con una cierta condición (por
ejemplo, usuarios hombres o mujeres, filtraciones por edad, etc).

4.  Cuál es la relación entre la granularidad y la agregación de datos?
    Mencione un breve ejemplo. Luego, explique cuál es la granularidad o
    agregación requerida para poder generar un reporte como el
    siguiente:

| Pais | Usuarios |
|------|----------|
| US   | 1,934    |
| UK   | 2,133    |
| DE   | 1,234    |
| FR   | 4,332    |
| ROW  | 943      |

La granularidad se refiere al nivel de detalle en los datos, donde una
mayor granularidad implica más detalles (como datos individuales o
transacciones). Por otro lado, la agregación combina o resume esos datos
detallados en un nivel más general (como a nivel de país o mes). Por
ejemplo, en un conjunto de datos de compras, una alta granularidad
mostraría cada compra individual, mientras que una menor granularidad
agruparía las compras por usuario o país. Para generar un reporte de
usuarios por país, se requiere un nivel de agregación que sume los datos
individuales a nivel de país, reduciendo la granularidad para mostrar
solo el total de usuarios por cada país.

Basándose en la tabla que presenta el número total de usuarios por país,
se requiere un nivel de agregación que combine los datos individuales de
cada usuario y los sume por país. Esto implica reducir la granularidad
de los datos originales (donde cada fila representa a un usuario
individual) para obtener un resumen donde solo se vea el total de
usuarios por cada país. De esta manera, se pasa de datos detallados
(usuarios individuales) a un resumen general (usuarios agrupados por
país).

## Sección I: Preguntas teóricas. (50pts)

- Existen 10 preguntas directas en este Rmarkdown, de las cuales usted
  deberá responder 5. Las 5 a responder estarán determinadas por un
  muestreo aleatorio basado en su número de carné.(20210534)

- Ingrese su número de carné en `set.seed()` y corra el chunk de R para
  determinar cuáles preguntas debe responder. -\> done

``` r
set.seed(20210534) 
v<- 1:10
preguntas <-sort(sample(v, size = 5, replace = FALSE ))

paste0("Mis preguntas a resolver son: ",paste0(preguntas,collapse = ", "))
```

    ## [1] "Mis preguntas a resolver son: 2, 4, 5, 8, 10"

``` r
#mis preguntas son 2,4,5,8 y 10
```

### Listado de preguntas teóricas

##### Mis preguntas son 2,4,5,8 y 10

2.  Al momento de filtrar en SQL, ¿cuál keyword cumple las mismas
    funciones que el keyword `OR` para filtrar uno o más elementos una
    misma columna?

3.  ¿Cuál es la diferencia entre utilizar `==` y `=` en R?

4.  ¿Cuál es la forma correcta de cargar un archivo de texto donde el
    delimitador es `:`?

5.  Si en un dataframe, a una variable de tipo `factor` le agrego un
    nuevo elemento que *no se encuentra en los niveles existentes*,
    ¿cuál sería el resultado esperado y por qué?

    - El nuevo elemento

6.  Si quiero obtener como resultado las filas de la tabla A que no se
    encuentran en la tabla B, ¿cómo debería de completar la siguiente
    sentencia de SQL?

    - SELECT \* FROM A \_\_\_\_\_\_\_ B ON A.KEY = B.KEY WHERE
      \_\_\_\_\_\_\_\_\_\_ = \_\_\_\_\_\_\_\_\_\_

Extra: ¿Cuántos posibles exámenes de 5 preguntas se pueden realizar
utilizando como banco las diez acá presentadas? (responder con código de
R.)

## Sección II Preguntas prácticas. (30pts)

- Conteste las siguientes preguntas utilizando sus conocimientos de R.
  Adjunte el código que utilizó para llegar a sus conclusiones en un
  chunk del markdown.

A. De los clientes que están en más de un país,¿cuál cree que es el más
rentable y por qué?

B. Estrategia de negocio ha decidido que ya no operará en aquellos
territorios cuyas pérdidas sean “considerables”. Bajo su criterio,
¿cuáles son estos territorios y por qué ya no debemos operar ahí?

### I. Preguntas teóricas

## A

``` r
###resuelva acá
```

## B

``` r
###resuelva acá
```
