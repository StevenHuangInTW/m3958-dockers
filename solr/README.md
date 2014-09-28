Plugin code can be loaded into Solr by putting your classes into a JAR file, and then configuring Solr to know how to find them.

If you want to use multiple SolrCores, and have a plugin available to all of them, you can place your JAR files in a directory specified using the "sharedLib" attribute in your solr.xml file prior to starting your servlet container.

For loading plugins in individual SolrCores, you have two options:

Place your JARs in a lib directory in the instanceDir of your SolrCore. In the example program, the location is example/solr/lib. This directory does not exist in the distribution, so you would need to do mkdir for the first time.
use the lib directive in your solrconfig.xml file to specify an arbitrary JAR path, directory of JAR files, or a directory plus regex that JAR file names must match.
Loading plugins uses a custom Class Loader. It has been tested with a variety of Servlet Containers, but given the multitudes of servlet containers available in the wild it may not always work with every servlet container.
