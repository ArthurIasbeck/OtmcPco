function plotI(x,y,config)

    if iscell(config)
        color = char(config(2));
        config = char(config(1));
        if color == 'b'
            colorCode = [0, 0.4470, 0.7410];
        elseif color == 'k'
            colorCode = [0, 0, 0];
        elseif color == 'r'
            colorCode = [0.8500, 0.3250, 0.0980];
        elseif color == 'g'
            colorCode = [0, 0.5, 0];
        elseif color == 'y'
            colorCode = [0.9290, 0.6940, 0.1250];
        elseif color == 'c'
            colorCode = [0, 0.75, 0.75];
        elseif color == 'm'
            colorCode = [0.6350, 0.0780, 0.1840];
        end
        
        if strcmp(config,'.-')
            plot(x,y,config,'LineWidth',2, 'MarkerSize',15, ...
                'Color', colorCode);
        else
            plot(x,y,config,'LineWidth',2, 'MarkerSize',15, ...
                'Color', colorCode);
        end
    else
        if strcmp(config,'.-')
            plot(x,y,config,'LineWidth',2, 'MarkerSize',15);
        else
            plot(x,y,config,'LineWidth',2, 'MarkerSize',15);
        end
    end
    grid on;
    set(gca,'FontSize',15);
    set(gca,'TickLabelInterpreter','latex');
    set(gcf, 'Position',  [100   100   1000   550]);
    pause(0.5);
end