function [S,buffer]=NewClusterAppear(S,buffer,d,r,N)%If N items data that not belong to any cluster in r-radius occur it defines them as a new cluster.



        data=buffer(buffer(:,d+2)==0,:);%Get data that not belong to any cluster
        tree = KDTreeSearcher(data(:,2:d+1));%Place the data to KD-Tree
        if size(data,1)>=N
        for i=1:size(data,1)%Search for eeach data   
             query = data(i,2:d+1);%Build query
             idx = rangesearch(tree, query, r);%Execute range search in the tree
             idxs = idx{1};%Get data ids that in r-Radius 
      
             if size(idxs,2)>=N %If size is bigger than N
                 A=data(idxs,1);%Get their ids
                 B=sortrows(A);%Sort them                      
                 datax=buffer( ismember(buffer(:,1) ,B(:,1),'rows' ),: );%Get data from buffer according to sequence # 
                 for j=2:d+1
                   C(1,j-1)=mean(datax(:,j)); %Calculate cluster center
                 end
                 [Al,rNew]=distanceToOthers(S,C,d,datax);%If the distance from the center to other all cluster centers
                 if Al==1 % then
                    newClusterNo=findNumOfAllClusters(S)+1;%Determine new cluster number
                    
                     buffer( ismember(buffer(:,1) ,B(:,1),'rows' ),d+2 )=newClusterNo; %Assign all data in r-radius to new cluster
                     buffer( ismember(buffer(:,1) ,B(:,1),'rows' ),d+4 )=1;%Activate the cluster
                    [S]=addNewCluster(S,newClusterNo,datax,d,rNew);%Add new cluster to cluster table
                    fprintf('%d Nolu Küme Oluþturuldu i=%d\n',newClusterNo,buffer(size(buffer,1),1));
                    return;
                end
             end
             end
        end
end