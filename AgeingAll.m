function [S,buffer,Pred,Silinen]=AgeingAll(S,buffer,d,t,Pred,N,Silinen,TN)%Aging all buffered data, if any data that completed its life occurs, delete it
    if size(buffer,1)>1
        for i=1:size(buffer,1)
            t2=datestr(now,'dd-mm-yyyy HH:MM:SS FFF');%Get current time
            num2=datenum(t2,'dd-mm-yyyy HH:MM:SS FFF');%Convert current time to number
            elapsed_time=num2-buffer(i,d+3); %Find elapsed time       
            if elapsed_time<t %If any buffer that not completed its life show up then break
                a=i-1; 
                break;
            end
        end
        if size(buffer(a+1:end,:),1)>TN  %If buffered data size exceeds limit take last TN data as buffered data
            a=size(buffer(1:end-TN,:),1);
        end
        if ~isempty(a)            
             Silinen=buffer(1:a,:);%%Deleted data  
             buffer=buffer(a+1:end,:);%Remained data assign to buffered data 
             X=Silinen;
             X=X(X(:,d+2)~=0,:);            
             for j=1:findNumOfAllClusters(S)           
                  if ~isempty(Pred)
                      if ~isempty(find(X(:,d+2)==j))
                          S(X(:,d+2),d+9)=1;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
                      end
                      Mevcut=Pred(Pred(:,d+2)==j,:);
                      Pred(Pred(:,d+2)==j,:)=[];
                      Yeni=X(X(:,d+2)==j,:);
                      Toplam=[Mevcut;Yeni];
                      if size(Toplam,1)>N
                          Pred=[Pred;Toplam(end-N+1:end,:)];
                      else
                          Pred=[Pred;Toplam];
                      end
                  else
                      Pred=X;  
                  end
             end             
        end
    end
end