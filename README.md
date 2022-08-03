# Tutorial de uso

Este repositorio contiene las herramientas necesarias para implementar un transcriptor de música polifónica de piano empleando un modelo NMF (non-negative matrix factorization) y un banco de filtros auditivos al espectro de la señal de música (matriz W).

El sistema puede emplearse de dos modos:

* Entrenamiento
* Transcripción

Es importante descargar el folder principal junto al folder secundario data (el cual contiene los datos de entrenamiento y prueba).

## Modo transcripción

Si deseas transcribir canciones con modelos preentrenados puedes hacer uso de la función transcripcion.m

Dentro de la función, lo primero que deberás hacer es asignar a la variable filename el valor de la canción a transcribir, por ejemplo, 'Handel__Sarabande_in_D_minor.wav'. La variable midiname llevará el mismo nombre con la única diferencia de la terminación, 'Handel__Sarabande_in_D_minor.mid' en este caso.

También es posible configurar el sistema con diferentes configuraciones de filtros mediante la variable selecciona, por defecto se aplicará la propuesta en el trabajo :

Otros parámetros se explican dentro del código, tales como (umbral de la matriz H y modelos auditivos: Greenwood y Slaney)

Finalmente, ejecutar la función transcripcion.m se generarán variables con diferentes valores, entre las cuales

## Modo entrenamiento

Si deseas entrenar un modelo NMF puedes hacerlo mediante la funcion 
