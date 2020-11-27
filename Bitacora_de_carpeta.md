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

## **El alineamiento al parecer estaba mal copiado, copia siempre desde el servidor** 
