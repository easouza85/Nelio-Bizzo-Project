* Encoding: UTF-8.


****************************************************************************************************.
* NOTE: This syntax must be run on 'Brazil_Italy_2014_Original_Data_PT_BR.sav'.
* The final prepared data has been saved on 'Brazil_Italy_2014.sav'
****************************************************************************************************.


****************************************************.
* STEP 1: Renaming the original variables.
****************************************************.
RENAME VARIABLES (Região Sexo Idade Livros Banheiros Religião Congregação Banco Religião_Grupo Religião_Original = 
    Region Gender Age Books Bathrooms Religion Congregation Country Religion_Group Religion_Original).


**********************************************.
* STEP 2: Defining variable properties
**********************************************.
*Region.
VARIABLE LABELS  Region 'Region (Brazil only)'.
*Gender.
VARIABLE LABELS  Gender 'Gender'.
VALUE LABELS Gender
  1 'Female'
  2 'Male'.
*Age.
VARIABLE LABELS  Age 'Age'.
*Books.
VARIABLE LABELS  Books 'How many books are there in your house?'.
VALUE LABELS Books
  1 'None'
  2 '1-10 books'
  3 '11-50 books'
  4 '51-100 books'
  5 '101-250 books'
  6 '251-500 books'
  7 'More than 500 books'.
*Bathrooms.
VARIABLE LABELS  Bathrooms 'How many bathrooms are there in your house?'.
VALUE LABELS Bathrooms
  1 'None'
  2 '1'
  3 '2'
  4 '3'
  5 '4'
  6 '5'
  7 'More than 5'.
*G75.
VALUE LABELS G75
  1 'True'
  2 'False'
  3 'Would not know'.
*G76.
VALUE LABELS G76
  1 'True'
  2 'False'
  3 'Would not know'.
*G77.
VALUE LABELS G77
  1 'True'
  2 'False'
  3 'Would not know'.
*G78.
VALUE LABELS G78
  1 'True'
  2 'False'
  3 'Would not know'.
*G76.
VALUE LABELS G79
  1 'True'
  2 'False'
  3 'Would not know'.
*G80.
VALUE LABELS G80
  1 'True'
  2 'False'
  3 'Would not know'.
*G81.
VALUE LABELS G81
  1 'True'
  2 'False'
  3 'Would not know'.
*G82.
VALUE LABELS G82
  1 'True'
  2 'False'
  3 'Would not know'.
*G83.
VALUE LABELS G83
  1 'True'
  2 'False'
  3 'Would not know'.
* User-missing values from G75 to G83.
MISSING VALUES G75 TO G83 (99,0).
*Religion.
VARIABLE LABELS  Religion 'Do you have any religion?'.
VALUE LABELS Religion
  1 'Yes'
  2 'No'.
*Congregation.
VARIABLE LABELS  Congregation 'Congregation (Brazil only)'.
VALUE LABELS Congregation
  1 'Catolica'
  2 'Ortodoxa'
  3 'Luterana'
  4 'Presbiteriana'
  5 'Batista'
  6 'Adventista'
  7 'Testemunha de Jeova'
  8 'Assembleia de Deus'
  9 'Congregacao Crista do Brasil'
  10 'Internacional da Graca de Deus'
  11 'Mundial do Poder de Deus'
  12 'Universal do Reino de Deus'
  13 'Judaica'
  14 'Budista'
  15 'Umbanda'
  16 'Candomble'
  17 'Espirita Kardecista'
  18 'Other'.
*Country.
VARIABLE LABELS Country 'Country'.
VALUE LABELS Country
  1 'Brazil (Barometro Brasil 2014)'
  2 'Italy (ROSE Italia 2014)'.
* Religion Group.
VARIABLE LABELS  Religion_Group 'Religious Group'.
VALUE LABELS Religion_Group
  1 'Catholic'
  2 'Non-Catholic Christian'
  3 'Non-Christian'.
MISSING VALUES Religion_Group ().
*Religion_Original.
VARIABLE LEVEL  Religion_Original(NOMINAL).
VARIABLE LABELS  Religion_Original 'Original Religion (Italy only)'.
*anni1997_1999.
VARIABLE LABELS  anni1997_1999 'Age indicator (Italy only)'.
EXECUTE.


