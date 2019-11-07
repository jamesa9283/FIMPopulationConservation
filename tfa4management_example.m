clear
close all
clc
%%
A = [0 0 0.037 0.144 0.231;0.385 0.305 0.041 0 0;0 0.639 0.377 0.037 0.046;0 0.055 0.531 0.626 0.231;0 0 0.041 0.336 0.723];
eigs(A,1)
%%
% figure;
% f1 = gcf;
% f1.Position = [0 0 1920 1080];
% f1.PaperPosition = [0.1 0.1 160/4 90/4];
% f1.PaperSize= [160/4 90/4];
% f1.PaperUnits = 'normalized';
% screenposition = get(f1,'Position');
P = tfa4management(A,1,0.9,1.1);
% saveas(f1,'tfa4management_ex_primrose.pdf')
%%
A1 = A;
A1(5,4) = A(5,4) + P(5,4);
eigs(A1,1)
A2 = A;
A2(5,5) = A(5,5) + P(5,5);
eigs(A2,1)