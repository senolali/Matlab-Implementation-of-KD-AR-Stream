function [dist,inc,dec]=findRadius2(datax,A,d,dist,rds,r_threshold)
              dist=0;inc=0;say=0;
              rdsDec=rds-r_threshold;
              sayDec=0;
              dec=0;
            for i=1:size(datax,1)
                distance=findDistance(datax(i,1:d),A(1,1:d),d);
                if distance>dist 
                    dist=distance;
                end
                if distance>rds
                   say=say+1;
                   if say>5
                      inc=1; 
                   end
                end
                if distance>rdsDec
                   sayDec=sayDec+1;
                   
                end
            end
            if sayDec+say<5 && inc==0
                       dec=1;
                   end
end