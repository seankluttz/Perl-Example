# Perl Example
A lot of developers like to hate on Perl, many say that it's ancient and that you should be using Python instead nowadays.  The truth is that Perl comes preinstalled on almost every linux distro and many enterprises have plenty of PERL scripts that are not going away.  So instead of fighting it, let's see how easy it is to use for a common business request: query a database and output daily sales numbers into an excel spreadsheet.

For our database, we will use MySql Community Edition.  Lets create a schema for our fictional sub shop, called 'substation'.  Within the schema, lets create two tables called 'INVTORY' and 'DLYSALES'.  The 'INVTORY' table will hold information on the subs we sell.  The 'DLYSALES' table will hold how many subs we have sold for the day.  Both are pictured below.

![alt tag title="Invetory Table"](https://raw.githubusercontent.com/seankluttz/perlExample/master/SandwichTable.PNG)

![alt tag title="Sales Table"](https://raw.githubusercontent.com/seankluttz/perlExample/master/SalesTable.PNG)

Now lets write our script to hit the database and write out our information to our xlsx file.  The process is very straightforward.

1) Import the necessary Perl packages.  We need DBI to connect to the database and Excel::Writer::XLSX to write to an excel file.

2) Set up database connection information. In a real prod environment, set these up as environment variables.

3) Set up worksheet in excel file.  Headers for data and chart initialization.

4) Query database.  Loop through output and write rows to our spreadsheet.

5) Use the data to create our bar chart.

And that is it.  All in about 50 lines of code, not bad at all!  The output looks pretty good as well.  Put a shell script in front of this and add it to Cron and you have a good old fashioned batch job.  Happy coding.

![alt tag title="Sales Table"](https://raw.githubusercontent.com/seankluttz/perlExample/master/SalesOutput.PNG)




