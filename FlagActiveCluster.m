function [S, data]=FlagActiveCluster(S,data,N,d)
    for i=1:findNumOfAllClusters(S)
      if S(i,d+9)==1   
        if S(i,d+2)>=N
            if  S(i,d+3)==0
                 fprintf('%d Nolu küme Aktive edildi \n',S(i,1));
            end
           S(i,d+3)=1;
           data(data(:,d+2)==i,d+4)=1;
           
        else
            if  S(i,d+3)==1
                 fprintf('%d Nolu küme Deaktive edildi \n',S(i,1));
            end
            S(i,d+3)=0;
           data(data(:,d+2)==i,d+4)=0;
        end
      end
    end
end