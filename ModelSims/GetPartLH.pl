while($line = <>){

	if($line =~ /P/){
		@array = split " ", $line;
	
	$short = $array[1] / 1000;
	#$long = $array[2] / 1000;
	print "$short\n";
	#print "$long\n";
	}
}
