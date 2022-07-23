* Encoding: UTF-8.


**********************************************************************************************.
* NOTE: This syntax must be run on 'Brazil_Italy_2014_Cath_NCath.sav'.
* The IBM SPSS Categories module is required to run the MULTIPLE CORRES
* command.
**********************************************************************************************.


****************************************************************************************
    Multiple Correspondence Analysis.
****************************************************************************************.
MULTIPLE CORRES VARIABLES=G75_2 G76_2 G77_2 G79_2 G80_2 G81_2 G83_2
  /ANALYSIS=G75_2(WEIGHT=1) G76_2(WEIGHT=1) G77_2(WEIGHT=1) G79_2(WEIGHT=1) 
    G80_2(WEIGHT=1) G81_2(WEIGHT=1) G83_2(WEIGHT=1)
  /MISSING=G75_2(PASSIVE,MODEIMPU) G76_2(PASSIVE,MODEIMPU) G77_2(PASSIVE,MODEIMPU) 
    G79_2(PASSIVE,MODEIMPU) G80_2(PASSIVE,MODEIMPU) G81_2(PASSIVE,MODEIMPU) 
    G83_2(PASSIVE,MODEIMPU) 
  /DIMENSION=2
  /NORMALIZATION=VPRINCIPAL
  /MAXITER=100
  /CRITITER=.00001
  /PRINT=CORR DESCRIP(G75_2 G76_2 G77_2 G79_2 G80_2 G81_2 G83_2) DISCRIM QUANT(G75_2 G76_2 
    G77_2 G79_2 G80_2 G81_2 G83_2) 
  /PLOT=BIPLOT(20) OBJECT(20) CATEGORY(G75_2 G76_2 G77_2 G79_2 G80_2 G81_2 G83_2) (20) 
    JOINTCAT(G75_2 G76_2 G77_2 G79_2 G80_2 G81_2 G83_2) (20) DISCRIM (20).
