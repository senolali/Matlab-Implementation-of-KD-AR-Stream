function [S,buffer]=findAndAddClosestCluster(S, buffer,N,r_max,r_treshold,d)%Find closest cluster for each data that not blong to any cluster and if distance 

   if findNumOfAllClusters(S)>0            
        for i=1:size(buffer,1)
            if buffer(i,d+2)==0
              KumNo=-1;
              dd=1000000000000000000000000000000000000000000000000000000;
                for j=1:findNumOfAllClusters(S)
                    distance=findDistance(buffer(i,2:d+1),S(j,2:d+1),d);
                    if  distance<(S(j,d+4)+r_treshold) && distance<r_max && distance<dd% & distance<(S(j,d+4)+r_treshold)
                       if KumNo==-1 || distance<dd
                            KumNo=j;
                            dd=distance;
                       end
                    end
                end
                if KumNo~=-1
                    buffer(i,d+2)=KumNo;
                    S(KumNo,d+9)=1;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                end

            end
        end
   end
end