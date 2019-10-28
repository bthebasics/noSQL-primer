-- options for neo browser : 
:clear
:help
:help create / merge / match etc.
    https://neo4j.com/developer/guide-cypher-basics/#CREATE




-- join and specific user 
MATCH (p:Person { name:"Tom Hanks" })-[r:ACTED_IN]->(m:Movie)
 RETURN m.title, r.roles

MATCH (p:Person)-[r:ACTED_IN]->(m:Movie) 
where p.name = "Tom Hanks" 
return m.title, m.roles


/* find the rings ?? */

/* create or display movie if does not exists ?? */


MERGE (m:Movie { title:"Cloud Atlas" })
ON CREATE SET m.released = 2012
RETURN m

-- Match intersection
-- https://community.neo4j.com/t/performing-match-intersection/309

== DROP DATABASE

It is weird that some properties are left behind. If you are looking for deleting all nodes and relationships along with their properties:


MATCH (n)
OPTIONAL MATCH (n)-[r]-()
DELETE n,r

If you would like to wipe the entire database and start from scratch:

Shutdown the server.
delete the configured directory rm -rf data/graph.db.
Start up the server again.
shareimprove this answer
