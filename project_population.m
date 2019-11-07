function out = project_population(A,ic,time)
% a function that produces graphical outputs for population projections
% using a population projection matrix, initial condition and time horizon
% inputs:
% A (the PPM)
% ic (the initial population structure)
% time (lentgh/steps of the projection interval)
% outputs:
% out (an array of dimension time by number of stages, collecting the list
% of population structures over the projection interval)
%
x = ic;
out = x;
for i = 1:time
    x = A*x;
    out = [out x];
end
% creating a figure of the population projection
% first subplot give the total population against time
subplot(1,2,1)
popd = out ./ sum(out); 
plot(0:time,popd,'LineWidth',2);
hold on;
set(gca,'fontsize',14);
xlabel('Time', 'fontsize', 14);
ylabel('Population Density');
axis square 
% second subplot gives population structure in stages against time
subplot(1,2,2)
x = 0:time;
y = out;
plot(0:time,out,'LineWidth',2);
semilogy(x,y);
set(gca,'fontsize',14);
xlabel('Time', 'fontsize', 14);
ylabel('Stage Structures');
axis square 
end

