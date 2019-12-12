if($#ARGV != 4){

	print $#ARGV;
	print "perl HeterotachySimmer.pl SimTreeSlow SimTreeFast CompTree TwoTopScript Reps\n";
	sys.exit();
}
$slow = $ARGV[0];
$fast = $ARGV[1];
$comp = $ARGV[2];
$script = $ARGV[3];
$reps = $ARGV[4];


foreach $i (1..$reps){

	system("seq-gen -m GTR -r 1 2 3 4 5 6 -g 4 -l 1000 $fast | pxs2fa > FastGene\.fa");
	foreach $j (1..4){
		
		system("seq-gen -m GTR -r 1 2 3 4 5 6 -g 4 -l 1000 $slow | pxs2fa > ASlowGene$j\.fa");
	}
	system("pxcat -s *.fa -p super.parts -o super.matrix");
	system("perl $script super.matrix super.parts $comp out");
	system("mv ForR $i\_GWLL.txt");
	system("mv ForRcorrected $i\_SSLL.txt");
	system("rm RAxML_* out super.matrix super.parts *.fa");

}