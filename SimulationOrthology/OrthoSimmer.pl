use Data::Dumper;
if($#ARGV != 2){

	print "perl OrthoSimmer.pl SimTree CompTree TwoTopScript Reps\n";
}
$sim_tree = $ARGV[0];
$comp_tree = $ARGV[1];
$script = $ARGV[2];
$reps = $ARGV[3];

foreach $i (1..$reps){

	foreach $j (0..4){
	
		system("seq-gen -m GTR -r 1 2 3 4 5 6 -g 4 -l 1000 $sim_tree | pxs2fa > temp\_$j\.fa");
		
		open(fasta, "temp\_$j.fa")|| die "The simulation didn't work\n";
		while($line = <fasta>){
			
			chomp $line;
			if($line =~ />/){
					
				$name = $line;	
						
			}else{
				
				$HASH{$name} = $line;
				
			}
			
		}
		system("rm temp*.fa");
		if($j == 0){

			open(out, ">RateGene.fa")||die "not sure how";
			print out ">taxon_1\n$HASH{\">taxon1_o2\"}\n";
			print out ">taxon_2\n$HASH{\">taxon2_o1\"}\n";
			print out ">taxon_3\n$HASH{\">taxon3_o1\"}\n";
			print out ">taxon_4\n$HASH{\">taxon4_o2\"}\n";
			print out ">taxon_5\n$HASH{\">taxon5_o2\"}\n";
			print out ">taxon_6\n$HASH{\">taxon6_o1\"}\n";
		
		}else{
		
			open(out2, ">NonRateGene$j.fa")||die "not sure how";
		
			print out2 ">taxon_1\n$HASH{\">taxon1_o1\"}\n";
			print out2 ">taxon_2\n$HASH{\">taxon2_o1\"}\n";
			print out2 ">taxon_3\n$HASH{\">taxon3_o1\"}\n";
			print out2 ">taxon_4\n$HASH{\">taxon4_o1\"}\n";
			print out2 ">taxon_5\n$HASH{\">taxon5_o1\"}\n";
			print out2 ">taxon_6\n$HASH{\">taxon6_o1\"}\n";
		}
				
	}
	system("pxcat -s *Rate*.fa -p super.parts -o super.matrix");
	system("rm *Rate*.fa");
	system("perl $script super.matrix super.parts $comp_tree out");
	system("mv ForR $i\_GWLL.txt");
	system("mv ForRcorrected $i\_SSLL.txt");
	system("rm RAxML_* out super.matrix super.parts");
}