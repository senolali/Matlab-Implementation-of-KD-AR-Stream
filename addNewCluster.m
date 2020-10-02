function [S]=addNewCluster(S,clusterNo,A,d,rNew)%clusterNo new cluster number

        for i=2:d+1
           B(1,i-1)=mean(A(:,i)); %Find center for new cluster
           standartDev(1,i-1)=std(A(:,i));%standartDev(1,i-1)=std(A(:,i-1)); þeklinde fisherirista daha iyi sonuç veriyor
        end

            S(clusterNo,1)= clusterNo;%Assign new cluster number to Cluster Table(CT)
            S(clusterNo,2:d+1)=B(1,1:d); %Assign center coordinet of new cluster to CT          
            S(clusterNo,d+2)=size(A,1);%Assign its number of members to CT
            S(clusterNo,d+3)=1;%Define it as an active cluster
            S(clusterNo,d+4)=rNew;%Assign its radius  
             NumCols=findNumOfAllClusters(S); % set the number of available colours, >20 is hard to distinguish
                Clrs=distinguishable_colors(NumCols);
                S(clusterNo,d+5:d+7)=Clrs(clusterNo,1:3);%Define its color

            S(clusterNo,d+8)=mean(standartDev);%Assign mean std as its core radius
            
            S(clusterNo,d+9)=0;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
end