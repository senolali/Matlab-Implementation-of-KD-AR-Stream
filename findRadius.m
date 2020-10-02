function [dist]=findRadius(datax,A,d,dist)
              dist=0;
            for i=1:size(datax,1)
                distance=findDistance(datax(i,1:d),A(1,1:d),d);
                if distance>dist 
                    dist=distance;
                end
            end
end