*************************************************************************************************************************************.
* STEP 3: Defining new versions for G75 to G83 (true/false answers, catholics and non-catholic christians only).
*************************************************************************************************************************************.
* G75 (new version).
DO IF (ANY(G75, 1, 2) AND ANY(Religion_Group, 1, 2)).
COMPUTE G75_1 = 1*((G75 = 1) AND (Religion_Group = 1)) + 2*((G75 = 2) AND (Religion_Group = 1))
                             + 3*((G75 = 1) AND (Religion_Group = 2)) + 4*((G75 = 2) AND (Religion_Group = 2)).
END IF.
FORMATS G75_1(F2).
VARIABLE LABELS G75_1 'G75'.
VALUE LABELS G75_1
    1 'G75+ Cath.'
    2 'G75- Cath.'
    3 'G75+ N.Cath.'
    4 'G75- N.Cath.'.
EXECUTE.
* G76 (new version).
DO IF (ANY(G76, 1, 2) AND ANY(Religion_Group, 1, 2)).
COMPUTE G76_1 = 1*((G76 = 1) AND (Religion_Group = 1)) + 2*((G76 = 2) AND (Religion_Group = 1))
                             + 3*((G76 = 1) AND (Religion_Group = 2)) + 4*((G76 = 2) AND (Religion_Group = 2)).
END IF.
FORMATS G76_1(F2).
VARIABLE LABELS G76_1 'G76'.
VALUE LABELS G76_1
    1 'G76+ Cath.'
    2 'G76- Cath.'
    3 'G76+ N.Cath.'
    4 'G76- N.Cath.'.
* G77 (new version).
DO IF (ANY(G77, 1, 2) AND ANY(Religion_Group, 1, 2)).
COMPUTE G77_1 = 1*((G77 = 1) AND (Religion_Group = 1)) + 2*((G77 = 2) AND (Religion_Group = 1))
                             + 3*((G77 = 1) AND (Religion_Group = 2)) + 4*((G77 = 2) AND (Religion_Group = 2)).
END IF.
FORMATS G77_1(F2).
VARIABLE LABELS G77_1 'G77'.
VALUE LABELS G77_1
    1 'G77+ Cath.'
    2 'G77- Cath.'
    3 'G77+ N.Cath.'
    4 'G77- N.Cath.'.
* G78 (new version).
DO IF (ANY(G78, 1, 2) AND ANY(Religion_Group, 1, 2)).
COMPUTE G78_1 = 1*((G78 = 1) AND (Religion_Group = 1)) + 2*((G78 = 2) AND (Religion_Group = 1))
                             + 3*((G78 = 1) AND (Religion_Group = 2)) + 4*((G78 = 2) AND (Religion_Group = 2)).
END IF.
FORMATS G78_1(F2).
VARIABLE LABELS G78_1 'G78'.
VALUE LABELS G78_1
    1 'G78+ Cath.'
    2 'G78- Cath.'
    3 'G78+ N.Cath.'
    4 'G78- N.Cath.'.
* G79 (new version).
DO IF (ANY(G79, 1, 2) AND ANY(Religion_Group, 1, 2)).
COMPUTE G79_1 = 1*((G79 = 1) AND (Religion_Group = 1)) + 2*((G79 = 2) AND (Religion_Group = 1))
                             + 3*((G79 = 1) AND (Religion_Group = 2)) + 4*((G79 = 2) AND (Religion_Group = 2)).
END IF.
FORMATS G79_1(F2).
VARIABLE LABELS G79_1 'G79'.
VALUE LABELS G79_1
    1 'G79+ Cath.'
    2 'G79- Cath.'
    3 'G79+ N.Cath.'
    4 'G79- N.Cath.'.
* G80 (new version).
DO IF (ANY(G80, 1, 2) AND ANY(Religion_Group, 1, 2)).
COMPUTE G80_1 = 1*((G80 = 1) AND (Religion_Group = 1)) + 2*((G80 = 2) AND (Religion_Group = 1))
                             + 3*((G80 = 1) AND (Religion_Group = 2)) + 4*((G80 = 2) AND (Religion_Group = 2)).
