function printI(nameFile, fileExt)
    if exist('results','dir') == 0
        mkdir('results');
    end
    if exist('results/figs','dir') == 0
        mkdir('results/figs');
    end

    if nargin == 1 || strcmp(fileExt, 'eps')
        saveas(gcf,strcat('results/', nameFile),'epsc')
    elseif strcmp(fileExt, 'png')
%         print(gcf,strcat('results/', nameFile),'-dpng','-r500');
        print(gcf,strcat('results/', nameFile),'-dpng');
    end

    savefig(strcat('results/figs/', nameFile));
end