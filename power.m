[num,data,text] = xlsread('input4');
display(num);
pvpower = num(:,3);
hour = num(:,1);
load = num(:,2);
gprice = num(:,4);

a = ones(24);
sigma = tril(a);

s1.name = 'hour';
s1.val = hour;
s1.dim = 1;
s1.form = 'full';

s2.name = 'load';
s2.val = load;
s2.dim = 1;
s2.form = 'full';

s3.name = 'pvpower';
s3.val = pvpower;
s3.dim = 1;
s3.form = 'full';

s4.name = 'gprice';
s4.val = gprice;
s4.form = 'full';
s4.dim = 1;

s5.name = 'sigma';
s5.val = sigma;
s5.form = 'full';
s5.dim = 2;

gamso.show='normal';

gams('power',s1,s2,s3,s4,s5);



