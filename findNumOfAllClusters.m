function[num]=findNumOfAllClusters(S)
    if size(S,1)==0
        num=0;
    else
        num=size(S(S(:,1)>0,1),1);
    end
end