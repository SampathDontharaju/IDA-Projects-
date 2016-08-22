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

%%5th solution starts here 

 for i = 1:40
    
     if(sortByZtotal_Sid.equal_freq_grade_Zscore(i) < sortByZtotal_Sid.EFreqgrade(i))
          
         fprintf(' \n students who are happy with z equal freq binning %d \n', sortByZtotal_Sid.StudentId(i) );
     end                     
end 
        for i = 1:40
          if (sortByZtotal_Sid.EFreqgrade(i) < sortByZtotal_Sid.equal_freq_grade_Zscore(i))
                 fprintf(' \n students who are happy with normal equal freq binning %d \n', sortByZtotal_Sid.StudentId(i) );
          end 
        end
        
        
        
        
        %%% 7th solution logic starts here 
        
        x = -0.3;
        y =0.3;
        
  for i=1:40
      if(sortByZtotal_Sid.Phys_zscore(i) < x)
          sortByZtotal_Sid.Phys_zscore_label(i) = 'L';
      elseif(sortByZtotal_Sid.Phys_zscore(i) >= x && sortByZtotal_Sid.Phys_zscore(i) <= y)
          sortByZtotal_Sid.Phys_zscore_label(i) = 'M';
      elseif(sortByZtotal_Sid.Phys_zscore(i) > y)
          sortByZtotal_Sid.Phys_zscore_label(i) = 'H';
      end
  end 
  
  for i = 1:40
      if(sortByZtotal_Sid.Maths_zscore(i) < x)
          sortByZtotal_Sid.Maths_zscore_label(i) = 'L';
      elseif(sortByZtotal_Sid.Maths_zscore(i) >= x && sortByZtotal_Sid.Maths_zscore(i) <= y)
          sortByZtotal_Sid.Maths_zscore_label(i) = 'M';
      elseif(sortByZtotal_Sid.Maths_zscore(i) > y)
          sortByZtotal_Sid.Maths_zscore_label(i) = 'H';
      end
  end
  
   
  phy_Lcount=0;
  phy_Mcount=0;
  phy_Hcount=0;
  math_Lcount=0;
  math_Mcount=0;
  math_Hcount=0;

  for j=1:40
  if(sortByZtotal_Sid.Maths_zscore_label(j) == 'H')
      math_Hcount=math_Hcount+1;
  elseif(sortByZtotal_Sid.Maths_zscore_label(j) == 'M')
      math_Mcount=math_Mcount+1;
  elseif(sortByZtotal_Sid.Maths_zscore_label(j) == 'L')
      math_Lcount=math_Lcount+1;
  end
  
  end

  
for j=1:40
  if(sortByZtotal_Sid.Phys_zscore_label(j) == 'H')
      phy_Hcount=phy_Hcount+1;
  elseif(sortByZtotal_Sid.Phys_zscore_label(j) == 'M')
      phy_Mcount=phy_Mcount+1;
  elseif(sortByZtotal_Sid.Phys_zscore_label(j) == 'L')
      phy_Lcount=phy_Lcount+1;
  end
end


% Weighted Entropy Maths = (|D1|/|D|).Entropy(D1) + (|D2|/|D|).Entropy(D2)+(|D3|/|D|).Entropy(D3)

D = math_Hcount+math_Mcount+math_Lcount;

Entropy_MHigh= -(6/13*log2 (6/13) + 7/13* log2(7/13) );
Entropy_MMedium = -(5/10* log2(5/10)+ 5/10* log2(5/10) );
Entropy_MLow =  -(13/17*log2(13/17)+(4/17)*log2(4/17));

WeightedEntropy_Maths =13/D*Entropy_MHigh+17/D*Entropy_MLow+10/D*Entropy_MMedium;

% Info gain for Physics = (|D1|/|D|).Entropy(D1) + (|D2|/|D|).Entropy(D2)+(|D3|/|D|).Entropy(D3)

D = phy_Lcount+phy_Mcount+phy_Hcount;

Entropy_PHigh = -( 5/13*log2(5/11)+4/13*log2(4/13)+4/13*log2(4/13));
Entropy_PMedium = -(1/11*log2(1/11)+6/14*log2(6/11)+4/11*log2(4/11));
Entropy_PLow = -(2/16*log2(2/16)+ 10/16*log2(10/16 )+4/16*log2(4/16));

WeightedEntropy_Physics = 16/D*Entropy_PLow +11/D*Entropy_PMedium+13/D*Entropy_PHigh;

  
  
  