*Analyses
*Arellano-Bond Linear Dynamic Panel-Data Estimation
xtabond demlg l(0/1).netimfiblg iyear1-iyear17 if sample==1, lags(1) vce(robust)
estat abond
xtabond demlg l(0/1).netimfiblg l(0/1).fdisiglg iyear1-iyear17 if sample==1, lags(1) vce(robust)
estat abond
xtabond demlg l(0/1).netimfiblg l(0/1).fdisiglg l(0/1).tradelg iyear1-iyear17 if sample==1, lags(1) vce(robust)
estat abond
xtabond demlg l(0/1).netimfiblg l(0/1).fdisiglg l(0/1).tradelg l(0/1).gdppclg l(0/1).indlg iyear1-iyear17 if sample==1, lags(1) vce(robust)
estat abond
xtabond demlg l(0/1).netimfiblg l(0/1).fdisiglg l(0/1).tradelg l(0/1).gdppclg l(0/1).indlg l(0/1).grcaplg l(0/1).edseclg iyear1-iyear17 if sample==1, lags(1) vce(robust)
estat abond

*Calculating Long-Run Effects
nlcom (_b[netimfiblg] + _b[L.netimfiblg]) / (1 - _b[L.demlg])
nlcom (_b[fdisiglg] + _b[L.fdisiglg]) / (1 - _b[L.demlg])
nlcom (_b[tradelg] + _b[L.tradelg]) / (1 - _b[L.demlg])
nlcom (_b[gdppclg] + _b[L.gdppclg]) / (1 - _b[L.demlg])
nlcom (_b[indlg] + _b[L.indlg]) / (1 - _b[L.demlg])
nlcom (_b[grcaplg] + _b[L.grcaplg]) / (1 - _b[L.demlg])
nlcom (_b[edseclg] + _b[L.edseclg]) / (1 - _b[L.demlg])

*Include FDI Rate and Financial Globalization
xtabond demlg l(0/1).netimfiblg l(0/1).fdisiglg l(0/1).tradelg l(0/1).gdppclg l(0/1).indlg l(0/1).grcaplg l(0/1).edseclg l(0/1).fdirateilg l(0/1).glofinlg iyear1-iyear17 if sample==1, lags(1) vce(robust)
estat abond

*Replace with FDI Out-Coreness
xtabond demlg l(0/1).netimfoblg l(0/1).fdisoglg l(0/1).tradelg l(0/1).gdppclg l(0/1).indlg l(0/1).grcaplg l(0/1).edseclg iyear1-iyear17 if sample==1, lags(1) vce(robust)
estat abond

*Exclude Outliers
xtabond demlg l(0/1).netimfiblg l(0/1).fdisiglg l(0/1).tradelg l(0/1).gdppclg l(0/1).indlg l(0/1).grcaplg l(0/1).edseclg iyear1-iyear17 if sample==1 & out!=0, lags(1) vce(robust)
estat abond
xtabond demlg l(0/1).netimfiblg l(0/1).fdisiglg l(0/1).tradelg l(0/1).gdppclg l(0/1).indlg l(0/1).grcaplg l(0/1).edseclg iyear1-iyear17 if sample==1 & out>=.2, lags(1) vce(robust)
estat abond

*Exclude OFC States
xtabond demlg l(0/1).netimfiblg l(0/1).fdisiglg l(0/1).tradelg l(0/1).gdppclg l(0/1).indlg l(0/1).grcaplg l(0/1).edseclg iyear1-iyear17 if sample==1 & ofc!=1, lags(1) vce(robust)
estat abond

*Reverse Causality
xtabond netimfiblg l(0/1).demlg iyear1-iyear17 if sample==1, lags(1) vce(robust)
estat abond
xtabond netimfiblg l(0/1).demlg l(0/1).tradelg l(0/1).gdppclg l(0/1).indlg l(0/1).grcaplg l(0/1).edseclg iyear1-iyear17 if sample==1, lags(1) vce(robust)
estat abond

clear

log off
