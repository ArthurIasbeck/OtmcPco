function titleI(strTitle)
    strTitle = correctLatex(strTitle);
    strTitle = strcat('\textbf{',strTitle,'}');
    title(strTitle,'interpreter','latex');
    
end