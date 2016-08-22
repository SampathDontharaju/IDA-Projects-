
%%%%  1st solution
week2_data = xlsread('D:\Assignments UC sem1\IDA\Assignment 2\magic04.xlsx');
index=randperm(19020);
Train_data=week2_data(index(1:13020),:);
val_data = week2_data(index(13021:16020),:);
test_data = week2_data(index(16021:end),:);

%%% 2nd solution 

Features = Train_data(:,1:10);
ClassLabels = Train_data(:,11);
 
%%% 3rd solution 
decTreeOne = fitctree(Features,ClassLabels,'MinLeafSize',1200);
view(decTreeOne,'Mode','graph');
numOfNodes = decTreeOne.NumNodes;
fprintf('number of nodes %d', numOfNodes);

%%4th solution 
%%%%%%%Solution 4%%%%%%
TestFeatures = test_data(:,1:10);
PredictLabels = predict(decTreeOne,TestFeatures);
original_labels = test_data(:,11);

OLabels = original_labels;
PLabels = PredictLabels;
order = [1,0];
[c,order] = confusionmat(PLabels,OLabels,'order',order);
count=0;

e=c(1,1);
f=c(1,2);
g=c(2,1);
h=c(2,2);
accuracy_1200 = (e+h)/(e+f+g+h);
precision = e/(e+f);
recall = e/(e+g);


%%%%solution 5%%%%%%%

%% decision tree for 1000 leaf nodes dtr_Training_1000= fitctree(Features,ClassLabels,'MinLeafSize',1000);
dtr_Training_1000= fitctree(Features,ClassLabels,'MinLeafSize',1000);
Numnodes_Training_1000=dtr_Training_1000.NumNodes;
view(dtr_Training_1000,'Mode','graph');
PredictLabels_Training_1000=predict(dtr_Training_1000,Features);
order = [1,0];
[td1000,order] = confusionmat(PredictLabels_Training_1000,ClassLabels,'order',order);
p1=td1000(1,1);
q1=td1000(1,2);
r1=td1000(2,1);
s1=td1000(2,2);
accuracy_Training_1000 = (p1+s1)/(p1+q1+r1+s1);
precision_Training_1000 = p1/(p1+q1);
recall_Training_1000 = p1/(p1+r1);
% tp_count=0;
% tn_count=0;
% fp_count=0;
% fn_count=0;
% 
% %%%% solution  5 C %%%%%%
% 
validation_features = val_data(:,1:10);
validation_ClassLabels = val_data(:,11);

Predicted_validation1000 = predict(dtr_Training_1000,validation_features);
order = [1,0];
 [v,order] = confusionmat(Predicted_validation1000,validation_ClassLabels,'order',order);
 pv= v(1,1);
 qv= v(1,2);
 rv= v(2,1);
 sv= v(2,2);
 
accuracy_val_data_1000= (pv+sv)/(pv+qv+rv+sv);
precision_val_data_1000= pv/(pv+qv); 
recall_val_data_1000= pv/(pv+rv);
% 
% %%%%%% 6th solution %%%%
% 
train_data_decisiontree_20 = fitctree(Features,ClassLabels,'MinLeafSize',20);
view(train_data_decisiontree_20,'Mode','graph');
Train_data_Predicted_labels_20 = predict(train_data_decisiontree_20,Features);
order = [1,0];
[td_20,order] = confusionmat(Train_data_Predicted_labels_20,ClassLabels,'order',order);

 p_t20 = td_20(1,1);
 q_t20 = td_20(1,2);
 r_t20 = td_20(2,1);
 s_t20 = td_20(2,2);

 accuracy_train_20= (p_t20+s_t20)/(p_t20+q_t20+r_t20+s_t20);
 precision_train_20 =p_t20/(p_t20+q_t20);
 recall_train_20 = p_t20/(p_t20+r_t20);

% %%%% 6 th solution part b with validationdata 

