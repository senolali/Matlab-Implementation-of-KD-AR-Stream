function myplot(S,data,figureciz,d,r_max,veriseti)
x1=[];
x2=[];
x3=[];

for i=1:size(data,1)
    if figureciz==0
     
        figure(1)
        if d==3 
            view(3)
        end
        
        figureciz=1;
    end
    if  data(i,d+2)==0
        renk='k'; 
        marker='+';
    elseif (data(i,d+2)>0 && S(data(i,d+2),d+3)==0)
         renk='k';
         marker='x';
    else

        renk=S(data(i,d+2),d+5:d+7);
        marker='*';
        
%         if data(i,d+2)==2
%             marker='square';
%         end
 
    end
    
    if d==3
         
        x1=plot3(data(i,2),data(i,3),data(i,4),'Color',renk,'Marker',marker);
        hold on
    end
    if d==2
         
        x1=plot(data(i,2),data(i,3),'Color',renk,'Marker',marker);
        hold on;
    end
    

   
end

for j=1:findNumOfAllClusters(S)
  if S(j,d+3)==1
      if j==2 
          if d==3
            x2=plot3(S(j,2),S(j,3),S(j,4), 'Xg');
            hold on
          end
          if d==2
              x2=plot(S(j,2),S(j,3), 'Xg');
              hold on
          end
      else
          if d==3
            x3=plot3(S(j,2),S(j,3),S(j,4), 'Xr');
            hold on
          end
          if d==2
              x3=plot(S(j,2),S(j,3), 'Xr');
              hold on
          end
      end
     
  end
  if d==2
        viscircles(S(j,2:d+1),S(j,d+8));
        hold on;
        viscircles(S(j,2:d+1),S(j,d+4));
        hold on;
  end
   
end

    title('Akan Veri Kümeleme (3D)');
    if d==2
        title('Stream Data Clustering 2D'); 
        if veriseti==1
            xlim([-10 105])
            ylim([-10 105])
        elseif veriseti==2
            xlim([0 30])
            ylim([0 30])
        end
    end
    xlabel('X-niteliði');
    ylabel('Y-niteliði');
    if d==3
        zlabel('Z-niteliði');
        view([-20,10]);%view(-20,10);
        if veriseti==1
            xlim([0 105])
            ylim([0 105])
            zlim([0 105])
        end
    end
   
    grid on
    rotate3d on
   hold on

clearvars x1;
clearvars x2;
clearvars x3;
drawnow
hold off



end