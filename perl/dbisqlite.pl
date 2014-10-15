#!/usr/bin/env perl

use feature ':5.20.1';
use DBI;

use constant DSN => "dbi:SQLite:dockers.db";

=for comment
available command:
list: app,images
add: app, images
start appname
stop appname
debug containername

schemas:
image: id,name,tag,dsc,itype
  itype: service, vol
apptpl: id,name,dec
containertpl: id, imgId,cport,
app: id,name,dsc
container: id,apptplId,imgId,name,ctype,volumesFrom,cid,cport,hport,linkTo
  ctype: service, service-vol, web-vol

=cut

my @ary = DBI->available_drivers();
print join("\n", @ary), "\n";

my $dbh = DBI->connect ( DSN, "", "", {
    RaiseError => 1,
    AutoCommit => 0
  }) or die $DBI::errstr;

$dbh->do("CREATE TABLE image(Id INTEGER PRIMARY KEY, Name TEXT)") unless (grep(qr/^Friends$/, $dbh->tables()));

$dbh->commit;

ENTRYPOINT: while (<STDIN>) {
  say $_;
  chomp;
  if (/^exit$/ || /^quit$/) {last ENTRYPOINT}
  if (/^querydocker$/) {
    my @allcontainers = qx/docker ps -a/;
    print join("\n", @allcontainers), "\n";
    say "done!";
  }
  if (/^rundocker$/) {
    my @cmd = ("docker", "run", "-it", "m3958/base:201401", "/bin/bash");
    system(@cmd);
    say "done!";
  }
}

$dbh->disconnect();

#$sth->finish();
#$dbh->do("CREATE TABLE Friends(Id INTEGER PRIMARY KEY, Name TEXT)") unless (grep(qr/^Friends$/, $dbh->tables()));
#$dbh->do("INSERT INTO Friends(Name) VALUES ('Tom')");
#$dbh->do("INSERT INTO Friends(Name) VALUES ('Rebecca')");
#$dbh->do("INSERT INTO Friends(Name) VALUES ('Jim')");
#$dbh->do("INSERT INTO Friends(Name) VALUES ('Robert')");
#$dbh->do("INSERT INTO Friends(Name) VALUES ('Julian')");
#
#    
#my $id = $dbh->last_insert_id("", "", "Friends", "");
#print "The last Id of the inserted row is $id\n";
#
#
#$sth = $dbh->prepare("SELECT * FROM Friends LIMIT 5");
#$sth->execute();
#
#my $row;
#while ($row = $sth->fetchrow_arrayref()) {
#    print "@$row[0] @$row[1] @$row[2]\n";
#}


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
#
#my $sth = $dbh->prepare("SELECT SQLITE_VERSION()");
#
#$sth->execute();
#
#my $ver = $sth->fetch();
#say @$ver;
#my @ary = DBI->available_drivers();
#print join("\n", @ary), "\n";
