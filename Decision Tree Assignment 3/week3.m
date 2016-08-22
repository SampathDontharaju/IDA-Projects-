
%%%%1st solution %%%%

csvdata = xlsread('D:\Assignments UC sem1\IDA\Assignment 3\breast-cancer-wisconsin.csv');
week3_data = knnimpute(csvdata);

%%%%2nd solution %%%
i=randperm(699);
Trainingdata = week3_data(i(1:500),:);
Testdata = week3_data(i(501:end),:);

%%%%3rd solution %%%%%
Features = Trainingdata(:,2:10);
Class_Labels = Trainingdata(:,11);
AttributeNames={'Clump Thickness','Uniformity of Cell Size','Uniformity of Cell Shape','Marginal Adhesion','Single Epithelial Cell Size','Bare Nuclei','Bland Chromatin','Normal Nucleoli','Mitoses'};
Training_decision_tree = fitctree(Features, Class_Labels,'PredictorNames',AttributeNames,'MinLeafSize',25);
view(Training_decision_tree,'Mode','graph');
num_nodes = Training_decision_tree.NumNodes;

%%%%%%Question 4%%%%%%%%
TestFeatures = Testdata(:,2:10);
TestdataGivenLabels= Testdata(:,11);
TestdataPredictLabels = predict(Training_decision_tree,TestFeatures);

OLabels = TestdataGivenLabels;
PLabels = TestdataPredictLabels;
order = [2,4];
[e,order] = confusionmat(PLabels,OLabels,'order',order);

a=e(1,1);
b=e(1,2);
c=e(2,1);
d=e(2,2);

accuracy=(a+d)/(a+b+c+d);
precision=a/(a+b);
recall = a/(a+c);
f1_score = 2*((precision*recall)/(precision+recall));

fprintf('accuracy for the decision tree : %f \n',accuracy );
fprintf('precision for the decision tree : %f \n',precision );
fprintf('recall for the decision tree : %f \n',recall );
fprintf('F1 score for the decision tree : %f \n',f1_score );

%%%%%5th solution %%%%%
SVM_model = fitcsvm(Features,Class_Labels,'Standardize',true,'KernelFunction','RBF',...
'KernelScale','auto');
PredictedLabels_SVM = predict(SVM_model,TestFeatures);
order = [2,4];
[k,order] = confusionmat(PredictedLabels_SVM,TestdataGivenLabels,'order',order);
%view(SVM_model,'Mode','graph');

p =k(1,1);
q =k(1,2);
r =k(2,1);
s = k(2,2);

accuracy_svm = (p+s)/(p+q+r+s);
precision_svm = p/(p+q);
recall_svm = p/(p+r);
f1_score_svm = 2*((precision_svm*recall_svm)/(precision_svm+recall_svm));

fprintf('Accurarcy calculated for svm model %f \n',accuracy_svm);
fprintf('Precision calculated for svm model %f \n',precision_svm);
fprintf('Recall calculated for svm model %f \n',recall_svm);
fprintf(' F1 score calculated for svm model %f \n',f1_score_svm);

%%%7th Solution %%%

MisclassificationRate_Decision_Tree = (b*10)+(c*30);
MisclassificationRate_SVM = (q*10)+(r*30);

fprintf('misclassification_rate for decision tree is %f \n',MisclassificationRate_Decision_Tree);
fprintf('misclassification_rate for SVM model is %f \n',MisclassificationRate_SVM);

%%%% 8th solution %%%%


for i= 1:199

  if(~(TestdataGivenLabels(i)==TestdataPredictLabels(i)))
      %%misclassified_record(i) = Test_set(i);
        j=i; %% saving the first instance of missclassified record in j
        disp('Test_OriginalLabel is')
        disp(TestdataPredictLabels(j))
        disp('Misclassified as')
        disp(TestdataGivenLabels(j))

        break;
   end

end;

fprintf('first instance of missclassified row index is %f \n',j);

m=Trainingdata(:,2:10);
n= (Trainingdata(j,2:10));

[w1,z1]=knnsearch(m,n,'k',1,'distance','euclidean');
disp('One nearest neighbors with their Sample Code number is')
disp(Trainingdata(w1,[1,11]));
disp('Class label assigned with one nearest neighbors is')
if(mode(Trainingdata(w1,11)== 2))
    disp('Benign')
elseif(mode(Trainingdata(w1,11)== 4))
    disp('Malignant')
end



[w3,z3]=knnsearch(m,n,'k',3,'distance','euclidean');
disp('Three nearest neighbors with their Sample Code numbers are')
disp(Trainingdata(w3,[1,11]));
disp('Mode of the class labels is')
disp(mode(Trainingdata(w3,11)))
disp('Class label assigned with three nearest neighbors is')
if(mode(Trainingdata(w3,11)== 2))
    disp('Benign')
elseif(mode(Trainingdata(w3,11)== 4))
    disp('Malignant')
end



[w5,z5]=knnsearch(m,n,'k',5,'distance','euclidean');
disp('Five nearest neighbors with their Sample Code numbers are')
disp(Trainingdata(w5,[1,11]));
disp('Mode of the class labels is')
disp(mode(Trainingdata(w5,11)))
disp('Class label assigned with five nearest neighbors is')
if(mode(Trainingdata(w5,11)== 2))
    disp('Benign')
elseif(mode(Trainingdata(w5,11)== 4))
    disp('Malignant')
end


[w7,z7]=knnsearch(m,n,'k',7,'distance','euclidean');

disp('Seven nearest neighbors with their Sample Code numbers are')
disp(Trainingdata(w7,[1,11]));
disp('Mode of the class labels is')
disp(mode(Trainingdata(w7,11)))
disp('Class label assigned with Seven nearest neighbors is')
if(mode(Trainingdata(w7,11)== 2))
    disp('Benign')
elseif(mode(Trainingdata(w7,11)== 4))
    disp('Malignant')
end




