# Generar tabla de frecuencias e histogramas

#Data cambiamos variables valor de X dependiendo lo que quiero obtener
x <- bapslvl3$genotipos_baps
x <- fastbapslvl3$genotipo_fastbaps
# Aqui solo para obtener los aislados genotipo solo españoles.
x <- coso$genotipos_baps
x <- coso2$genotipo_fastbaps
#Your code
factorx <- factor(cut(x, breaks=nclass.Sturges(x)))
#Tabulate and turn into data.frame
xout <- as.data.frame(table(factorx))
#Add cumFreq and proportions
xout <- transform(xout, cumFreq = cumsum(Freq), relative = prop.table(Freq))

# or
cbind( Freq=table(x), Cumul=cumsum(table(x)), relative=prop.table(table(x)))
# more simple
cbind( Freq=table(x))

# generate histogram
hist(x, breaks = "Sturges")