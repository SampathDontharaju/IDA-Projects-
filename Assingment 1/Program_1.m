cd('D:\Assignments UC sem1\IDA\Assingment 1')
ds = dataset('XLSFile', 'DataHW1A.xlsx');
f1 = ds.Phys;
f2 = ds.Maths;
TotalScore = f1+f2;
ds.TotalScore = TotalScore;

 b = max(ds.TotalScore);
 a = min(ds.TotalScore);
 n = 5;
 width = round((b-a)/n,0);

for i = 1:40
    if ((ds.TotalScore(i) >= a) && (ds.TotalScore(i) < a+width))
    ds.equal_width_grade(i) = 'F';
    elseif ((ds.TotalScore(i) >= a+width) && (ds.TotalScore(i) < a+2*width))
            ds.equal_width_grade(i) = 'D';
         
    elseif ((ds.TotalScore(i) >= a+2*width) && (ds.TotalScore(i) < a+3*width))
            ds.equal_width_grade(i) = 'C';
         
    elseif ((ds.TotalScore(i) >= a+3*width) && (ds.TotalScore(i) < a+4*width))
            ds.equal_width_grade(i) = 'B';
         
    elseif ((ds.TotalScore(i) >= a+4*width) && (ds.TotalScore(i) <=b))
            ds.equal_width_grade(i) = 'A';
         
    end
end



Fcount=0;
Dcount=0;
Ccount=0;
Bcount=0;
Acount=0;
for i =1:40
    if(ds.equal_width_grade(i)=='F')
        Fcount = Fcount+1;
    elseif(ds.equal_width_grade(i)=='D')
        Dcount = Dcount+1;
    elseif(ds.equal_width_grade(i)=='C')
        Ccount = Ccount+1;
    elseif(ds.equal_width_grade(i)=='B')
        Bcount = Bcount+1;
    elseif(ds.equal_width_grade(i)=='A')
        Acount = Acount+1;
    end
end 

fprintf('no.of students assigned A grade through Equal width binning %d \n',Acount);
fprintf('no.of students assigned B grade through Equal width binning %d \n',Bcount);
fprintf('no.of students assigned C grade through Equal width binning %d \n',Ccount);
fprintf('no.of students assigned D grade through Equal width binning %d \n',Dcount);
fprintf('no.of students assigned F grade through Equal width binning %d \n',Acount);

export(ds,'xlsfile','solution1.xls');










