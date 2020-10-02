
 MaxAcc=0;  
while MaxAcc~=1
  clc;clearvars -except MaxAcc;
  veriseti=15;% 1=idealVeri, 2=ExclaStar, 3=Fisheriris, 4=KDD, 5=ForestCover, 6=Wine, 7=SplitData, 8=MrData,9=Breast Cancer,10=MRDSMOA, 11=Occupancy 
  plotGraph=0;
if veriseti==1   
     load('IdealData.mat');
    load('IdealDataLabels.mat');
    DatasetName='idealVeri_';
    VeriMiktari=211;              %Üzerinde iþlem yapýlacak veri miktarý
    d=2;                           %Nitelik sayýsý(d=dimension
    data=AllData(1:VeriMiktari,1:d);%Seçilen Veri
    class=ACTUAL(1:VeriMiktari,1);

    buffer=zeros(1,d+4);
    S=[];
    N=3+randi(9);%Min küme oluþturma için gerekli veri sayýsý 50
   
    randomTime=randi([500 10000]);   
    randomTime=randomTime-mod(randomTime,250);
    t=datestr(milliseconds(randomTime),'dd-mm-yyyy HH:MM:SS FFF');

%     t=setTime('00-01-0000 00:00:05 500');%Grafik için 5.5sn, Grafiksiz 200 ms ile split ve merge iþlemleri görünüyor(buffer = 37, 2D için buffer =29) %
    TN=randi([5 30]);   
    TN=TN-mod(TN,5);
    
    r=randi([50 450]);   
    r=r-mod(r,25);
    r=r/100;
    
    r_treshold=randi([50 300]);   
    r_treshold=r_treshold-mod(r_treshold,25);
    r_treshold=r_treshold/100;
    
    
    r_max=randi([r*100+r_treshold*100 300*r_treshold+r*100]);   
    r_max=r_max-mod(r_max,25);
    r_max=r_max/100;
end
if veriseti==2
    dataset=load('DatasetNew.txt');
    DatasetName='ExclaStar_';
    VeriMiktari=755;              %Üzerinde iþlem yapýlacak veri miktarý
    d=2;                           %Nitelik sayýsý(d=dimension
    data=dataset(1:VeriMiktari,2:d+1);%Seçilen Veri
    class=dataset(1:VeriMiktari,4);
    buffer=zeros(1,d+4);
    S=[];
    % %User Defined Variables%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    N=5+randi(15);%Min küme oluþturma için gerekli veri sayýsý 50
   
    randomTime=randi([500 10000]);   
    randomTime=randomTime-mod(randomTime,250);
    t=datestr(milliseconds(randomTime),'dd-mm-yyyy HH:MM:SS FFF');

%     t=setTime('00-01-0000 00:00:05 500');%Grafik için 5.5sn, Grafiksiz 200 ms ile split ve merge iþlemleri görünüyor(buffer = 37, 2D için buffer =29) %
    TN=randi([20 80]);   
    TN=TN-mod(TN,5);
    
    r=randi([100 750]);   
    r=r-mod(r,25);
    r=r/100;
    
    r_treshold=randi([100 300]);   
    r_treshold=r_treshold-mod(r_treshold,25);
    r_treshold=r_treshold/100;
    
    
    r_max=randi([r*100+r_treshold*100 400*r_treshold+r*100]);   
    r_max=r_max-mod(r_max,25);
    r_max=r_max/100;
end
if veriseti==3
    
     load 'fisheriris';
    DatasetName='Fisheriris_';
    VeriMiktari=150;              %Üzerinde iþlem yapýlacak veri miktarý
    d=4;                           %Nitelik sayýsý(d=dimension
    data=meas(1:VeriMiktari,1:d);%Seçilen Veri
   
    class=grp2idx(species);
    class=class(1:VeriMiktari,1);
%     class1=class;
    buffer=zeros(1,d+4);
    S=[];

    N=5+randi(15);%Min küme oluþturma için gerekli veri sayýsý 50
   
    randomTime=randi([10500 25000]);   
    randomTime=randomTime-mod(randomTime,500);
    t=datestr(milliseconds(randomTime),'dd-mm-yyyy HH:MM:SS FFF');

%     t=setTime('00-01-0000 00:00:05 500');%Grafik için 5.5sn, Grafiksiz 200 ms ile split ve merge iþlemleri görünüyor(buffer = 37, 2D için buffer =29) %
    TN=randi([50 90]);   
    TN=TN-mod(TN,5);
    
    r=randi([60 180]);   
    r=r-mod(r,5);
    r=r/100;
    
    r_treshold=randi([25 100]);   
    r_treshold=r_treshold-mod(r_treshold,5);
    r_treshold=r_treshold/100;
    
    
    r_max=randi([10 100]);   
    r_max=r_max-mod(r,5);
    r_max=r_max/100;
    r_max=r_treshold+r+ r_max;
end
if veriseti==4
    % % %%%%%%%Data Selection%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    load('KDD_Sample_Dataset.mat'); 
    DatasetName='KDD_';
    VeriMiktari=50000;%10000;              %Üzerinde iþlem yapýlacak veri miktarý
    d=38;                           %Nitelik sayýsý(d=dimension
    data=dataset(1:VeriMiktari,1:d);%Seçilen Veri
    class=labels(1:VeriMiktari,:);
    
    
    class(class(:,1)==1,1)=111;
    class(class(:,1)==2,1)=112;
    class(class(:,1)==3,1)=113;
    class(class(:,1)==4,1)=114;
    class(class(:,1)==5,1)=115;
    class(class(:,1)==6,1)=116;
    class(class(:,1)==7,1)=117;
    class(class(:,1)==8,1)=118;
    class(class(:,1)==9,1)=119;
    class(class(:,1)==10,1)=120;
    class(class(:,1)==11,1)=121;
    class(class(:,1)==12,1)=122;
    class(class(:,1)==13,1)=123;
    class(class(:,1)==14,1)=124;
    class(class(:,1)==15,1)=125;
    class(class(:,1)==16,1)=126;
    class(class(:,1)==17,1)=127;
    class(class(:,1)==18,1)=128;
    class(class(:,1)==19,1)=129;
    class(class(:,1)==20,1)=130;
    class(class(:,1)==21,1)=131;
    
    
    class1=class;
    class(class(:,1)==122,1)=1;
    class(class(:,1)==129,1)=2;
    class(class(:,1)==131,1)=3;
    class(class(:,1)==116,1)=4;
    class(class(:,1)==121,1)=5;
    
    class1(class1(:,1)==122,1)=1;
    class1(class1(:,1)==129,1)=2;
    class1(class1(:,1)==131,1)=3;
    class1(class1(:,1)==111,1)=4;
    class1(class1(:,1)==116,1)=5;
    class1(class1(:,1)==121,1)=6;
    
    buffer=zeros(1,d+4);
    S=[];
    N=85;%30 + floor(randi(20)/5)*5%N=80;%Min küme oluþturma için gerekli veri sayýsý 50 20
    TN=120;
    
    randomTime=randi([5000 25000]);   
    randomTime=randomTime-mod(randomTime,250);
    t=datestr(milliseconds(randomTime),'dd-mm-yyyy HH:MM:SS FFF');
    
    r=1.15;%0.9+ (1.1-0.9).*rand(1,1)%r=3;%0.80;%Küme yarýçapý 0.8 ve 1 arasý 1.25
    r_treshold=3;%0.75+ (2.1-0.75).*rand(1,1)%r_treshold=3.5;%0.00001*r;%r attýrma eþik deðeri0.75*r 0.75*r
    r_max=6.3;%r+r_treshold+(6-r-r_treshold).*rand(1,1)%r_max=6.5;%1*r;%%%%%%%4*r 4.55*r
elseif veriseti==5
 load('KDD_Sample_Dataset.mat');
 DatasetName='KDD_';
    VeriMiktari=50000;%10000;              %Üzerinde iþlem yapýlacak veri miktarý
    d=38;                           %Nitelik sayýsý(d=dimension
    data=dataset(1:VeriMiktari,1:d);%Seçilen Veri
    class=labels(1:VeriMiktari,:);
%     data(data==0)=0.00000001;
    
    class(class(:,1)==1,1)=111;
    class(class(:,1)==2,1)=112;
    class(class(:,1)==3,1)=113;
    class(class(:,1)==4,1)=114;
    class(class(:,1)==5,1)=115;
    class(class(:,1)==6,1)=116;
    class(class(:,1)==7,1)=117;
    class(class(:,1)==8,1)=118;
    class(class(:,1)==9,1)=119;
    class(class(:,1)==10,1)=120;
    class(class(:,1)==11,1)=121;
    class(class(:,1)==12,1)=122;
    class(class(:,1)==13,1)=123;
    class(class(:,1)==14,1)=124;
    class(class(:,1)==15,1)=125;
    class(class(:,1)==16,1)=126;
    class(class(:,1)==17,1)=127;
    class(class(:,1)==18,1)=128;
    class(class(:,1)==19,1)=129;
    class(class(:,1)==20,1)=130;
    class(class(:,1)==21,1)=131;
    
    class1=class;
    class(class(:,1)==122,1)=1;
    class(class(:,1)==129,1)=2;
    class(class(:,1)==131,1)=3;
    class(class(:,1)==116,1)=4;
    class(class(:,1)==121,1)=5;
    
    class1(class1(:,1)==122,1)=1;
    class1(class1(:,1)==129,1)=2;
    class1(class1(:,1)==131,1)=3;
    class1(class1(:,1)==111,1)=4;
    class1(class1(:,1)==116,1)=5;
    class1(class1(:,1)==121,1)=6;
    
     buffer=zeros(1,d+4);
    S=[];
    N=randi([70 100]);   
    N=N-mod(N,5)
   
    randomTime=randi([20000 25000]);   
    randomTime=randomTime-mod(randomTime,500);
    t=datestr(milliseconds(randomTime),'dd-mm-yyyy HH:MM:SS FFF');

%     t=setTime('00-01-0000 00:00:05 500');%Grafik için 5.5sn, Grafiksiz 200 ms ile split ve merge iþlemleri görünüyor(buffer = 37, 2D için buffer =29) %
    TN=randi([140 200]);   
    TN=TN-mod(TN,10)
    
    r=randi([100 200]);   
    r=r-mod(r,5);
    r=r/100
    
    r_treshold=randi([150 450]);   
    r_treshold=r_treshold-mod(r_treshold,5);
    r_treshold=r_treshold/100
    
    
    r_max=randi([640 660]);   
    r_max=r_max-mod(r_max,5);
    r_max=r_max/100
    
%     N=95;%80Min küme oluþturma için gerekli veri sayýsý 50 20
%     t=setTime('00-01-0000 00:00:20 000');%150%setTime('00-01-0000 00:00:01 000');% 1 sn ile %98-99 baþarý elde ediliyor bufferSize:230->33
%     TN=160;
%     r=2;%1   0.80;%Küme yarýçapý 0.8 ve 1 arasý 1.25
%     r_treshold=2.7;%2    0.00001*r;%r attýrma eþik deðeri0.75*r 0.75*r
%     r_max=6.55;%6 1*r;%%%%%%%4*r 4.55*r
    
end
if veriseti==8
    dataset=load('MrData.txt');
    DatasetName='MrData_';
    VeriMiktari=42470;             %Üzerinde iþlem yapýlacak veri miktarý
    d=2;                           %Nitelik sayýsý(d=dimension
    data=dataset(1:VeriMiktari,2:d+1);%Seçilen Veri
    class=dataset(1:VeriMiktari,4);
    
    class(class(:,1)==1,1)=1;
    class(class(:,1)==4,1)=40;
    class(class(:,1)==2,1)=20;
    class(class(:,1)==3,1)=30;
    class(class(:,1)==40,1)=2;
    class(class(:,1)==20,1)=3;
    class(class(:,1)==30,1)=4;
%      class(class(:,1)==0,1)=1000;%Outliers
    buffer=zeros(1,d+4);
    S=[];
   
    
     N=15+randi(10);%Min küme oluþturma için gerekli veri sayýsý 50
   
    randomTime=randi([10000 12000]);   
    randomTime=randomTime-mod(randomTime,250);
    t=datestr(milliseconds(randomTime),'dd-mm-yyyy HH:MM:SS FFF');

%     t=setTime('00-01-0000 00:00:05 500');%Grafik için 5.5sn, Grafiksiz 200 ms ile split ve merge iþlemleri görünüyor(buffer = 37, 2D için buffer =29) %
    TN=randi([170 190]);   
    TN=TN-mod(TN,10);
    
    r=randi([200 250]);   
    r=r-mod(r,5);
    r=r/10;
    
    r_treshold=randi([10 50]);   
    r_treshold=r_treshold-mod(r_treshold,5);
    r_treshold=r_treshold/10;
    
    
    r_max=randi([250 280]);   
    r_max=r_max-mod(r_max,5);
    r_max=r_max/10;
    
  
end
if veriseti==9
    dataset=importdata('Breast_Cancer.txt');
    DatasetName='BreastCancer_';
    VeriMiktari=699;              %Üzerinde iþlem yapýlacak veri miktarý
    d=9;                           %Nitelik sayýsý(d=dimension
    data=dataset(1:VeriMiktari,2:d+1);%Seçilen Veri
    class=dataset(1:VeriMiktari,11);
    class(class(:,1)==2,1)=1;
    class(class(:,1)==4,1)=2;
    buffer=zeros(1,d+4);
    S=[];
    % %User Defined Variables%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    N=2+randi(13);%Min küme oluþturma için gerekli veri sayýsý 50
   
    randomTime=randi([500 10000]);   
    randomTime=randomTime-mod(randomTime,250);
    t=datestr(milliseconds(randomTime),'dd-mm-yyyy HH:MM:SS FFF');

%     t=setTime('00-01-0000 00:00:05 500');%Grafik için 5.5sn, Grafiksiz 200 ms ile split ve merge iþlemleri görünüyor(buffer = 37, 2D için buffer =29) %
    TN=randi([50 250]);   
    TN=TN-mod(TN,10);
    
    r=randi([50 120]);   
    r=r-mod(r,5);
    r=r/10;
    
    r_treshold=randi([5 35]);   
    r_treshold=r_treshold-mod(r_treshold,5);
    r_treshold=r_treshold/10;
    
    
    r_max=randi([r*100+r_treshold*100 400*r_treshold+r*100]);   
    r_max=r_max-mod(r_max,25);
    r_max=r_max/100;
end
if veriseti==11
    load('Occupancy_Data.mat');
    DatasetName='Occupancy_';
    VeriMiktari=8143;              %Üzerinde iþlem yapýlacak veri miktarý
    d=6;                           %Nitelik sayýsý(d=dimension
    data=Occupancy_Data(1:VeriMiktari,2:d+1);%Seçilen Veri
    class=Occupancy_Data(1:VeriMiktari,8);
       
    
    simdi=now;
    for abc=1:VeriMiktari
       if mod(rand(1,1)*10,2)==0
        if abc==1
            Time_Mat(abc,1)=simdi+0.000001*rand(1,1);
        else
            Time_Mat(abc,1)=Time_Mat(abc-1,1)+0.000001*rand(1,1);
        end
       else
            if abc==1
            Time_Mat(abc,1)=simdi+0.00001*rand(1,1);
        else
            Time_Mat(abc,1)=Time_Mat(abc-1,1)+0.00001*rand(1,1);
        end
       end
       end
    
     Time_Mat2=datestr(Time_Mat,'dd-mm-yyyy HH:MM:SS FFF');
     
    class(class(:,1)==1,1)=2;
    class(class(:,1)==0,1)=1;
    buffer=zeros(1,d+4);
    S=[];
    % %User Defined Variables%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   N=randi([20 70]);   
    N=N-mod(N,5)%Min küme oluþturma için gerekli veri sayýsý 50
    
     randomTime=randi([500 10000])   
    randomTime=randomTime-mod(randomTime,250);
    t=datestr(milliseconds(randomTime),'dd-mm-yyyy HH:MM:SS FFF');
    
     TN=randi([150 350]);   
    TN=TN-mod(TN,10)
    
     r=randi([2000 4000]);   
    r=r-mod(r,10);
    r=r/10
    
    r_treshold=randi([300 700]);   
    r_treshold=r_treshold-mod(r_treshold,5);
    r_treshold=r_treshold/10
  
    r_max=randi([100 600]);   
    r_max=r_max-mod(r_max,5);
    r_max=r_max/10;
    
    r_max=r+r_treshold+r_max
    
elseif veriseti==12
    load('ForestCover.mat')
    DatasetName='ForestCover_';
    VeriMiktari=5000;              %Üzerinde iþlem yapýlacak veri miktarý
    d=54;                           %Nitelik sayýsý(d=dimension
    data=dataset(1:VeriMiktari,1:d);%Seçilen Veri
    class=dataset(1:VeriMiktari,55);
     data(data==0)=0.00000001;
    class(class(:,1)==1,1)=10;
    class(class(:,1)==2,1)=20;
    class(class(:,1)==3,1)=30;
    class(class(:,1)==4,1)=40;
    class(class(:,1)==5,1)=50;
    class(class(:,1)==6,1)=60;
    class(class(:,1)==7,1)=70;
   
    class(class(:,1)==10,1)=3;
    class(class(:,1)==20,1)=2;
    class(class(:,1)==30,1)=5;
    class(class(:,1)==40,1)=7;
    class(class(:,1)==50,1)=1;
    class(class(:,1)==60,1)=6;
    class(class(:,1)==70,1)=4;
    

    buffer=zeros(1,d+4);
    S=[];
    % %User Defined Variables%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    N=20;%Min küme oluþturma için gerekli veri sayýsý 50
    t=setTime('00-01-0000 00:00:03 000');%Grafikli 10sn grafiksiz 3 sn
    TN=200;
    r=400;%Küme yarýçapý 0.8 ve 1 arasý
    r_treshold=300;%r attýrma eþik deðeri0.75*r
    r_max=750;%%%%%

end
if veriseti==15
    load mydata.mat
    load 'mydataclass.mat' ;
    DatasetName='MyData_';
    VeriMiktari=1000;              %Üzerinde iþlem yapýlacak veri miktarý
    d=2;                           %Nitelik sayýsý(d=dimension
    data=X(1:VeriMiktari,1:d);%Seçilen Veri
    class=class(1:VeriMiktari,1);
     
     buffer=zeros(1,d+4);
    S=[];

    
    N=randi([50 90]);   
    N=N-mod(N,5);
   
    randomTime=randi([500 10000]);   
    randomTime=randomTime-mod(randomTime,250);
    t=datestr(milliseconds(randomTime),'dd-mm-yyyy HH:MM:SS FFF');

%     t=setTime('00-01-0000 00:00:05 500');%Grafik için 5.5sn, Grafiksiz 200 ms ile split ve merge iþlemleri görünüyor(buffer = 37, 2D için buffer =29) %
    TN=randi([100 250]);   
    TN=TN-mod(TN,10);
    
    r=randi([100 500]);   
    r=r-mod(r,25);
    r=r/100;
    
    r_treshold=randi([100 400]);   
    r_treshold=r_treshold-mod(r_treshold,25);
    r_treshold=r_treshold/100;
    
    
    r_max=randi([100 900]);  
    r_max=r_max-mod(r_max,25);
    r_max=r_max/100;
end

[ii,jj]=find(isnan(data)| isinf(data));
data(ii,jj)=0;
i=1;
figureciz=0;
flag=true;
display('Baþladý...');
Pred=[];


%set(gcf, 'Units', 'Normalized', 'OuterPosition', [0, 0.25, 0.5, 0.75]);
x0=400;
y0=150;
width=650;
height=550;
if plotGraph==1
set(gcf,'units','points','position',[x0,y0,width,height]);
end

Pred2=[];
Silinen=[];
indeksler = arrayfun(@(n) 1:n, VeriMiktari, 'UniformOutput', false);
indeksler=indeksler{1,1}';
%data[indexNo d1 d2 d3 classLabel PredictedClus(Model ekliyor)]
data=[indeksler data class];

tic;
while flag==true
    
        buffer=addNode2(data(i,1:d+1),buffer,d,i);
    [S,buffer,Pred,Silinen]=AgeingAll(S,buffer,d,t,Pred,N,Silinen,TN);
    [S,buffer]=NewClusterAppear(S,buffer,d,r,N); 
    [S,buffer]=findAndAddClosestCluster(S, buffer,N,r_max,r_treshold,d);
    [S,buffer]=checkOverlapClustering(S,buffer,N,d,i);
         [S,buffer]=checkSplit(S,buffer,N,r,d,i);        
         [S,buffer]=updateCenters(S,buffer,d,N,r,Pred,TN);
         [S,buffer]=updateRadius(S,buffer,r_max,d,N,r);
         [S,buffer]=FlagActiveCluster(S,buffer,N,d);
    if size(Silinen,1)>0
        Pred2=[Pred2;[Silinen(:,1) Silinen(:,end-2)]]; 
        Silinen=[];
    end
    if plotGraph==1
        if d == 3
                %Kümeleri Grafikte Göster
                myplot(S,buffer,figureciz,d,r_max,veriseti)
        end
        if d == 2
                %Kümeleri Grafikte Göster
                  myplot(S,buffer,figureciz,d,r_max,veriseti)
        end
    end


%          
%     if plotGraph==1
%         if d == 3
%                 %Kümeleri Grafikte Göster
%                 myplot(S,buffer,figureciz,d,r_max,veriseti)
%         end
%         if d == 2
%                 %Kümeleri Grafikte Göster
%                   myplot(S,buffer,figureciz,d,r_max,veriseti)
%         end
%     end
    if i>VeriMiktari-1
        flag=false;
        
    else

%        if veriseti==11
%             next=Time_Mat(i+1,1);
%             current=now;
%             while 30*current<next
%                pause(0.001); 
%                current=now;
%             end
%             
%        end

        
    end
    i=i+1;
    if mod(i,1000)==0
        fprintf('i=%d \n',i);        
    end
    bufSize(1,i)=size(buffer,1);
    elapsedTime(1,i)=toc;
    elapsedTime(2,i)=size(buffer,1);
    elapsedTime(3,i)=elapsedTime(1,i)-elapsedTime(1,i-1);
end
tok=toc;
fprintf('Elapsed Time: %f\n',tok);
string1='../Test Sonuçlarý\KD-AR Stream\BestParameteres\KD_AR_Stream';
string4=num2str(VeriMiktari);
adres = strcat(string1,DatasetName);
adres=strcat(adres,string4);

data=[data [Pred2(:,2);buffer(:,d+2)]];
CompareMatrix=data(:,d+2:d+3);

 for i=1:size(CompareMatrix,1)
    PREDICTED=CompareMatrix(1:i,1);
    ACTUAL=CompareMatrix(1:i,2);

    EVAL = Evaluate(ACTUAL,PREDICTED);
    %%%%%%%%%%%%%Accuracy%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    Accurecy(1,i)=EVAL(1,1);
%     AccMeans(1,i)=mean(Accurecy(1,1:i));
    OverallAcc=mean(Accurecy(1,1:i));
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
     if mod(i,1000)==0
        fprintf('i=%d \n',i);        
     end
 end
 OverallAcc
pause(0.25)

 if veriseti==5  || veriseti==4
data(:,end-1)=class1;
CompareMatrix=data(:,d+2:d+3);
 for i=1:size(CompareMatrix,1)
    PREDICTED=CompareMatrix(1:i,1);
    ACTUAL=CompareMatrix(1:i,2);

    EVAL = Evaluate(ACTUAL,PREDICTED);
    %%%%%%%%%%%%%Accuracy%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    Accurecy(1,i)=EVAL(1,1);
%     AccMeans(1,i)=mean(Accurecy(1,1:i));
    OverallAcc1=mean(Accurecy(1,1:i));
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
     if mod(i,1000)==0
        fprintf('i=%d \n',i);        
     end
 end
 OverallAcc1
 else
    OverallAcc1=OverallAcc; 
 end

if OverallAcc>MaxAcc || OverallAcc1>MaxAcc
   islem='_AccurecyMax.txt';
    Dosya=strcat(adres,islem);
    
    dlmwrite(Dosya, OverallAcc);
        dlmwrite(Dosya, OverallAcc1, '-append');
    dlmwrite(Dosya, N, '-append');
     dlmwrite(Dosya, TN, '-append');
    dlmwrite(Dosya, randomTime, '-append');%Zaman
    
    dlmwrite(Dosya, r, '-append');
    dlmwrite(Dosya, r_treshold, '-append');
    dlmwrite(Dosya, r_max, '-append');
    dlmwrite(Dosya, tok, '-append');

    if OverallAcc1>OverallAcc
        MaxAcc=OverallAcc1;
    else
        MaxAcc=OverallAcc;
    end
end



% 
% figure (4)
% plot(Accurecy(1, 1:i),'LineWidth',2);
% ylim([0 1])
% title('Accurecy Test')
% xlabel('Veri Miktar')
% ylabel('Accurecy')
% set(gcf,'units','points','position',[x0,y0,width,height]);
% 


 fprintf('AvgAccuracy=%d\n',OverallAcc);
end
      