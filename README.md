# Tutorial de uso

Este repositorio contiene las herramientas necesarias para implementar un transcriptor de música polifónica de piano empleando un modelo NMF (non-negative matrix factorization) y un banco de filtros auditivos al espectro de la señal de música (matriz W).

El sistema puede emplearse de dos modos:

* Entrenamiento
* Transcripción

El proyecto funciona adecuadamente con la versión de MATLAB R2018a.

## Configuración del entorno

1. Primero es necesario descargar el folder del proyecto general que contiene el resto de folders. 
2. Colocar el folder programa principal y data en la ruta de programas de MATLAB.
3. Agregar los folders de AuditoryToolbox Modificado y matlab-midi-master al path de toolbox de MATLAB.

## Modo transcripción

Si deseas transcribir canciones con modelos preentrenados puedes hacer uso de la función transcripcion.m

Dentro de la función, lo primero que deberás hacer es asignar a la variable filename el valor de la canción a transcribir, por ejemplo, 'Handel__Sarabande_in_D_minor.wav'. La variable midiname llevará el mismo nombre con la única diferencia de la terminación, 'Handel__Sarabande_in_D_minor.mid' en este caso.

Al ejecutar la función transcripcion.m se generarán variables con diferentes valores, entre las cuales solo requerirás resultados_inicios, resultados_finales y tempo_midi para aplicar la función escribe_midi_polifonico(resultados_inicios,resultados_finales,'Handel__Sarabande_in_D_minor_Transcrito',tempo_midi) y así puedas generar la transcripción de la canción analizada en formado MIDI. El archivo de la canción transcrita lo encontrarás en el folder principal.

También es posible configurar el sistema con diferentes configuraciones de filtros mediante la variable selecciona, por defecto se aplicará la propuesta en el trabajo. Además en esta función es posible elegir que tipo de representación de la señal de música de la canción deseas usar, predeterminadamente se empleará la STFT (Short Time Fourier Transform).

Otros parámetros se explican dentro del código, tales como (umbral de la matriz H y modelos auditivos: Greenwood y Slaney)

## Modo entrenamiento

Si deseas entrenar un modelo NMF puedes hacerlo mediante la funcion Entrenamiento.m

En ella podrás elegir con que archivos de notas aisladas entrenar el modelo NMF, así como que técnica de representación de la señal de música, por defecto se implementa la FFT como inicialización del espectro de cada nota en la matriz W.

Existen diferentes configuraciones si deseas aplicar el banco de filtros propuesto al espectro.




