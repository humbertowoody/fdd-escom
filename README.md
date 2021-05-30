# Fundamentos de Diseño Digital - ESCOM

En este repositorio se encuentran algunos códigos y trabajos realizados para la materia de _Fundamentos de Diseño Digital_ en la Escuela Superior de Cómputo del Instituto Politécnico Nacional en el período de Febrero a Junio del 2021.

## Compilando y Ejecutando código VHDL

La indicación por parte del curso es utilizar el IDE para VHDL "Galaxy" el cual, desafortunadamente, únicamente es funcional en _Windows XP_. Por esta situación, en este repositorio se incluye el script de shell `compilar-y-generar-vcd.sh`, con el cual se puede, como el nombre lo indica, compilar un archivo `.vhdl` y generar un archivo `.vcd` con el cual se puede realizar una simulación muy parecida a la que se puede esperar en Galaxy.

Esta decisión viene dado que únicamente dispongo de una computadora con el nuevo chip de Apple M1 el cual, al ser arquitectura ARM, aún no dispone de medios de emulación de imágenes ISO para sistemas operativos x86_64 (¡aún!), por lo que tuve que buscar una alternativa para seguir desarrollando las prácticas.

En esta búsqueda me encontré con el compilador GHDL y el visualizador de onda GTKWave, con ambos he sido capaz de emular por completo el funcionamiento de Galaxy además de permitirme desarrollar en un ambiente más moderno sin requerir el uso de máquinas virtuales ni configuraciones complejas.

### GHDL

Para compilar archivos VHDL, utilizo el compilador _GHDL_. Éste compilador permite realizar cuatro tareas principales:

- `ghdl -a archivo.vhdl`: Verificar un archivo VHDL.
- `ghdl -e nombre_componente`: _Elaborar_ un componente (ojo, no un archivo, sino el nombre del componente).
- `ghdl -r nombre_componente_testbench`: Ejecutar un componente de tipo _"testbench"_, refiriéndose así a una prueba automatizada de las entradas vs. las salidas esperadas.
- `ghdl -r nombre_componente_testbench --vcd=archivo-resultante.vcd`: Lo mismo que el anterior pero, adicionalmente, genera un archivo de tipo `.vcd` con el cual podremos visualizar de manera gráfica el comportamiento de nuestro programa.

Este compilador es gratuito y está disponible para todas las plataformas. Sin embargo, se recomienda su uso en sistemas Linux o macOS ya que, en Windows, la instalación puede ser un tanto complicada ya que requiere un emulador de POSIX válido como lo es MinGW. La instalación del compilador, pues, en los sistemas soportados es tan simple como:

- Linux
  - Ubuntu: `sudo apt install ghdl`
  - Fedora: `yum install ghdl`
- macOS: `brew install ghdl`

### Visualizando archivos VCD con GTKWave

Para visualizar archivos VCD, existen múltiples herramientas que podemos utilizar, sin embargo, he optado por utilizar _GTKWave_, el cual es de código abierto y es completamente gratuito, además de ser compatible en Linux y macOS de forma nativa aunque, al igual que GHDL, se recomienda su uso en sistemas Linux o macOS peusto que su instalación en Windows puede ser un tanto compleja.

Una vez que hayamos obtenido nuestro archivo `.vcd`, lo único que resta es abrirlo con GTKWave, esto puede ser realizado de una de dos maneras:

1. Mediante la instrucción de CLI: `gtkwave mi-archivo.vcd`.
2. Abriendo `mi-archivo.vcd` directamente con el programa en modo gráfico.

En ambos casos, se nos presentará la interfaz gráfica y, del lado izquierdo, podremos observar nuestros componentes para que podamos importar las entradas y salidas apropiadamente. Para importarlas, basta con seleccionar nuestro componente, y después, en el recuadro de abajo a la izquierda, arrastrar y soltar aquellas que queramos visualizar a nuestra columna central dónde procederemos a evaluar contra el tiempo.

> Un pequeño detalle es que el tiempo siempre está en pico-segundos, lo cual es un poco desafortunado si en nuestro _testbench_ utilizamos pausas (o interrupciones) de varios nanosegundos, micro, mili e, inclusive, segundos, por lo que debemos hacer click en la lupa que no tiene ni un + ni un - y la visualización se adaptará a la escala más conveniente.

Se recomienda ampliamente buscar más información de GTKWave puesto que tiene aún más opciones _muy cool_ para que podamos utilizar el software de la mejor manera.

## El script `compilar-y-generar-vcd.sh`

Para automatizar un poco las tareas y ahorrar un poco de tiempo, escribí un pequeño script llamado `compilar-y-generar-vcd.sh` el cual se puede copiar y pegar para cada uno de nuestros archivos que queramos simular y, así, evitarnos líos al momento de querer realizar la compilación y generación del archivo `.vcd` para cada una de nuestras prácticas.

El contenido del script es:

