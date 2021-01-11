## Pruebas de baps con lineaje 4

- Corri el baps con las siguientes especificaciones con un alineamiento unico del linaaje 4
~~~
hb.results <- hierBAPS(snp.matrix, n.cores = 8, max.depth = 10, n.pops = 100, quiet = TRUE)
~~~

- Arrroja este resultado de calculo y crea el siguiente arbol con los 10 niveles indenticos
~~~
> head(hb.results$partition.df)
  Isolate level 1 level 2 level 3 level 4 level 5 level 6 level 7 level 8 level 9 level 10
1     G01       1       1       1       1       1       1       1       1       1        1
2     G02       1       1       1       1       1       1       1       1       1        1
3     G03       1       1       1       1       1       1       1       1       1        1
4     G04       1       1       1       1       1       1       1       1       1        1
5   G1000       1       1       1       1       1       1       1       1       1        1
6   G1002       1       1       1       1       1       1       1       1       1        1
~~~

![Alt text](https://github.com/TBmex/baps_1177_linnage4/blob/master/Rplot_lvl4_not_pops.jpeg)

### El alineamiento al parecer estaba mal copiado, copia siempre desde el servidor
- **DESCARTADO, ALINEAMIENTO CORRECTO**
- Realizamos una nueva corrida con los siguientes parametros, copiando el alineamiento desde el sevidor.
~~~
hb.results <- hierBAPS(snp.matrix, n.cores = 6, max.depth = 8, n.pops = 100, quiet = TRUE)
~~~
- Mismo reusultado
~~~
> head(hb.results$partition.df)
  Isolate level 1 level 2 level 3 level 4 level 5 level 6 level 7 level 8
1     G01       1       1       1       1       1       1       1       1
2     G02       1       1       1       1       1       1       1       1
3     G03       1       1       1       1       1       1       1       1
4     G04       1       1       1       1       1       1       1       1
5   G1000       1       1       1       1       1       1       1       1
6   G1002       1       1       1       1       1       1       1       1
~~~
- **Hay un detalle en el alineamiento que no no estoy observando**
- **DESCARTADO, ALINEAMIENTO CORRECTO**
- Probemos snp-site:
~~~
snp-sites -o run_1177.fas run_alignment_no_resis.fas
~~~
Lo probamos pero no redujo el tamaño de la matriz. 473.**9** Mb vs 473.**8** Mb

1. Repetimos alineamiento y corremos de nuevo?
- No es el alineamiento.
2. Bajamos los parametros, corrimos en servidor y en PC.
- Resultados del PC
~~~
hb.results <- hierBAPS(snp.matrix, n.cores = 6, max.depth = 8, quiet = TRUE)
> head(hb.results$partition.df)
  Isolate level 1 level 2 level 3 level 4 level 5 level 6 level 7 level 8
1     G01       1       1       1       1       1       1       1       1
2     G02       1       1       2       5       3       2       2       2
3     G03       1       2       6       8       4       3       3       3
4     G04       2       4       9      14       7       5       4       4
5   G1000       1       2       7      20       9       7       5       5
6   G1002       2       5      12      23      13      11       7       6
~~~
Arbol lvl1 to 8:

![](assets/README-a53cd1f4)![](assets/README-2c0ec8c6)![](assets/README-7682f812)![](assets/README-1f381fe1)![](assets/README-001ddcb9)![](assets/README-9a8a3807)![](assets/README-cdcf3aeb)![](assets/README-449bb773)

- Resultados del servidor: Sigue corriendo despues de dos dias??
- Tiene algo que ver el **max.depth = 2**? **No tiene que ver**
- Segunda prueba sigue corriendo despues de 2 dias **Algo pasa en el sv**
~~~
hb.results <- hierBAPS(snp.matrix, n.cores = 16, max.depth = 2, quiet = TRUE)

hb.results <- hierBAPS(snp.matrix, n.cores = 12, max.depth = 8, quiet = TRUE)
~~~

![](assets/README-d2210609.png)

3. Consideramos FastBaps? En proceso.

## Logramas poner en el mismo arbol Españoles/Bapslvl3/Clusters10snp

Link: https://itol.embl.de/tree/16111121936428041608308653

-Cerramos aqui el tema y planteo nuevas cosas por hacer.

## Nuevos planteos

1. Jugar con el arbol retirando la raiz
- No debia interferir y no interfiere.
https://itol.embl.de/tree/16111121936433581608305070

2. Dejar solo una muestra por cluster
- Por cluster o por cluster español?

3. Revisar si el baps esta agrupando los clusters
- El baps esta agrupando clusters de manera correcta, solo cuando se baja la profundidad (lvls) demasiado cambia.
- Fastbaps y rhierbaps agrupan de manera correcta los clusters.

4. Realizar con FastBaps
- Resultados similares al rhierbaps.

5. Hay algo con mi alineamiento que este mal? Puffffffffffffff Por que separa los genotipos?
- Los separa por que son genotipos, no deben forzosamente estar juntos en la filogenia.
- El resultado no debe ser exacto al tu representacion de linajes y clusters es un experimento.
- Se detectan genotipos; no linajes, ni clusters.
