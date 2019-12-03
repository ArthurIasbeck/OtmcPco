function strLatex = correctLatex(str)
    strLatex = strrep(str,'ã','\~a'); 
    strLatex = strrep(strLatex,'â','\^a');
    strLatex = strrep(strLatex,'ê','\^e');
    strLatex = strrep(strLatex,'õ','\~o');
    strLatex = strrep(strLatex,'ô','\^o');
    strLatex = strrep(strLatex,'ç','\c{c}');
    strLatex = strrep(strLatex,'í',strcat('\',char(39),'{\i}'));
    strLatex = strrep(strLatex,'é',strcat('\',char(39),'e'));
    strLatex = strrep(strLatex,'á',strcat('\',char(39),'a'));
    strLatex = strrep(strLatex,'ó',strcat('\',char(39),'o'));
    strLatex = strrep(strLatex,'à',strcat('\',char(96),'a'));
end