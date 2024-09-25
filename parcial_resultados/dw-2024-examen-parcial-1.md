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

- Ufunc es una colección de funcionaes qye significa “Universal
  Functions” de NumPy que operan de forma rápida y eficiente sobre
  arrays. Estas funciones están optimizadas para trabajar sobre
  estructuras de datos en paralelo, aplicando operaciones elemento por
  elemento.Son útiles justamente porque permiten manejar operaciones
  vectorizadas en arrays, eliminando la necesidad de bucles explícitos
  y, por lo tanto, mejoran significativamente el rendimiento de las
  operaciones, especialmente cuando se trabaja con un volumen alto de
  datos.

2.  Es una técnica en programación numérica que amplía los objetos que
    son de menor dimensión para que sean compatibles con los de mayor
    dimensión. Describa cuál es la técnica y de un breve ejemplo en R.

- La técnica se llama broadcasting. Un ejemplo en R para ajustar el
  objeto a con el objeto b:

Vector de menor dimensión a \<- c(1, 2, 3)

Matriz de mayor dimensión b \<- matrix(1:9, nrow = 3, ncol = 3)

Broadcasting: R ajusta el vector ‘a’ para ser compatible con la matriz
‘b’

result \<- a + b

- Cuando se hace a + b, el broadcasting expande el vector a para que
  cada fila de la matriz b sume con el vector a. En este caso, el vector
  a se “repite” tres veces para que coincida con las tres filas de la
  matriz b.

3.  ¿Qué es el axioma de elegibilidad y por qué es útil al momento de
    hacer análisis de datos?

- El axioma de elegibilidad en teoría de conjuntos establece que, dado
  un conjunto y una propiedad, es posible formar subconjuntos que
  contengan solo los elementos que cumplen dicha propiedad. Es útil en
  análisis de datos porque permite filtrar y seleccionar subconjuntos
  relevantes de un conjunto de datos grande. Por ejemplo, cuando
  seleccionamos solo las filas de una base de datos que cumplen con una
  cierta condición (por ejemplo, usuarios hombres o mujeres,
  filtraciones por edad, etc).

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

- La granularidad se refiere al nivel de detalle en los datos, donde una
  mayor granularidad implica más detalles (como datos individuales o
  transacciones). Por otro lado, la agregación combina o resume esos
  datos detallados en un nivel más general (como a nivel de país o mes).
  Por ejemplo, en un conjunto de datos de compras, una alta granularidad
  mostraría cada compra individual, mientras que una menor granularidad
  agruparía las compras por usuario o país. Para generar un reporte de
  usuarios por país, se requiere un nivel de agregación que sume los
  datos individuales a nivel de país, reduciendo la granularidad para
  mostrar solo el total de usuarios por cada país.

- Basándose en la tabla que presenta el número total de usuarios por
  país, se requiere un nivel de agregación que combine los datos
  individuales de cada usuario y los sume por país. Esto implica reducir
  la granularidad de los datos originales (donde cada fila representa a
  un usuario individual) para obtener un resumen donde solo se vea el
  total de usuarios por cada país. De esta manera, se pasa de datos
  detallados (usuarios individuales) a un resumen general (usuarios
  agrupados por país).

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

### Listado de preguntas teóricas

##### Mis preguntas son 2,4,5,8 y 10

2.  Al momento de filtrar en SQL, ¿cuál keyword cumple las mismas
    funciones que el keyword `OR` para filtrar uno o más elementos una
    misma columna?

- El keyword que cumple las mismas funciones que OR en SQL es IN. Se
  utiliza para filtrar uno o más valores dentro de una misma columna de
  manera más concisa.

- Ejemplo de comparación:

SELECT \* FROM tabla WHERE columna IN (‘valor1’, ‘valor2’, ‘valor3’);

SELECT \* FROM tabla WHERE columna = ‘valor1’ OR columna = ‘valor2’ OR
columna = ‘valor3’;

4.  ¿Cuál es la diferencia entre utilizar `==` y `=` en R?

En R, == se usa para comparar valores, mientras que = se usa para
asignar valores en ciertos contextos, como dentro de una función.

5.  ¿Cuál es la forma correcta de cargar un archivo de texto donde el
    delimitador es `:`?

- Para cargar un archivo de texto en R donde el delimitador es :, puedes
  utilizar la función read.table() o read.csv() especificando el
  parámetro sep.El parámetro sep en las funciones como read.table() o
  read.csv() en R se utiliza para especificar el delimitador que separa
  los valores en el archivo de texto. Un delimitador es el carácter que
  se utiliza para separar columnas o campos en un archivo de datos. Al
  especificar el delimitador con sep, R sabe cómo dividir cada fila del
  archivo de texto en columnas. Si no se indica correctamente el
  delimitador, R podría interpretar toda la fila como un solo valor o no
  dividir las columnas correctamente.

ejemplo: datos \<- read.table(“archivo.txt”, sep = “:”)

8.  Si en un dataframe, a una variable de tipo `factor` le agrego un
    nuevo elemento que *no se encuentra en los niveles existentes*,
    ¿cuál sería el resultado esperado y por qué?

