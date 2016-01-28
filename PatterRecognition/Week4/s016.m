% $Id$

mu = [3 3 11; 6 -2 -2]; % class means

s = [2 0; 0 2]; % equal covariances
Sigma = zeros(2,2,3);
Sigma(:,:,1) = s;
Sigma(:,:,2) = s;
Sigma(:,:,3) = s;

plotclass(mu, Sigma);
grid on;

% Precalculated decision boundaries
h(1) = line([0 14], [2 2], 'Color', 'r', 'LineStyle', '--'); % x2 = 2
h(2) = line([7 7], [-5 9], 'Color', 'g', 'LineStyle', '--'); % x1 = 7
h(3) = line([0 14], [-5 9], 'Color', 'b', 'LineStyle', '--'); % x1 - x2 - 5 = 0

axis equal;
axis([0 14 -5 9]);
legend(h, 'g_{12}', 'g_{23}', 'g_{13}');