% % view(train_data_decisiontree_20,'Mode','graph');
 val_dat_features = val_data(:,1:10);
 val_dat_ClassLabels = val_data(:,11);

 Predicted_validation_labels_20 = predict(train_data_decisiontree_20,val_dat_features);
 order = [1,0];
 [vd_20,order] = confusionmat(Predicted_validation_labels_20,val_dat_ClassLabels,'order',order);

 p_val20 = vd_20(1,1);
 q_val20 = vd_20(1,2);
 r_val20 = vd_20(2,1);
 s_val20 = vd_20(2,2);
 
 accuracy_val_20= (p_val20+s_val20)/(p_val20+q_val20+r_val20+s_val20);
 precision_val_20 =p_val20/(p_val20+q_val20);
 recall_val_20 = p_val20/(p_val20+r_val20);
% 
%%%%%7th solution %%%%%%

Training_750= fitctree(Features,ClassLabels,'MinLeafSize',750);
Numnodes_Training_750=Training_750.NumNodes;
%%%view(dtr_Training_750,'Mode','graph');
PredictLabels_Training750=predict(Training_750,Features);
order = [1,0];
[t750,order] = confusionmat(PredictLabels_Training750,ClassLabels,'order',order);
p5=t750(1,1);
q5=t750(1,2);
r5=t750(2,1);
s5=t750(2,2);
accuracy_Training750 = (p5+s5)/(p5+q5+r5+s5);

%%% validation 750 records %%%%

PredictLabels_validation750 =predict(Training_750,val_dat_features);
order =[1,0];

[v750,order] = confusionmat(PredictLabels_validation750,val_dat_ClassLabels,'order',order);
pv5=t750(1,1);
qv5=t750(1,2);
rv5=t750(2,1);
sv5=t750(2,2);
accuracy_validation_750 = (pv5+sv5)/(pv5+qv5+rv5+sv5);


%%% training 500 reocordss %%

Training_500= fitctree(Features,ClassLabels,'MinLeafSize',500);
Numnodes_Training_500=Training_500.NumNodes;
%%%view(dtr_Training_750,'Mode','graph');
PredictLabels_Training500=predict(Training_500,Features);
order = [1,0];
[t500,order] = confusionmat(PredictLabels_Training500,ClassLabels,'order',order);
p6=t500(1,1);
q6=t500(1,2);
r6=t500(2,1);
s6=t500(2,2);
accuracy_Training500 = (p6+s6)/(p6+q6+r6+s6);

%%%% validation 500 records %%%% 
PredictLabels_validation500 =predict(Training_500,val_dat_features);
order =[1,0];

[v500,order] = confusionmat(PredictLabels_validation500,val_dat_ClassLabels,'order',order);
pv6=v500(1,1);
qv6=v500(1,2);
rv6=v500(2,1);
sv6=v500(2,2);
accuracy_validation_500 = (pv6+sv6)/(pv6+qv6+rv6+sv6);





%%% training 250 reocordss %%

Training_250= fitctree(Features,ClassLabels,'MinLeafSize',250);
Numnodes_Training_250=Training_250.NumNodes;
%%%view(Training_250,'Mode','graph');
PredictLabels_Training250=predict(Training_250,Features);
order = [1,0];
[t250,order] = confusionmat(PredictLabels_Training250,ClassLabels,'order',order);
p7=t250(1,1);
q7=t250(1,2);
r7=t250(2,1);
s7=t250(2,2);
accuracy_Training250 = (p7+s7)/(p7+q7+r7+s7);

%%%% validation 250 records %%%% 
PredictLabels_validation250 =predict(Training_250,val_dat_features);
order =[1,0];

[v250,order] = confusionmat(PredictLabels_validation250,val_dat_ClassLabels,'order',order);
pv7=v250(1,1);
qv7=v250(1,2);
rv7=v250(2,1);
sv7=v250(2,2);
accuracy_validation_250 = (pv7+sv7)/(pv7+qv7+rv7+sv7);


%%%%training 125 records %%%%


Training_125= fitctree(Features,ClassLabels,'MinLeafSize',125);
Numnodes_Training_125=Training_125.NumNodes;
%%%view(Training_250,'Mode','graph');
PredictLabels_Training125=predict(Training_125,Features);
order = [1,0];
[t125,order] = confusionmat(PredictLabels_Training125,ClassLabels,'order',order);
p8=t125(1,1);
q8=t125(1,2);
r8=t125(2,1);
s8=t125(2,2);
accuracy_Training125 = (p8+s8)/(p8+q8+r8+s8);

