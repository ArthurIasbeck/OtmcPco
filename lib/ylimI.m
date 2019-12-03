function ylimI(y)
    adjust = 0.2*(max(max(y)) - min(min(y)))/2;
    maxY = max(max(y)) + adjust;
    minY = min(min(y)) - adjust;
    ylim([minY, maxY]);
end