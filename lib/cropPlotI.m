function cropPlotI()
    ax = gca;
    outerpos = ax.OuterPosition;
    ti = ax.TightInset; 
    left = outerpos(1) + ti(1);
    bottom = outerpos(2) + ti(2);
    ax_width = outerpos(3) - 1.2*(ti(1) + ti(3));
    ax_height = outerpos(4) - 1.1*(ti(2) + ti(4));
    ax.Position = [left bottom ax_width ax_height];
end