create database piwikdb_name
create user 'piwikuser'@'%' identified by 'xxxxx';
grant select,insert,update,delete,create,drop,alter,create temporary tables,lock tables on piwikdb_name.* to 'piwikuser'@'%' with grant option;
