if ($#ARGV != 3){

	print "perl AlnRep.pl NumbReplicates SimTopology TwoTopologies TwoTopLengthScript\n";
	sys.exit();
}

$reps = $ARGV[0];
$tree = $ARGV[1];
$trees = $ARGV[2];
$script = $ARGV[3];

for $i (1..$reps){

	#do the sims of short length
	for $j (1..4){
	
		system("seq-gen -m GTR -r 1 2 3 4 5 6 $tree -l 500 -g 4 > ShortSeq_$j\.fa");
	}
	system("seq-gen -m GTR -r 1 2 3 4 5 6 $tree -l 5000 -g 4 > zLongSeq.fa");
	system("pxcat -s *.fa -p super.model -o super.matrix");
	system("rm *.fa");
	system("perl $script super.matrix super.model $trees out");
	system("mv ForR $i\_GWLL.txt");
	system("mv ForRcorrected $i\_SSLL.txt");
	system("rm RAxML_* out");

}
