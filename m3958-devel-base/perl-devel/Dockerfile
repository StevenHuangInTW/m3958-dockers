FROM m3958/devel-base
MAINTAINER Libo Jiang <jianglibo@gmail.com>

RUN yum -y install perl perl-ExtUtils-MakeMaker perl-ExtUtils-Install perl-ExtUtils-Manifest perl-ExtUtils-ParseXS perl-ExtUtils-CBuilder perl-ExtUtils-Embed gcc

# we will build this image mannually
export PERLBREW_ROOT=/opt/perl5
perl -MCPAN -e "install App::perlbrew"

perl init
perlbrew install 5.20.1
perlbrew switch perl-5.20.1
echo "export PERLBREW_ROOT=/opt/opt5" >> ~/.bash_profile
echo "source ${PERLBREW_ROOT}/etc/bashrc" >> ~/.bash_profile
curl get.mojolicio.us | sh


RUN curl -L http://cpanmin.us | perl - App::cpanminus
RUN cpanm Getopt::Long JSON Data::UUID YAML::XS DBI
RUN cpanm GCatalyst::Devel Task::Catalyst::Tutorial

#RUN curl -LO http://xrl.us/cpanm
#RUN mv cpanm /usr/bin/
#RUN chmod +x /usr/bin/cpanm

#RUN cpanm --mirror http://mirrors.163.com/cpan Getopt::Long JSON Data::UUID YAML::XS
#RUN cpanm  --mirror http://mirrors.163.com/cpan GCatalyst::Devel Task::Catalyst::Tutorial

RUN cpanm Getopt::Long JSON Data::UUID YAML::XS
RUN cpanm GCatalyst::Devel Task::Catalyst::Tutorial

# perl module install in /usr/local/lib64/perl5
# if you create volume here, you will not able to change content in it.
# you must create a named data volume from this image, then share to others
# make change data persist.
 
#RUN yum -y install java-1.7.0-openjdk.x86_64 java-1.7.0-openjdk-devel.x86_64

