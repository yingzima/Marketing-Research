/*Classification Tree*/
ods graphics on;
proc hpsplit data=trend plots=all;
class pial5a pial5b party educ2;
model pial5a(event='Hard')=age pial5b party educ2 books1;
run;
ods graphics off;

/*Logistic Regression*/
ods graphics on;
proc logistic data=trend plots(unpack)=(roc);
class pial5a pial5b pial5d party educ2 device1d;
model pial5a(event='Hard')=age party educ2 marital pial5b pial5d books1 device1d hh1 
/ lackfit ctable selection=backward;
run;
ods graphics off;
