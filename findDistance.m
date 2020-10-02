function [distance]=findDistance(A,B,d)%A d boyutlu ve B d boyutlu,index yok
    distance=0;
    for i=1:d
        distance=distance+((A(1,i)-B(1,i))*(A(1,i)-B(1,i)));
    end
    distance=sqrt(distance);
    %fprintf('The distance is %f\n',distance);


end