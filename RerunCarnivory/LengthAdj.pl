use Data::Dumper;
open(conflict,$ARGV[0])||die "perl LengthAdj.pl ConflictFile GWLL Parts";
while($line = <conflict>){

	chomp $line;
	@array = split "\t", $line;
	$name = ($array[0] =~ m/(.*?)rr\./)[0];
	$HASH{$name} = $array[7];
	$suphash{$name} = $array[6];
}
open(parts, $ARGV[1])||die "perl LengthAdj.pl ConflictFile GWLL Parts";
while($line = <parts>){

	chomp $line;
	$line =~ m/DNA,(.*?)rr\..*?: (.*)/;
	$GWLL{$1} = $2;
	


}
open(parts, $ARGV[2])||die "perl LengthAdj.pl ConflictFile GWLL Parts";
while($line = <parts>){

	chomp $line;
	$line =~ m/DNA,(.*?)rr\..*?= (.*)/;
	$name = $1; $both = $2;
	@array = split "-", $both;
	$diff = $array[1] - $array[0] + 1;
	if(exists $HASH{$name}){
	
		$subs = $HASH{$name} * $diff;
		print "$name\t$subs\t$HASH{$name}\t$suphash{$name}\t$GWLL{$name}\n";
	
	}


}
