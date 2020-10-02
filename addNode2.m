function data=addNode2(X,data,d,i)%Adds new data to buffered data.X new data, data buffered data, dimension, i processed data number

     if data(1,2:d+1)==zeros(1,d)%If the processed data initial data then row number 0
         rowNum=0;
     else  
        rowNum=size(data,1); %set row number to buffered data size
     end
     data(rowNum+1,1)=X(1,1);%set first column to processed data number
     data(rowNum+1,2:d+1)=X(1,2:d+1);%Add new data to buffered data
     t=datestr(now,'dd-mm-yyyy HH:MM:SS FFF');%get arrival time for new data
     data(rowNum+1,d+3)=datenum(t,'dd-mm-yyyy HH:MM:SS FFF');%store arrival time in data matrix 
     
end