END IF.
FORMATS G80_1(F2).
VARIABLE LABELS G80_1 'G80'.
VALUE LABELS G80_1
    1 'G80+ Cath.'
    2 'G80- Cath.'
    3 'G80+ N.Cath.'
    4 'G80- N.Cath.'.
* G81 (new version).
DO IF (ANY(G81, 1, 2) AND ANY(Religion_Group, 1, 2)).
COMPUTE G81_1 = 1*((G81 = 1) AND (Religion_Group = 1)) + 2*((G81 = 2) AND (Religion_Group = 1))
                             + 3*((G81 = 1) AND (Religion_Group = 2)) + 4*((G81 = 2) AND (Religion_Group = 2)).
END IF.
FORMATS G81_1(F2).
VARIABLE LABELS G81_1 'G81'.
VALUE LABELS G81_1
    1 'G81+ Cath.'
    2 'G81- Cath.'
    3 'G81+ N.Cath.'
    4 'G81- N.Cath.'.
* G82 (new version).
DO IF (ANY(G82, 1, 2) AND ANY(Religion_Group, 1, 2)).
COMPUTE G82_1 = 1*((G82 = 1) AND (Religion_Group = 1)) + 2*((G82 = 2) AND (Religion_Group = 1))
                             + 3*((G82 = 1) AND (Religion_Group = 2)) + 4*((G82 = 2) AND (Religion_Group = 2)).
END IF.
FORMATS G82_1(F2).
VARIABLE LABELS G82_1 'G82'.
VALUE LABELS G82_1
    1 'G82+ Cath.'
    2 'G82- Cath.'
    3 'G82+ N.Cath.'
    4 'G82- N.Cath.'.
* G83 (new version).
DO IF (ANY(G83, 1, 2) AND ANY(Religion_Group, 1, 2)).
COMPUTE G83_1 = 1*((G83 = 1) AND (Religion_Group = 1)) + 2*((G83 = 2) AND (Religion_Group = 1))
                             + 3*((G83 = 1) AND (Religion_Group = 2)) + 4*((G83 = 2) AND (Religion_Group = 2)).
END IF.
FORMATS G83_1(F2).
VARIABLE LABELS G83_1 'G83'.
VALUE LABELS G83_1
    1 'G83+ Cath.'
    2 'G83- Cath.'
    3 'G83+ N.Cath.'
    4 'G83- N.Cath.'.
EXECUTE.


*************************************************************************************************************************************************.
* STEP 4: Defining new versions for G75 to G83 for the MCA (true/false answers, catholics and non-catholic christians only).
*************************************************************************************************************************************************.
* G75 (new version).
DO IF (~MISSING(G75_1)).
COMPUTE G75_2 = (G75_1 * (Country = 1)) + ((G75_1 + 4) * (Country = 2)).
END IF.
FORMATS G75_2(F2).
VARIABLE LABELS G75_2 'G75'.
VALUE LABELS G75_2
    1 'BC+'
    2 'BC-'
    3 'BNC+'
    4 'BNC-'
    5 'IC+'
    6 'IC-'
    7 'INC+'
    8 'INC-'.
* G76 (new version).
DO IF (~MISSING(G76_1)).
COMPUTE G76_2 = (G76_1 * (Country = 1)) + ((G76_1 + 4) * (Country = 2)).
END IF.
FORMATS G76_2(F2).
VARIABLE LABELS G76_2 'G76'.
VALUE LABELS G76_2
    1 'BC+'
    2 'BC-'
    3 'BNC+'
    4 'BNC-'
    5 'IC+'
    6 'IC-'
    7 'INC+'
    8 'INC-'.
* G77 (new version).
DO IF (~MISSING(G77_1)).
COMPUTE G77_2 = (G77_1 * (Country = 1)) + ((G77_1 + 4) * (Country = 2)).
END IF.
FORMATS G77_2(F2).
VARIABLE LABELS G77_2 'G77'.
VALUE LABELS G77_2
    1 'BC+'
    2 'BC-'
    3 'BNC+'
    4 'BNC-'
    5 'IC+'
    6 'IC-'
    7 'INC+'
    8 'INC-'.
