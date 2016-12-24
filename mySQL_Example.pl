use DBI;
 
## mysql user schema name
$db ="substation";
## mysql database user name
$user = "root";
 
## mysql database password
$pass = "root";
 
## user hostname : This should be "localhost" but it can be diffrent too
$host="localhost";
 
$dbh = DBI->connect("DBI:mysql:$db:$host", $user, $pass);

my $sql = "SELECT * FROM INVTRY";

my $sth = $dbh ->prepare($sql);

$sth -> execute() or die $DBI::errstr;

while(my @row = $sth -> fetchrow_array()){
	my ($sku,$description) = @row;
	print "$sku, $description\n"; 
}
 
$sth->finish;

exit(0);
