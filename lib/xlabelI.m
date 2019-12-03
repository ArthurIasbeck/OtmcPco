function xlabelI(strLabel)
    strLabel = correctLatex(strLabel);
    xlabel(strLabel, 'Interpreter','latex');
end