function  plotdata( data,k )
%   Run K-Means clustering algortihm and draw the centroids

    % cal k-mean based on given data and k
    [idx,C] = kmeans(data,k);
  
        for i=1:k
            plot(data(idx==i,3),data(idx==i,4),'.','MarkerSize',20,'DisplayName',['Cluster   ' num2str(i)])
            hold on
            plot(C(i,3),C(i,4),'+','MarkerSize',15,'LineWidth',3,'DisplayName',['Centroid  ' num2str(i)])
            hold on
        end

%         legend(gca,'show',...
%                 'Location','NW')
        title 'Cluster Assignments and Centroids'
    hold off
end

