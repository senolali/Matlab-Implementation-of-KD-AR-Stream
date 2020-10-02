% function pur=Purity(labels,clusters)
% % vypocita ryzost shlukovani srovnanim se znamou anotaci
% % predpoklada prave 2 tridy vzorku
% %
% % Input: 
% % labels = vektor hodnot 1 nebo 2 urcujicich tridu (size(num_points,1))
% % points = vektor hodnot 1 nebo 2 urcujicich prislusnost ke shlukum (size(num_points,2))
% 
% if size(labels,1)~=size(clusters,1)
%   warning('Delka vektoru labels a clusters se lisi.')
% end
% 
% correct=max(sum(labels==clusters),sum(labels~=clusters));
% pur=correct/size(labels,1);
% end

function Purity=Purity(c1,c2)

K=max(c1); sumAg=0;
for k = 1:K
    sel = find(c1==k);
    tbl = tabulate(c2(sel));
    if ~isempty(sel)
        [~,I]=sort(tbl(:,2),'descend');
        sumAg=sumAg+tbl(I(1),2);
    end
end

Purity = sumAg/length(c1);
end

% function score = Purity(labels,clusters)
% %PURITY - calculates purity to evaluate clustering
% % score=Purity(labels, clusters)  where labels assigns the
% % ground truth and clusters is the clustering assignment.
%   
% 
% assert(length(labels) == length(clusters));
% overlap = 0;
% u_clusters = unique(clusters);
% for i = 1:length(u_clusters)
%     k = u_clusters(i);
%     % Find best cluster for this label
%     assignments = labels(clusters == k);
%     overlap = overlap + sum(assignments == mode(assignments));
% end
% 
% score = overlap / length(labels);