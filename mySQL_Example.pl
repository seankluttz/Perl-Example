
use strict;
use warnings;
use DBI;
use Excel::Writer::XLSX;

## Set up DB information, take these in as environment vars in real system
##so no cleartext information is present.
my $db ="substation";
my $user = "root";
my $pass = "root";
my $host="localhost";
    
##Set up excel file with our information.  Sales information translated into bar chart
my $workbook = Excel::Writer::XLSX->new( 'Sales.xlsx' );
my $worksheet = $workbook->add_worksheet();
my $chart = $workbook->add_chart( type => 'bar', name=>'Sales', embedded=> 1);
my $rowNum = 3;
my $format = $workbook->add_format();
$format->set_bold();
$format->set_align('left');
$worksheet->write('A2','Sub Name',$format);
$worksheet->write('B2','SKU',$format);
$worksheet->write('C2','Num Sold',$format);

##Make call to DB for sales information
my $dbh = DBI->connect("DBI:mysql:$db:$host", $user, $pass);
my $sql = "SELECT D.SALES_UNITS, D.SKU, I.DESC FROM SUBSTATION.DLYSALES as D, SUBSTATION.INVTRY as I WHERE D.SKU = I.SKU";
my $sth = $dbh ->prepare($sql);
$sth -> execute() or die $DBI::errstr;

##loop through data and write to excel sheet.
while(my @row = $sth -> fetchrow_array()){
	my ($sale_units,$sku,$description,) = @row;
	$worksheet->write( 'A'.$rowNum,$description);
	$worksheet->write( 'B'.$rowNum,$sku);
	$worksheet->write( 'C'.$rowNum,$sale_units);
	$rowNum++;
}

##set up chart with data and add it to sheet.
$chart -> add_series (
		categories => '=Sheet1!$A$3:$A$'.$rowNum,
        values     => '=Sheet1!$C$3:$C$'.$rowNum
);
$chart->set_x_axis(name => 'Sales');
$chart->set_legend(none => 1);
$worksheet -> insert_chart('E2',$chart);
 
$sth->finish;
exit(0);
