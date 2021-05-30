#!/bin/sh
# Compilar y Generar VCD
# Este archivo encapsula los pasos necesarios para realizar pruebas en VHDL
# utilizando el compilador GHDL. Para funcionar, debemos realizar los siguientes
# pasos:
# 1) Generar nuestro archivo VHDL con nuestra entidad principal.
# 2) Generar nuestro archivo VHDL "testbench" dónde codificaremos las pruebas a realizar.
# 3) Llenar las variables correspondientes en _este_ script.
# 4) Ejecutar el script y, una vez finalizado, abrir el archivo .vcd desde GTKWave.
#
# Realizado por: Humberto Alejandro Ortega Alcocer - 2021

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