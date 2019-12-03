function legendI(lgd, pos)
    if isempty(pos)
        pos = 1;
    end
    
    if pos == 1
        loc = 'northeast';
    elseif pos == 2
        loc = 'northwest';
    elseif pos == 3
        loc = 'southwest';
    elseif pos == 4
        loc = 'southeast';
    end
    lgd = correctLatex(lgd);
    legend(lgd, 'interpreter', 'latex', 'Location', loc);
end