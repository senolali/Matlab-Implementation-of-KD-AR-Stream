function [S,datas]=checkSplit(S,datas,N,r,d,iii)

    for k=1:findNumOfAllClusters(S)
      if S(k,d+2)>=2*N  && S(k,d+4)>2*r && S(k,d+3)==1 && S(k,d+8)>=r
        data=datas(datas(:,d+2)==k,:);%Hiçbir kümeye ait olmayan verileri al
        tree = KDTreeSearcher(data(:,2:d+1));%Bu verilerin/satýrlarýn niteliklerini al ve aðaca yerleþtir
        
        for i=1:size(data,1)%Kaç tane veri varsa her biri için kontrol edilecek      
             query = data(i,2:d+1);%Bu verilerin her biri için sorgu oluþturulacah
             idx = rangesearch(tree, query, r);%Yarýçap verisine göre range search yap
             idxs = idx{1};%r yarýçap içerisinde bulunan verilerin indexlerini al
      
             
             if size(idxs,2)>=N %Eðer r içerisindeki veri sayýsý küme oluþturacak sayýda ise  gir
                 A=data(idxs,1);%%data matrisinde bu verilerin id(ilk sütun) deðerlerini al
                 B=sortrows(A);%Sýrala                       
                 datax=datas( ismember(datas(:,1) ,B(:,1),'rows' ),: );%%AA Kümesi
                 datay=data( ~ismember(data(:,1) ,B(:,1),'rows' ),: );%BB kümesi
                 
                 for l=1:d
                     AA(1,l)=mean(datax(:,l+1));
                     BB(1,l)=mean(datay(:,l+1));
                 end
                 
                 
                 dis=0;
                 rX=0;
                 
                 for m=1:size(datax,1)
                     dis=findDistance(datax(m,2:d+1),AA(1,1:d),d);
                     if dis>rX
                         rX=dis;
                     end                     
                 end
                 dis=0;
                 rY=0;
                 for m=1:size(datay,1)
                     dis=findDistance(datay(m,2:d+1),BB(1,1:d),d);
                     if dis>rY
                         rY=dis;
                     end                     
                 end 
                 
                 if size(datax,1)>=N && size(datay,1)>=N
                    dist=findDistance(AA,BB,d);
                    if dist>((rX+rY)+r/2)
                        newClusterNo=findNumOfAllClusters(S)+1;

                         datas( ismember(datas(:,1) ,B(:,1),'rows' ),d+2 )=newClusterNo;
                         datas( ismember(datas(:,1) ,B(:,1),'rows' ),d+4 )=1;
                         [S]=addNewCluster(S,newClusterNo,datax,d,r);
                         fprintf('%d nolu küme bölündü. %d nolu küme oluþturuldu. i= %d\n',k,newClusterNo,iii);
                         S(k,d+9)=1;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                         S(newClusterNo,d+9)=1;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                         return;
                    end
                     
                 end
                 
                
             end
        end
      end
    end
end