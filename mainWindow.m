
clear ; close all; clc

data= load('Data_Fall2017_M.txt');
X=data(:,[1,2]);
Y=data(:,4);


plot_data(X, Y );

hold on;

[m, n]= size(X);
X=[ones(m,1) X];

initial_theta=zeros(n+1,1);
[cost , grad]= costfcn(initial_theta, X, Y);
#fprintf('cost at initial theta', cost);
fprintf('Cost at initial theta (zeros): %f\n', cost);
fprintf('Gradient at initial theta (zeros): \n');
fprintf(' %f \n', grad);
options=optimset('GradObj', 'on', 'MAxIter', 400);
[theta , cost]=...
fminunc(@(t)(costfcn(t, X, Y)), initial_theta , options);
fprintf('theta is ');
fprintf(' %f \n', theta)


Boundary(theta, X, Y);
hold on;


xlabel('Midterm Exam score')
ylabel('Final Exam score')

% Specified in plot order
legend('Pass', 'Not Pass')
hold off;

