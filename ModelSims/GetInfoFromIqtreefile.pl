$count = 0;
while($line = <>){

	chomp $line;
	if($line =~ /SUBSTITUTION/){
		$count++;
	}
	if($count != 0){
		if($line =~ /   1  GTR/){
			#print "$line\n";
			$line =~ m/.*?\{(.*?),(.*?),(.*?),(.*?),(.*?)\}+.*?\{(.*?),(.*?),(.*?),(.*?)\}\+G4\{(.*?)\}/;
			print "$1,$2,$3,$4,$5,$6,$7,$8,$9,$10\n";
			#print "$line\n";
		}

	}

}
