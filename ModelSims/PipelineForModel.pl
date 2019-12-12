print "$#ARGV\n";
if($#ARGV != 1){
	print "perl PipelineForModel.pl FirstLength SecondLength Folder\n";
}

$first = $ARGV[0];
$second = $ARGV[1];
$folder = $ARGV[2];

for $i (0..1100){

	system("seq-gen -m GTR -g 4 ../test.tre -l $first > $first\_Gene$i.fa");
	
	system("for x in {1..99};do seq-gen -m GTR -g 4 ../test.tre -l $second > $i\_Gene\$x.fa;done");
	
	system("pxcat -s $first\_Gene$i.fa $i\_Gene*.fa -p Parts.parts -o super.matrix");
	system("rm $i\_Gene*.fa");
	system("iqtree -nt 2 -s super.matrix -q Parts.parts -m GTR+G -pre $i -redo -wpl");
	system("mv *.fa *.bionj *.ckp.gz *.iqtree *.log *.mldist *.partlh *.treefile $folder");
	

}


