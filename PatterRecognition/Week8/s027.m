function w = percep(class, data) % function implementing simple perceptron

w = rand(3, 1); % initialize the weight
rho = 0.1; % learning rate
i = 1;
data(3, :) = ones(1, length(class));

xmax = max(data(1, :)) + 1;
xmin = min(data(1, :)) - 1;
ymax = max(data(2, :)) + 1;
ymin = min(data(2, :)) - 1;
data(:, class == 2) = -data(:, class == 2);
nErr = sum(w' * data < 0); % number of misclassifications

while (nErr(i) > 0 & i < 1000) % if classification errors,  iterate
  i = i + 1;
  w = w - rho / i * sum(-data(:, w' * data < 0), 2); % weight vector
  nErr(i) = sum(w' * data < 0); % number of misclassifications
  if (mod(i, 50) == 0)  % draw only every 50th change in discriminant line
    hold off;
    plot(data(1, class == 1), data(2, class == 1), 'bx', ...
      -data(1, class == 2), -data(2, class == 2), 'ro');
    axis([xmin xmax ymin ymax]);
    hold on;
    line([xmin xmax], ...
      [-(w(1) * xmin + w(3)) / w(2), -(w(1) * xmax + w(3)) / w(2)]);
    drawnow;
    pause(1);
  end
end

% Plotting the results
%sum(w' * data < 0)
hold off;
plot(data(1, class == 1), data(2, class == 1), 'bx', ...
  -data(1, class == 2), -data(2, class == 2), 'ro');
axis([xmin xmax ymin ymax]);
hold on;
line([xmin xmax], ...
  [-(w(1) * xmin + w(3)) / w(2), -(w(1) * xmax + w(3)) / w(2)]);
drawnow;

figure;
plot(nErr);
xlabel('Iteration round');
ylabel('Number of misclassifications');
