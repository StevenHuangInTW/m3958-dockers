enter solr/exampledocs where post.jar exist.

java -jar post.jar solr.xml monitor.xml

java -Durl=http://xxxx/solr/update -jar post.jar solr.xml monitor.xml

http://localhost:8983/solr/collection1/select?q=solr&wt=xml

java -Ddata=args -Dcommit=false -jar post.jar "<delete><id>SP2514N</id></delete>"

visit:

http://virtualmachineip/solr
