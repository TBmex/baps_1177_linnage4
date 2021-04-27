#New_Plots
library(tidyverse)

#Grafico para observar la transmision entre españoles vs la trensmision entre extranjeros
ggplot(New_Frecuencias, aes(Sp_incluster_x, For_incluster_x, label = rownames(New_Frecuencias), group = Genotipo)) +
  geom_point(shape = 21, size = 3, color = "gray40", fill = c("#a6cee3","#1f78b4","#b2df8a","#33a02c","#fb9a99","#e31a1c","#fdbf6f","#ff7f00","#cab2d6","#6a3d9a","#ffff99","#b15928","#a6cee3","#1f78b4","#b2df8a","#33a02c")) +
  xlab("Sp_incluster_x") + ylab("For_incluster_x") +
  ggtitle("") +
  theme(plot.title=element_text(hjust = 0.5, size = 12)) +
  geom_text(vjust = c(-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1), hjust = c(0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5), size = 3) +
  theme(axis.text=element_text(size=11),axis.title.x = element_text (size=14, margin = margin(t = 8, r = 0, b = 0, l = 0)),axis.title.y = element_text(size=14, margin = margin(t = 0, r = 5, b = 0, l = 0 )))

#Grafico para observar la transmision 

New_Frecuencias_filter <- New_Frecuencias %>% filter(Genotipo < 11)

#Grafico para observar la transmision entre españoles vs la trensmision entre extranjeros
ggplot(New_Frecuencias_filter, aes(Sp_incluster_x, For_incluster_x, label = rownames(New_Frecuencias_filter), group = Genotipo)) +
  geom_point(shape = 21, size = 3, color = "gray40", fill = c("#a6cee3","#1f78b4","#b2df8a","#33a02c","#fb9a99","#e31a1c","#fdbf6f","#ff7f00","#cab2d6","#6a3d9a")) +
  xlab("Sp_incluster_x") + ylab("For_incluster_x") +
  ggtitle("") +
  theme(plot.title=element_text(hjust = 0.5, size = 12)) +
  geom_text(vjust = c(-1,-1,-1,-1,-1,-1,-1,-1,-1,-1), hjust = c(0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5), size = 3) +
  theme(axis.text=element_text(size=11),axis.title.x = element_text (size=14, margin = margin(t = 8, r = 0, b = 0, l = 0)),axis.title.y = element_text(size=14, margin = margin(t = 0, r = 5, b = 0, l = 0 )))

