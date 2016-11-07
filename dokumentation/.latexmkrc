# clean rule
$bibtex_use = 2;
$clean_ext = "glo glg acn alg";
$clean_full_ext = "gls run.xml xdy acr lol";

# generate svg's
add_cus_dep( 'svg', 'pdf', 0, 'makesvg2pdf' );
sub makesvg2pdf {
	system("inkscape -D -A \"$_[0].pdf\"  \"$_[0].svg\"" );
}

# glossary
add_cus_dep('glo', 'gls', 0, 'makeglo2gls');
sub makeglo2gls {
	system("xindy -L english -C utf8 -I xindy -M \"$_[0]\" -t \"$_[0].glg\" -o \"$_[0].gls\" \"$_[0].glo\"");
}
# ayronyms
add_cus_dep('acn', 'acr', 0, 'ayronyms');
sub ayronyms {
	system("xindy -L english -C utf8 -I xindy -M \"$_[0]\" -t \"$_[0].alg\" -o \"$_[0].acr\" \"$_[0].acn\"");
}
