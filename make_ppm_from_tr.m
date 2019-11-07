function A = make_ppm_from_tr(n,transitionrates)
% a function that creates a population projection matrix from a k by 3
% table of transition rates, the structure of the table needs to be:
% column 1 and 2: stages the transition is between (from column 2 to column 1)
% column 3: the transition rate.
% inputs:
% n (an integer that represents the number of stages)
% transitionrates (a table of transition pairs and rates
% outputs:
% A (a n by n population projection matrix)
%
A = zeros(n);
k = size(transitionrates,1);
for j = 1:k
   A(transitionrates(j,1),transitionrates(j,2)) = transitionrates(j,3); 
end
end

