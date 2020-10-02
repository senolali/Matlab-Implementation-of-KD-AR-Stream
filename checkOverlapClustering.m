function [S,data]=checkOverlapClustering(S, data,N,d,iii)

    for a=1:findNumOfAllClusters(S)
        for b=a+1:findNumOfAllClusters(S)
%             if a<=findNumOfAllClusters(S) & b<=findNumOfAllClusters(S)
            mesafe=findDistance(S(b,2:d+1),S(a,2:d+1),d); 
            if  (S(b,d+3)>0 && S(a,d+3)>0) && (mesafe<S(a,d+4) || mesafe<S(b,d+4))%Her ikisinin de aktif ise
              
               if mesafe < (S(a,d+8)+S(b,d+4)) || mesafe < (S(a,d+4)+S(b,d+8))  %%Bir kümenin çekirdeði diðerinin kabuðu ile çakýþýyorsa
                  fprintf('Çakýþan Kümeler Var. Çakýþan Kümeler = %d ve %d i= %d\n', a,b,iii);%
%                   (S(a,d+8)+S(b,d+8))
%                   mesafe
                  for i=2:d+1
                      S(a,i)=(S(a,i)*S(a,d+2)+S(b,i)*S(b,d+2))/(S(a,d+2)+S(b,d+2));
                  end
                  data(data(:,d+2)==b,d+2)=a;
                  S(a,d+9)=1;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

                  for j=b:findNumOfAllClusters(S)-1  
                     S(j,2:d+4)=S(j+1,2:d+4); 
                     data(data(:,d+2)==j+1,d+2)=j;
                  end                
                  S=S(1:findNumOfAllClusters(S)-1,:);
                  fprintf('Çakýþan kümeler birleþtirildi\n');%
                 return;
               end
            end
%             end
         end
     end
end