We have attached two Word documents, Report.doc is the report of the project and Procedure.doc contains the complete working of the system.  
There are 4 input files. We have already provided the outputs for each input in different excel files.
To manually check the output for any input, follow the following instructions.

1) Open the power.m file

2)Suppose we want to check for the file input3. Change the line number 1 in power.m with the file name of the input.

3)Run the power.m file. Ignore all the warning.
Now, matdata.gdx and matdata.gms files are created within the same directory.
Please note the following step
4)Open matdata.gms. Check whether the data looks in this form

parameter
hour
load
pvpower
gprice
sigma;

$gdxin matdata.gdx
$loadR hour
$loadR load
$loadR pvpower
$loadR gprice
$loadR sigma
$gdxin

If the first 6 lines are missing, copy them from above and paste them in the matdata.gms file and make the code look like above. Save the file.

5)Open power.gms file and run the file.
Automatically, another gdx file is created named solutionpower.gdx which contains the solutions.

6) Open solution.m
Note: Close excel files which are open to go to the next step.

7) To print the output in a desired excel file, change the name of the excel file in the line 17. As of now, lets name it as output3
An excel file is created in the same directory with the name output3.
8) Run the code.Ignore the warnings

8)Open the excel to get the values of pgrid in column 1 and the netprice in column 2.
 