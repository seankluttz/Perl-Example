use DBI;
 
print "Content-type: text/html\n\n";
 
## mysql user database name
$db ="world";
## mysql database user name
$user = "root";
 
## mysql database password
$pass = "root";
 
## user hostname : This should be "localhost" but it can be diffrent too
$host="localhost";
 
$dbh = DBI->connect("DBI:mysql:$db:$host", $user, $pass);

my $sql = "SELECT * FROM city WHERE Name='Kabul'";

my $sth = $dbh ->prepare($sql);

$sth -> execute() or die $DBI::errstr;

while(my @row = $sth -> fetchrow_array()){
	my ($id,$name) = @row;
	print "$id, $name\n"; 
}
 
$sth->finish;

exit(0);
