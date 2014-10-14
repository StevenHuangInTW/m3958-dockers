#!/usr/bin/env perl

use feature ':5.10';
use Getopt::Long;
use JSON;
use Data::UUID;

use constant DATA_VOL_PATH => '/m3958dir/data';
use constant WEB_VOL_PATH => '/www/html';
use constant SUPERVISORD_LOG_PATH => '/var/log/supervisor';
use constant CONFIG_VOL_PATH => '/m3958dir/config';

my $ug = Data::UUID->new;

say $ug->to_string($ug->create());
say $ug->create_str();
my $json = JSON->new->allow_nonref->loose->allow_barekey;

my $appdsc_json = <<APP_DSC;
{
  app_name: "piwik",
  containers: [
    {
      service_name: "nginx",
      log_path: "/var/log/nginx",
      supervisord_log: true,
      data_vol: false
    }
  ]
}

APP_DSC

my $appdsc = $json->decode($appdsc_json);

say $appdsc->{app_name};

#volume_type: service,config-vol, log-vol, data-vol, web-vol, supervisord-log-vol

sub get_volume_name {
  my ( $instance_id, $app_name, $service_name, $volume_type) = @_;
  $app_name = 'appname' unless ($app_name);
  given ( $volume_type ) {
    when ('service') {
      return $app_name . '-' . $service_name . '-service-' . $instance_id
    }
    when ('config-vol') {
      return $app_name . '-' . $service_name . '-config-vol-' . $instance_id
    }
    when ('log-vol') {
      return $app_name . '-' . $service_name . '-log-vol-' . $instance_id
    }
    when ('data-vol') {
      return $app_name . '-' . $service_name . '-data-vol-' . $instance_id
    }
    when ('web-vol') {
      return $app_name . '-web-vol-' . $instance_id
    }
    when ('supervisord-log-vol') {
      return $app_name . '-' . $service_name . '-data-vol-' . $instance_id
    }
    default {
      return ""
    }
  }
}

sub prepare_volumes {
  my $app_name='';
  my $service_name='';
  my $log_path='';
  my $supervisord_log='';
  my $data_vol='';
  my $web_vol='';
  my $instance_id='';

  GetOptions(
    'app-name=s' => \$app_name,
    'service-name=s' => \$service_name,
    'log-path=s' => \$log_path,
    'instance-id=s' => \$instance_id,
    'supervisord-log' => \$supervisord_log,
    'web-vol' => \$web_vol
  );
}

#for my $i (1 ,2 ,3, 4, 5) {
#  say $i
#}
#
#for my $i (1 ,2 ,3, 4, 5) {
#  print $i
#}
#
#my @one_to_ten = (1..10);
#my $top_limit = 25;
#
#for my $i (@one_to_ten, 15, 20..$top_limit) {
#  say $i
#}

my $a=1;
#0,"0","",undefined,()
print("postfix if") if ($a == 1);

#qw
print(qw#a b c#);
#q// qq//

print qq#we can put '"' in qq// #;

#my $verbose='';
#my $insid='';
#
#my @vol_froms=();
#
#GetOptions('verbose' => \$verbose,
#  'insid=s' => \$insid,
#  'volumes-from=s' => \@vol_froms);
#
#say "verbose value is:", $verbose;
#say "insid value is:", $insid;
#say "vol_froms value is:", scalar(@vol_froms);
#say "Hi there!";
#
#for $i (@ARGV) {
#  say $i;
#}
#say "perl file argument end.";
