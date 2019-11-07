function P = tfa4management(A,growth_up,x,y)
lamup = y; % highest value of lambda
sA = size(A);
n = sA(1,1);
P = zeros(n,n);
count = 1;
for ii = 1:n
    for jj = 1:n
        lamdown = x; % lowest value of lambda
        if A(ii,jj) > 0
            AL = A;
            AL(ii,jj) = 0;
            if lamdown < eigs(AL,1)
                lamdown = eigs(AL,1);
                disp(['For the (',sprintf('%d',ii),',',sprintf('%d',jj),') entry the x value is too low']);
            end
            h = (lamup-lamdown)/(100*sqrt(2));
            lam = lamdown:h:lamup;
            ei = zeros(n,1);
            ej = zeros(1,n);
            ei(ii) = 1;
            ej(jj) = 1;
            del = [];
            for kk = 1:length(lam)
                del = [del 1/(ej*inv(lam(kk)*eye(n)-AL)*ei)];
            end
            delprop = 100*(del-A(ii,jj))/A(ii,jj);
            subplot(n,n,count);
            plot((delprop),lam,'LineWidth',1.2);
            axis([min(delprop) max(delprop) min(lam) max(lam)]);
            h = sqrt(2)*(lamup-lamdown)/200;
            hold on;
            plot(0,eigs(A,1),'r.','markersize',16);
            xlabel('% Change Transition');
            ylabel('Growth Rate');
            if eigs(AL) < growth_up
                P(ii,jj) = (1/(ej*inv(growth_up*eye(n)-AL)*ei))-A(ii,jj);
                dprop = 100*(P(ii,jj))/A(ii,jj);
                plot(dprop*ones(1,length(lam)),lam,':');
            else
                P(ii,jj) = Inf;
            end
        end
        count = count+1;
    end
end
end