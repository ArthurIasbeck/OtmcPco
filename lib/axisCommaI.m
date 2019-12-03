function axisCommaI()
	xl = get(gca,'XTickLabel');
 	newXl = strrep(xl(:),'.',',');
 	set(gca,'XTickLabel',newXl);

	yl = get(gca,'YTickLabel');
 	newYl = strrep(yl(:),'.',',');
 	set(gca,'YTickLabel',newYl);
end
