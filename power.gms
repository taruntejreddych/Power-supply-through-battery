$set matout "'solutionpower.gdx',pgrid,netprice";


set
j /1*24/
i /1*24/;
parameter
hour(j)/1*24 0/
load(j)/1*24 0/
pvpower(j)/1*24 0/
gprice(j)/1*24 0/
sigma(i,j)/1*24.1*24 0/;

$if exist matdata.gms $include matdata.gms

parameters
pcmax 'maximuum charging rate' /200/
maxstorage 'maximum storage value' /1800/
minstorage 'minimum storage value' /300/
chargeff  'charging efficiency'/0.95/
dischargeff 'discharging efficiency' /0.85/
einitial 'initial storage value' /700/
one(j) /1*24 1/;

variables

pgrid(j) 'power from grid'
pch(j)   'power used in charging battery'
pdh(j)   'power used in discharging battery'
eh(i)    'energy in battery at end of i hour'
netprice;
binary variable
uch(j);

equations
eq1(j)
eq2(j)
eq3(j)
eq4(j)
eq5(j)
eq6(i)
eq7(i)
eq8(i)
eq9
eq10;

eq1(j).. load(j)+ pch(j) =e= pdh(j) + pvpower(j) + pgrid(j);
eq2(j).. 0=l= pch(j) ;
eq3(j).. pch(j) =l= uch(j)*pcmax;
eq4(j).. 0=l= pdh(j);
eq5(j).. pdh(j) =l=(one(j)-uch(j))*pcmax;
eq6(i).. eh(i) =e= einitial +  sum(j,sigma(i,j)*(chargeff*pch(j) - pdh(j)/dischargeff));
eq7(i).. eh(i)=g= minstorage;
eq8(i)..eh(i)=l=maxstorage;
eq9..   eh('24')=e= einitial ;
eq10.. netprice=e= sum(j,gprice(j)*pgrid(j));

model
power / eq1
eq2
eq3
eq4
eq5
eq6
eq7
eq8
eq9
eq10/;


solve power minimizing netprice using MIP;

execute_unload %matout%;









