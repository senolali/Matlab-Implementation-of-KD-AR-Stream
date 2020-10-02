function [flag,dist]=distanceToOthers(S,A,d,datax)%A is a cluster center and S Cluster Table     
    flag=1;
    dist=[];
    [dist]=findRadius(datax(:,2:d+1),A,d,dist);
    if findNumOfAllClusters(S)>=1
        for i=1:findNumOfAllClusters(S)
            distance=findDistance(A,S(i,2:d+1),d);
            if distance<(dist+S(i,d+4)) %&& S(i, d+3)==1%If there is no intersection between new cluster to any other cluster, it can be defined as a new cluster
                flag=0;
                %fprintf('The distance is %f\n',distance);
            end
        end
    end
end