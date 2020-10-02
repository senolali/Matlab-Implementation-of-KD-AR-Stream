function [S,data]=updateRadius(S, data, r_max,d,N,r)

    if findNumOfAllClusters(S)>0        
        for j=1:findNumOfAllClusters(S)
            datax=data(data(:,d+2)==j,2:d+1);
            dist=S(j,d+4);
           dist=findRadius(datax,S(j,2:d+1),d,dist);
		   if S(j,d+3)==1
			   if dist>=r && dist<=r_max
				S(j,d+4)=dist;
                S(j,d+8)=mean(std(datax));
               elseif dist>r_max
                   S(j,d+4)=dist;
                S(j,d+8)=mean(std(datax));
               elseif dist<=r
		          S(j,d+4)=r;
                  S(j,d+8)=mean(std(datax));
               end
           else
				S(j,d+4)=r/2; 
		   end
        end
    end
 end
% function [S,data]=updateRadius(S, data, r_max,d,N,r,r_threshold)
% 
%  if findNumOfAllClusters(S)>0     
%         for j=1:findNumOfAllClusters(S)
%           if S(j,d+9)==1   
%             datax=data(data(:,d+2)==j,2:d+1);
%             cluster=S(j,2:d+1);
%             cluster=cluster(1,:);
%             dx=size(cluster,2);
%             rds= S(j,d+4);
%             inc=0;
%            [dist,inc,dec]=findRadius2(datax,cluster,dx,-1,rds,r_threshold);
% 		   if S(j,d+3)==1
%                if inc==1
%                    if rds+r_threshold<=r_max
%                         S(j,d+4)=rds+r_threshold;
%                         S(j,d+8)=mean(std(datax));
%                    else
%                         S(j,d+4)=r_max;
%                         S(j,d+8)=mean(std(datax));
%                    end
%                elseif dec==1
%                         S(j,d+4)=rds-r_threshold;
%                         S(j,d+8)=mean(std(datax));
%                else
%                    S(j,d+8)=mean(std(datax));
%                end
%            else
%                if rds>r/2
%                   S(j,d+4)=r/2;
%                   S(j,d+8)=mean(std(datax));
%                end
%           end            
%         end
%     end
%  end
% end