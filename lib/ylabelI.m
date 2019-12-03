function ylabelI(strLabel)
    strLabel = correctLatex(strLabel);
    ylabel(strLabel, 'Interpreter','latex');
end