```bash
# Variables.
ARCHIVO_ORIGEN=archivo-con-entidad-principal.vhdl
ARCHIVO_TESTBENCH=archivo-con-entidad-testbench.vhdl
COMPONENTE_TESTBENCH=entidad_para_testbench
ARCHIVO_VCD=archivo-a-generar.vcd

# Compilación y ejecución.
ghdl -a $ARCHIVO_ORIGEN && \
  echo "¡$ARCHIVO_ORIGEN es válido!" && \
  ghdl -a $ARCHIVO_TESTBENCH && \
  echo "¡$ARCHIVO_TESTBENCH es válido!" && \
  ghdl -e $COMPONENTE_TESTBENCH && \
  echo "¡Se ha elaborado \"$COMPONENTE_TESTBENCH\" exitosamente!" && \
  echo "Ejecutando testbench..." && \
  ghdl -r $COMPONENTE_TESTBENCH --vcd=$ARCHIVO_VCD && \
  echo "Se ha generado el archivo \"$ARCHIVO_VCD\" correctamente.";
```

Como se puede ver, es únicamente una automatización de `ghdl -a`, `ghdl -e` y `ghdl -r` para realizar más rápido el proceso "promedio" de codificación y pruebas en VHDL. En la parte superior se describen 4 variables que a continuación explico a detalle:

- `ARCHIVO_ORIGEN`: Este es el archivo que contiene nuestro código fuente "base" (por decirlo de alguna manera), significando nuestro componente que realiza la lógica y contiene todos los elementos operativos de nuestro programa.
- `ARCHIVO_TESTBENCH`: Este es el archivo que contiene el componente de tipo "testbench", el cual es un estilo de _prueba unitaria_ en la cual se va probando cada caso y se coloca una pequeña pausa entre cada uno. Cabe recalcar que las pausas, y la duración de las mismas, serán aquellas que serán mostradas posteriormente en el visualizador gráfico por lo que es de suma importancia que **usemos cantidades razonables en la medición de tiempo**, ya sean pico, nano, mili o segundos, para una mejor experiencia es mejor mantener la escala igual durante todo el archivo.
- `COMPONENTE_TESTBENCH`: Aquí debe ir el nombre del componente final de testbench ya que dicho componente será el que se utilice para generar la simulación final en nuestro archivo `.vcd`.
- `ARCHIVO_VCD`: Es el nombre del archivo final donde se almacenará la simulación, deberá llevar la extensión `.vcd` y será éste el que abramos en GTKWave para visualizar los resultados.

### Ejecución del Script

Para ejecutar el script, primero verificaremos que nuestro archivo tenga los permisos de ejecución correspondientes:

`$ chmod +x compilar-y-generar-vcd.sh`

Ahora es tan fácil como ubicarnos dentro del directorio donde se encuentra nuestro código fuente y ejecutar:

`$ ./compilar-y-generar-vcd.sh`

¡Y listo! Si nuestro código está bien, se generará un archivo `.vcd`.

### Ejemplo de configuración para el Script

Supongamos que contamos con la siguiente estructura de archivos en un directorio particular, llamémosle "practica-85" (no, porfavor):

```txt
 /practica-85
   - practica-85.vhdl
   - practica-85-tb.vhdl
   - compilar-y-generar-vcd.sh
```

En dónde nuestro archivo :`practica-85.vhdl` cuenta con un componente llamado: `sumador`, y nuestro archivo: `practica-85-tb.vhdl` cuenta con un componente llamado: `sumador_tb`. Esto quiere decir que `sumador`  es nuestro componente en VHDL que contiene la lógica de un sumador (vaya la redundancia) y `sumador_tb` es una prueba de dicho sumador. La configuración que _deberíamos_ colocar en nuestro archivo `compilar-y-generar-vcd.sh` sería:

```txt
...
ARCHIVO_ORIGEN=practica-85.vhdl
ARCHIVO_TESTBENCH=practica-85-tb.vhdl
COMPONENTE_TESTBENCH=sumador_tb
ARCHIVO_VCD=sumador.vcd
...
```

Ahora, solo basta con ejecutar, dentro del propio directorio, el comando:

```bash
$ ./compilar-y-generar-vcd.sh
¡practica-85.vhdl es válido!
¡practica-85-tb.vhdl es válido!
¡Se ha elaborado "sumador_tb" exitosamente!
Ejecutando testbench...
# ... logs de testbench ...
Se ha generado el archivo "sumador.vcd" correctamente.
```

Y nuestra estructura de archivos se verá así:

```txt
 /practica-85
   - practica-85.vhdl
   - practica-85-tb.vhdl
   - compilar-y-generar-vcd.sh
   - sumador.vcd <---- !!!
```

El archivo `sumador.vcd` contiene las indicaciones necesarias para que GTKWave visualice el comportamiento de nuestro código sin problema alguno.

## Créditos

Todo el código fuente aquí presente es libre y estará disponible para toda persona que le pueda ser de utilidad.

Realizó: Humberto Alejandro Ortega Alcocer.