%%%% validation 125 records %%%% 
PredictLabels_validation125 =predict(Training_125,val_dat_features);
order =[1,0];

[v125,order] = confusionmat(PredictLabels_validation125,val_dat_ClassLabels,'order',order);
pv8=v125(1,1);
qv8=v125(1,2);
rv8=v125(2,1);
sv8=v125(2,2);
accuracy_validation_125 = (pv8+sv8)/(pv8+qv8+rv8+sv8);


%%%%training 100 records %%%%

Training_100= fitctree(Features,ClassLabels,'MinLeafSize',100);
Numnodes_Training_100=Training_100.NumNodes;
%%%view(Training_100,'Mode','graph');
PredictLabels_Training100=predict(Training_100,Features);
order = [1,0];
[t100,order] = confusionmat(PredictLabels_Training100,ClassLabels,'order',order);
p9=t100(1,1);
q9=t100(1,2);
r9=t100(2,1);
s9=t100(2,2);
accuracy_Training100 = (p9+s9)/(p9+q9+r9+s9);

%%%% validation 100 records %%%% 
PredictLabels_validation100 =predict(Training_100,val_dat_features);
order =[1,0];

[v100,order] = confusionmat(PredictLabels_validation500,val_dat_ClassLabels,'order',order);
pv9=v100(1,1);
qv9=v100(1,2);
rv9=v100(2,1);
sv9=v100(2,2);
accuracy_validation_100= (pv9+sv9)/(pv9+qv9+rv9+sv9);

%%%%training 50 records %%%%

Training_50= fitctree(Features,ClassLabels,'MinLeafSize',50);
Numnodes_Training_50=Training_50.NumNodes;
%%%view(Training_50,'Mode','graph');
PredictLabels_Training50=predict(Training_50,Features);
order = [1,0];
[t50,order] = confusionmat(PredictLabels_Training50,ClassLabels,'order',order);
p10=t50(1,1);
q10=t50(1,2);
r10=t50(2,1);
s10=t50(2,2);
accuracy_Training50 = (p10+s10)/(p10+q10+r10+s10);

%%%% validation 50 records %%%% 
PredictLabels_validation50 =predict(Training_50,val_dat_features);
order =[1,0];

[v50,order] = confusionmat(PredictLabels_validation50,val_dat_ClassLabels,'order',order);
pv10=v50(1,1);
qv10=v50(1,2);
rv10=v50(2,1);
sv10=v50(2,2);
accuracy_validation_50= (pv10+sv10)/(pv10+qv10+rv10+sv10);



%%%%training 20 records %%%%

Training_20= fitctree(Features,ClassLabels,'MinLeafSize',20);
Numnodes_Training_20=Training_20.NumNodes;
%%%view(Training_50,'Mode','graph');
PredictLabels_Training20=predict(Training_20,Features);
order = [1,0];
[t20,order] = confusionmat(PredictLabels_Training20,ClassLabels,'order',order);
p11=t20(1,1);
q11=t20(1,2);
r11=t20(2,1);
s11=t20(2,2);
accuracy_Training20 = (p11+s11)/(p11+q11+r11+s11);

%%%% validation 20 records %%%% 
PredictLabels_validation20 =predict(Training_20,val_dat_features);
order =[1,0];

[v20,order] = confusionmat(PredictLabels_validation20,val_dat_ClassLabels,'order',order);
pv11=v20(1,1);
qv11=v20(1,2);
rv11=v20(2,1);
sv11=v20(2,2);
accuracy_validation_20= (pv11+sv11)/(pv11+qv11+rv11+sv11);


%%%%training 10 records %%%%

Training_10= fitctree(Features,ClassLabels,'MinLeafSize',10);
Numnodes_Training_10=Training_10.NumNodes;
%%%view(Training_50,'Mode','graph');
PredictLabels_Training20=predict(Training_10,Features);
order = [1,0];
[t10,order] = confusionmat(PredictLabels_Training50,ClassLabels,'order',order);
p12=t10(1,1);
q12=t10(1,2);
r12=t10(2,1);
s12=t10(2,2);
accuracy_Training10 = (p12+s12)/(p12+q12+r12+s12);

