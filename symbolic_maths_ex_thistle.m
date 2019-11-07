clear
close all
clc
%%
syms h s g
A = sym('A');
A = [0 0 2043*(1-h)*(1-g) 9289*(1-h)*(1-g);15*s/1000 0 1052*g*(1-h)*s 4783*g*(1-h)*s; 0 12/100 11/100 0; 0 2/100 27/100 17/100]
d = det(eye(4) - A);
s = solve(d==0,s)
%%
syms x y
B = [2/3 1/2+x 3/2+y;(1+x)/5 0 0;0 3/4 0];
q = det(eye(3)-B);
y = solve(q==0,y)