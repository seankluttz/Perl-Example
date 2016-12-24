# Perl Example
A lot of developers like to hate on Perl as a scripting langauge, many saying that it's ancient and that you should be using Python instead nowadays.  The truth is that Perl comes preinstalled on almost every linux distro and many enterprises have plenty of PERL scripts that are not going away.  So instead of fighting it, let's see how easy it is to use for a common business request: query a database and output daily sales numbers into an excel spreadsheet.

For our database, we will use MySql Community Edition.  Lets create a schema for our fictional sub shop, called 'substation'.  Within the schema, lets create two tables called 'INVTORY' and 'DLYSALES'.  The 'INVTORY' table will hold information on the subs we sell.  The 'DLYSALES' table will hold how many subs we have sold for the day.  Both are pictured below.

![alt tag title="Invetory Table"](https://raw.githubusercontent.com/seankluttz/perlExample/master/SandwichTable.PNG)

![alt tag title="Sales Table"](https://raw.githubusercontent.com/seankluttz/perlExample/master/SalesTable.PNG)



