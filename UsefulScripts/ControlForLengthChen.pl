open(parts, $ARGV[0])||die "perl *.pl PartsFile GeneWise\n";
while($line = <parts>){

	chomp $line;
	$line =~ m/AA, (.*?)\.refined\.fas = (.*?)-(.*)/;
	$diff = $3 - ($2 - 1);
	$HASH{$1} = $diff;

}
print "gene\tgwll\tavg_gwll\n";
open(likelihoods, $ARGV[1])||die "perl *.pl PartsFile GeneWise\n";
while($line = <likelihoods>){

	chomp $line;
	@array = split " ", $line;
	$gwll = ($array[3] - $array[5]);
	$gwll_avg = ($array[3] - $array[5]) / $HASH{$array[0]};
	print "$array[0]\t$gwll\t$gwll_avg\n";
	
	
}