%%%% validation 10 records %%%% 
PredictLabels_validation10 =predict(Training_10,val_dat_features);
order =[1,0];
[v10,order] = confusionmat(PredictLabels_validation20,val_dat_ClassLabels,'order',order);
pv12=v10(1,1);
qv12=v10(1,2);
rv12=v10(2,1);
sv12=v10(2,2);
accuracy_validation_10= (pv12+sv12)/(pv12+qv12+rv12+sv12);



%%%%training 5 records %%%%

Training_5= fitctree(Features,ClassLabels,'MinLeafSize',5);
Numnodes_Training_5=Training_5.NumNodes;
%%%view(Training_50,'Mode','graph');
PredictLabels_Training5=predict(Training_5,Features);
order = [1,0];
[t5,order] = confusionmat(PredictLabels_Training5,ClassLabels,'order',order);
p13=t5(1,1);
q13=t5(1,2);
r13=t5(2,1);
s13=t5(2,2);
accuracy_Training5 = (p13+s13)/(p13+q13+r13+s13);

%%%% validation 5 records %%%% 
PredictLabels_validation5 =predict(Training_5,val_dat_features);
order =[1,0];

[v5,order] = confusionmat(PredictLabels_validation5,val_dat_ClassLabels,'order',order);
pv13=v5(1,1);
qv13=v5(1,2);
rv13=v5(2,1);
sv13=v5(2,2);
accuracy_validation_5= (pv13+sv13)/(pv13+qv13+rv13+sv13);


accuracy_Training_array =[accuracy_Training5,accuracy_Training10,accuracy_Training20,accuracy_Training50,accuracy_Training100,accuracy_Training125,accuracy_Training250,accuracy_Training500,accuracy_Training750,accuracy_Training_1000];
accuracy_Validation_array =[accuracy_validation_5,accuracy_validation_10,accuracy_validation_20,accuracy_validation_50,accuracy_validation_100,accuracy_validation_125,accuracy_validation_250,accuracy_validation_500,accuracy_validation_750,accuracy_Training_1000];
NumberOfNodes_array=[Numnodes_Training_5,Numnodes_Training_10,Numnodes_Training_20,Numnodes_Training_50,Numnodes_Training_100,Numnodes_Training_125,Numnodes_Training_250,Numnodes_Training_500,Numnodes_Training_750,Numnodes_Training_1000];
plot(NumberOfNodes_array,accuracy_Training_array,NumberOfNodes_array,accuracy_Validation_array);

plot(NumberOfNodes_array,accuracy_Training_array)
plot(NumberOfNodes_array,accuracy_Validation_array)


%%% 8th solution  %%%

Records_Per_Leaf_nodes = [5,10,20,50,100,125,250,500,750,1000];
figure()
hold all
%Finding the number of records
plot(Records_Per_Leaf_nodes,accuracy_Training_array)
legend('Leaf Nodes','Accuracy');

%Creatinng decision tree for leaf node no less than 20 records
training_data_dtr_20_final_ques = fitctree(Features,ClassLabels,'MinLeafSize',20);
view(training_data_dtr_20_final_ques,'Mode','graph');
noofnodes = training_data_dtr_20_final_ques.NumNodes;
Predicted_labels_20_final_ques = predict(training_data_dtr_20_final_ques,TestFeatures);
order = [1,0];
[mat_ques,order] = confusionmat(Predicted_labels_20_final_ques,original_labels,'order',order);
pf=mat_ques(1,1);
qf=mat_ques(1,2);
rf=mat_ques(2,1);
sf=mat_ques(2,2);
accuracy_final_ques = (pf+sf)/(pf+qf+rf+sf);
precision_final_ques = pf/(pf+qf);
recall_final_ques = pf/(pf+rf);
fprintf('Accuracy for best decision tree :  %f\n Precision for best decision tree : %f \n Recall for best decision tree is: %f ',accuracy_final_ques,precision_final_ques,recall_final_ques);


















