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


SortedbyTotal = sortrows(ds,5);


interval = 40/5;

%%assigning grades using Equal frequency binning 

for i =1:40
    if(i>1)
        if(SortedbyTotal.TotalScore(i)==SortedbyTotal.TotalScore(i-1))
            SortedbyTotal.EFreqgrade(i)=SortedbyTotal.EFreqgrade(i-1);
                i=i+1;
        end;
    end;
    
    if((i <= interval) )
        SortedbyTotal.EFreqgrade(i)='F';   
     elseif( (i>interval && i<=2*interval))
            SortedbyTotal.EFreqgrade(i)='D';
     elseif ( (i>2*interval && i<=3*interval))
           SortedbyTotal.EFreqgrade(i)='C';
     elseif((i>3*interval && i<=4*interval))
          SortedbyTotal.EFreqgrade(i)='B';
     elseif ( i>4*interval && i<=5*interval)
           SortedbyTotal.EFreqgrade(i)='A';
    end;
end; 

AFreqcount=0;
BFreqcount=0;
CFreqcount=0;
DFreqcount=0;
FFreqcount=0;

for i =1:40
    if(SortedbyTotal.EFreqgrade(i)=='F')
        FFreqcount = FFreqcount+1;
    elseif(SortedbyTotal.EFreqgrade(i)=='D')
        DFreqcount = DFreqcount+1;
    elseif(SortedbyTotal.EFreqgrade(i)=='C')
        CFreqcount = CFreqcount+1;
    elseif(SortedbyTotal.EFreqgrade(i)=='B')
        BFreqcount = BFreqcount+1;
    elseif(SortedbyTotal.EFreqgrade(i)=='A')
        AFreqcount = AFreqcount+1;
    end
    
end 

fprintf('no.of students assigned A grade through Equal width binning %d \n',AFreqcount);
fprintf('no.of students assigned B grade through Equal width binning %d \n',BFreqcount);
fprintf('no.of students assigned C grade through Equal width binning %d \n',CFreqcount);
fprintf('no.of students assigned D grade through Equal width binning %d \n',DFreqcount);
fprintf('no.of students assigned F grade through Equal width binning %d \n',FFreqcount);



%printing the student ids who are happy with Equal width binning 

fprintf('\n following student ids are happy with eqaul width binning partitioning ');

for i = 1:40
                if(SortedbyTotal.equal_width_grade(i) < SortedbyTotal.EFreqgrade(i))
                   fprintf('\n student id %d',SortedbyTotal.StudentId(i));
                end
end 

fprintf('\n following student ids are happy with equal frequency  partitioning ');
for i = 1:40
                if(SortedbyTotal.EFreqgrade(i) < SortedbyTotal.equal_width_grade(i))
                   fprintf(' \n student id : %d',SortedbyTotal.StudentId(i));
                end
end 

                
        fprintf('\n Following student ids grades changed when method of binning changed \n '); 
for i=1:40
       if (SortedbyTotal.equal_width_grade(i)== SortedbyTotal.EFreqgrade(i))
          % do nothing
       else 
           fprintf('student ids whose grades changed %d \n',SortedbyTotal.StudentId(i));
       end
end
    

SortedbyTotal.Phys_zscore = zscore(SortedbyTotal.Phys);
SortedbyTotal.Maths_zscore = zscore(SortedbyTotal.Maths);
SortedbyTotal.Sum_of_zscores = SortedbyTotal.Phys_zscore+SortedbyTotal.Maths_zscore;

sortByZtotal = sortrows(SortedbyTotal,10);

for i=1:40
   if((i <= 8) )
        sortByZtotal.equal_freq_grade_Zscore(i)='F';   
     elseif( (i>8 && i<=16))
            sortByZtotal.equal_freq_grade_Zscore(i)='D';
     elseif ( (i>16 && i<=24))
           sortByZtotal.equal_freq_grade_Zscore(i)='C';
     elseif( (i>24 && i<=32))
          sortByZtotal.equal_freq_grade_Zscore(i)='B';
     elseif ( i>32 && i<=40)
           sortByZtotal.equal_freq_grade_Zscore(i)='A';
   end 
end

sortByZtotal_Sid = sortrows(sortByZtotal,1);

export(sortByZtotal_Sid,'xlsfile','solution4.xls');




