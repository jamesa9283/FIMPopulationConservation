function A = make_leslie(n,fecundity,survival)
% a function that creates a Leslie matrix from reproductive and
% survival/growth rates.
% inputs:
% n (an integer that represents the number of age stages)
% fecundity (a 1 by n row vector of fecundity values/reproductive rates)
% survival (a a 1 by n-1 row vector of survival/growth rates)
% outputs:
% A (a n by n Leslie matrix)
%
A = [fecundity; diag(survival) zeros(n-1,1)];
end