* G78 (new version).
DO IF (~MISSING(G78_1)).
COMPUTE G78_2 = (G78_1 * (Country = 1)) + ((G78_1 + 4) * (Country = 2)).
END IF.
FORMATS G78_2(F2).
VARIABLE LABELS G78_2 'G78'.
VALUE LABELS G78_2
    1 'BC+'
    2 'BC-'
    3 'BNC+'
    4 'BNC-'
    5 'IC+'
    6 'IC-'
    7 'INC+'
    8 'INC-'.
* G79 (new version).
DO IF (~MISSING(G79_1)).
COMPUTE G79_2 = (G79_1 * (Country = 1)) + ((G79_1 + 4) * (Country = 2)).
END IF.
FORMATS G79_2(F2).
VARIABLE LABELS G79_2 'G79'.
VALUE LABELS G79_2
    1 'BC+'
    2 'BC-'
    3 'BNC+'
    4 'BNC-'
    5 'IC+'
    6 'IC-'
    7 'INC+'
    8 'INC-'.
* G80 (new version).
DO IF (~MISSING(G80_1)).
COMPUTE G80_2 = (G80_1 * (Country = 1)) + ((G80_1 + 4) * (Country = 2)).
END IF.
FORMATS G80_2(F2).
VARIABLE LABELS G80_2 'G80'.
VALUE LABELS G80_2
    1 'BC+'
    2 'BC-'
    3 'BNC+'
    4 'BNC-'
    5 'IC+'
    6 'IC-'
    7 'INC+'
    8 'INC-'.
* G81 (new version).
DO IF (~MISSING(G81_1)).
COMPUTE G81_2 = (G81_1 * (Country = 1)) + ((G81_1 + 4) * (Country = 2)).
END IF.
FORMATS G81_2(F2).
VARIABLE LABELS G81_2 'G81'.
VALUE LABELS G81_2
    1 'BC+'
    2 'BC-'
    3 'BNC+'
    4 'BNC-'
    5 'IC+'
    6 'IC-'
    7 'INC+'
    8 'INC-'.
* G82 (new version).
DO IF (~MISSING(G82_1)).
COMPUTE G82_2 = (G82_1 * (Country = 1)) + ((G82_1 + 4) * (Country = 2)).
END IF.
FORMATS G82_2(F2).
VARIABLE LABELS G82_2 'G82'.
VALUE LABELS G82_2
    1 'BC+'
    2 'BC-'
    3 'BNC+'
    4 'BNC-'
    5 'IC+'
    6 'IC-'
    7 'INC+'
    8 'INC-'.
* G83 (new version).
DO IF (~MISSING(G83_1)).
COMPUTE G83_2 = (G83_1 * (Country = 1)) + ((G83_1 + 4) * (Country = 2)).
END IF.
FORMATS G83_2(F2).
VARIABLE LABELS G83_2 'G83'.
VALUE LABELS G83_2
    1 'BC+'
    2 'BC-'
    3 'BNC+'
    4 'BNC-'
    5 'IC+'
    6 'IC-'
    7 'INC+'
    8 'INC-'.
EXECUTE.

***************************************************************************************************************************************************.
* STEP 5: Computing the MCA case identification variable (true/false answers, catholics and non-catholic christians only).
***************************************************************************************************************************************************.
DO IF ANY(Religion_Group, 1, 2).
COMPUTE Selection = 0.
END IF.
EXECUTE.
IF ANY(Religion_Group, 1, 2) AND (MISSING(G75_2) = 1 OR MISSING(G76_2) = 1 OR MISSING(G77_2) = 1
    OR MISSING(G79_2) = 1 OR MISSING(G80_2) = 1 OR MISSING(G81_2) = 1 OR MISSING(G83_2) = 1) Selection = 1.
EXECUTE.
IF  ANY(Religion_Group, 1, 2) AND (MISSING(G75_2) = 1 AND MISSING(G76_2) = 1 AND MISSING(G77_2) = 1
    AND MISSING(G79_2) = 1 AND MISSING(G80_2) = 1 AND MISSING(G81_2) = 1 AND MISSING(G83_2) = 1) Selection = 2.
EXECUTE.

FORMATS Selection(F1).
VARIABLE LABELS Selection 'Case Identification for MCA'.
VALUE LABELS Selection
    0 'Active valid cases'
    1 'Active cases with missing values'
    2 'Complementary cases'.