- El nuevo elemento será tratado como un valor NA (missing value) porque
  no está presente en los niveles existentes del factor.

Ejemplo:

factor_var \<- factor(c(“rojo”, “azul”, “verde”)) factor_var\[4\] \<-
“amarillo” \# “amarillo” no está en los niveles del factor
print(factor_var) \# Devolverá NA en la posición 4

- Esto sucede porque los factores en R solo pueden contener los niveles
  definidos previamente, y si se intenta agregar un nivel que no existe,
  se almacena como NA.

10. Si quiero obtener como resultado las filas de la tabla A que no se
    encuentran en la tabla B, ¿cómo debería de completar la siguiente
    sentencia de SQL?

- SELECT \* FROM A LEFT JOIN B ON A.KEY = B.KEY WHERE B.KEY IS NULL;

Extra: ¿Cuántos posibles exámenes de 5 preguntas se pueden realizar
utilizando como banco las diez acá presentadas? (responder con código de
R.)

- posibles_examenes \<- choose(10, 5)

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
parcial_anonimo <- readRDS("C:/Users/miche/OneDrive/Escritorio/DATA_WRANGLING/DataWragling/parcial_resultados/parcial_anonimo.rds")

# Ver las primeras filas del dataframe
#head(parcial_anonimo)
#names(parcial_anonimo)

library(dplyr)
```

    ## 
    ## Adjuntando el paquete: 'dplyr'

    ## The following objects are masked from 'package:stats':
    ## 
    ##     filter, lag

    ## The following objects are masked from 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

``` r
clientes_multipais <- parcial_anonimo %>%
  group_by(Cliente, Pais) %>%
  summarise(Venta_total = sum(as.numeric(Venta))) %>%
  ungroup() %>%
  group_by(Cliente) %>%
  filter(n_distinct(Pais) > 1) %>%
  summarise(Venta_total = sum(Venta_total)) %>%
  arrange(desc(Venta_total))
```

    ## `summarise()` has grouped output by 'Cliente'. You can override using the
    ## `.groups` argument.

``` r
top_5_clientes <- head(clientes_multipais, 5)

top_5_clientes
```

    ## # A tibble: 5 × 2
    ##   Cliente  Venta_total
    ##   <chr>          <dbl>
    ## 1 a17a7558      19818.
    ## 2 ff122c3f      15359.
    ## 3 c53868a0      13813.
    ## 4 044118d4       9436.
    ## 5 f676043b       3635.

Para poder saber cuáles de los clientes que están en más de un país es
rentable primero se basa en la columna de CLIENTES y se hace una
filtración de los que están más de un país. Luego basándose en estos
clientes se hace una suma de todo lo que está en VENTAS según ese ID de
cliente, es importante mencionar que la rentabilidad se basa en el
numero más grande que esté en VENTAS ya que aquí también se tienen
números negativos que pueden ser contados como pérdidas. En conclusión
se realizó una tabla top_5_clientes que toma en cuenta la suma total de
positivos y negativos de VENTAS para saber quiénes tienen un número
mayor. Esto es visto como los 5 clientes más rentables

## B

``` r
parcial_anonimo <- readRDS("C:/Users/miche/OneDrive/Escritorio/DATA_WRANGLING/DataWragling/parcial_resultados/parcial_anonimo.rds")

head(parcial_anonimo)
```

    ##         DATE Codigo Material Descripcion     Pais Distribuidor Territorio
    ## 1 2018-12-01        637caff5    0cf3ec3d 4046ee34     9a47575c   69c1b705
    ## 2 2018-11-01        637caff5    0cf3ec3d 4046ee34     9a47575c   69c1b705
    ## 3 2018-10-01        637caff5    0cf3ec3d 4046ee34     9a47575c   69c1b705
    ## 4 2018-09-01        637caff5    0cf3ec3d 4046ee34     9a47575c   69c1b705
    ## 5 2018-08-01        637caff5    0cf3ec3d 4046ee34     9a47575c   69c1b705
    ## 6 2018-07-01        637caff5    0cf3ec3d 4046ee34     9a47575c   69c1b705
    ##    Cliente    Marca Canal Venta Unidades plaza  Venta
    ## 1 9d6e1d65 61d7fbfc    7b48292e              2  26.50
    ## 2 9d6e1d65 61d7fbfc    7b48292e              0   0.00
    ## 3 9d6e1d65 61d7fbfc    7b48292e              3  39.75
    ## 4 9d6e1d65 61d7fbfc    7b48292e              3  39.75
    ## 5 9d6e1d65 61d7fbfc    7b48292e              8 106.00
    ## 6 9d6e1d65 61d7fbfc    7b48292e              3  39.75

``` r
names(parcial_anonimo)
```

    ##  [1] "DATE"            "Codigo Material" "Descripcion"     "Pais"           
    ##  [5] "Distribuidor"    "Territorio"      "Cliente"         "Marca"          
    ##  [9] "Canal Venta"     "Unidades plaza"  "Venta"
