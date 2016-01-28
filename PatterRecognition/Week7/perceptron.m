function w = perceptron( data, class )
%UNTÝTLED2 Summary of this function goes here
%   Detailed explanation goes here
    % Initialization
    xmax = max(data(1, :)) + 1;
    xmin = min(data(1, :)) - 1;
    ymax = max(data(2, :)) + 1;
    ymin = min(data(2, :)) - 1;
    p=0.1;
    w0=0;
    % create new class array to compare with actual classes
    newClass=zeros(size(class));
    % create random weight vector for begining the process
    w = rand(size(data, 1), 1);
    % extend all samples in the data
    
       
    t=1;
    %extended w 
    w=transpose([transpose(w),w0]);
    while t<10000
        
        
        
        % classify the data
        for i=1:length(data)
            x=data(1:2,i);
            %extended x
            x=transpose([transpose(x),1]);
            
            val=transpose(w)*x;
            if val<0
                %sample belongs to class 2
                newClass(i)=2;
            elseif val>0
                %sample belongs to class 1
                newClass(i)=1;
            end
        end

        %decide missclassified samples
        k=1;
        missclassified=[];
        for i=1:length(class)
            if class(i)~= newClass(i)
                missclassified(k)=i;
                k=k+1;
            end
        end
        length(missclassified)

        % implement the batch method
        total=0;
        for i=1:length(missclassified)
            x=data(1:2,missclassified(i));
            %extended x
            x=transpose([transpose(x),1]);
            total=total+(-x);
            
            
        end
        %update weight vector
        w=w-(p/t)*total;
        
        %update control value of while loop
        t=t+1;

        hold off;
        plot(data(1, newClass==1), data(2, newClass==1), 'bx', ...
        data(1, newClass==2), data(2, newClass==2), 'ro');
        axis([xmin xmax ymin ymax]);
        hold on;
        line([xmin xmax], [-(w(1) * xmin + w(3)) / w(2), ...
        -(w(1) * xmax + w(3)) / w(2)],...
        'Color',[.8 .8 .8]);
        pause(0.1);

       
    end
    
    % Plot data and discriminant


end

