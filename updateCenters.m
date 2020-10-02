function [S,data]=updateCenters(S,data,d,N,r,Pred,TN)

    for i=1:findNumOfAllClusters(S)
        if S(i,d+9)==1 
             S(i,d+2)=size(data(data(:,d+2)==i,1),1);
             if S(i,d+3)==1
                 for j=1:d
                    S(i,j+1)=mean(data(data(:,d+2)==i,j+1));
                 end
             else
                 if ~isempty(Pred)
                     A=Pred(Pred(:,d+2)==i,:);
                     C=data(data(:,d+2)==i,:);
                     C=[A;C];
                 else
                    C=data(data(:,d+2)==i,:); 
                 end
                 if size(C,1)>N
                     C=C(end-N+1:end,:);
                 end
                  if size(C,1)>1
                     for j=2:d+1
                         S(i,j)=mean(C(:,j));						  
                     end
                  end
             end 
        end
    end

end