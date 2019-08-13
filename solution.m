y.name='netprice';
y.form='full';
y.compress=false;
level=rgdx('solutionpower',y);
netprice = level.val;         
display (netprice);


z.name='pgrid';
z.form='full';
z.compress=false;
level1=rgdx('solutionpower',z);
pgrid = level1.val;         
display (pgrid);


filename = 'output4.xlsx';
xlswrite(filename,pgrid,'Sheet1','A2');
xlswrite(filename,netprice,'Sheet1','B2');




