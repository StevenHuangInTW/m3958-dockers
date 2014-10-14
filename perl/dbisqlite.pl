#!/usr/bin/env perl

use feature ':5.10';
use DBI;
my @ary = DBI->available_drivers();
print join("\n", @ary), "\n";


my $dbh = DBI->connect ( "dbi:SQLite:dbname=test.db", "", "", {
    RaiseError => 1,
    AutoCommit => 0
  }) or die $DBI::errstr;

my $sth = $dbh->prepare("SELECT SQLITE_VERSION()");

$sth->execute();

my $ver = $sth->fetch();
say @$ver;


$dbh->do("CREATE TABLE Friends(Id INTEGER PRIMARY KEY, Name TEXT)") unless (grep(qr/^Friends$/, $dbh->tables()));
$dbh->do("INSERT INTO Friends(Name) VALUES ('Tom')");
$dbh->do("INSERT INTO Friends(Name) VALUES ('Rebecca')");
$dbh->do("INSERT INTO Friends(Name) VALUES ('Jim')");
$dbh->do("INSERT INTO Friends(Name) VALUES ('Robert')");
$dbh->do("INSERT INTO Friends(Name) VALUES ('Julian')");

$dbh->commit;
    
my $id = $dbh->last_insert_id("", "", "Friends", "");
print "The last Id of the inserted row is $id\n";


$sth = $dbh->prepare("SELECT * FROM Friends LIMIT 5");
$sth->execute();

my $row;
while ($row = $sth->fetchrow_arrayref()) {
    print "@$row[0] @$row[1] @$row[2]\n";
}

$sth->finish();
$dbh->disconnect();

## for select
#$sth = $dbh->prepare("SELECT foo, bar FROM table WHERE baz=?";
#$sth->execute( $baz );
#while ( @row = $sth->fetchrow_array ) {
#  print "@row\n";
#}
## for non-select
#$sth = $dbh->prepare("INSERT INTO table(foo, bar, baz) VALUES (?, ?, ?)");
#
#while(<CSV>) {
#  chomp;
#  my ($foo,$bar,$baz) = split /,/;
#  $sth->execute($foo,$bar,$baz);
#}
## for non repeated non-select
#$rows_affected = $dbh->do("UPDATE your_table SET foo = foo + 1");
