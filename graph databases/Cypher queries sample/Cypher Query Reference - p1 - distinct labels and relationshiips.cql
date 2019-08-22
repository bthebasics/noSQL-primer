MATCH (tom {name: "Tom Hanks"}) RETURN tom

MATCH (m1 {title: "Cloud Atlas"}) RETURN m1
MATCH (m1 {title: "Cloud Atlas"})  RETURN distinct m1
MATCH (m1 {upper(title): upper("Cloud Atlas")})  RETURN distinct m1


MATCH (people:Person) RETURN people.name LIMIT 10

MATCH (people:Person) RETURN people.name LIMIT 10

/**/
:schema
CALL db.indexes();


MATCH (n) RETURN distinct labels(n), count(*)
MATCH (n) RETURN distinct labels(n)

MATCH (n)
WITH DISTINCT labels(n) AS labels
UNWIND labels AS label
RETURN DISTINCT label
ORDER BY label

call db.labels();

/* https://neo4j.com/developer/kb/viewing-schema-data-with-apoc/ */

CALL apoc.meta.schema() YIELD value as schemaMap
UNWIND keys(schemaMap) as label
WITH label, schemaMap[label] as data
WHERE data.type = "node"
UNWIND keys(data.properties) as property
WITH label, property, data.properties[property] as propData
RETURN label,
property,
propData.type as type,
propData.indexed as isIndexed,
propData.unique as uniqueConstraint,
propData.existence as existenceConstraint


-- distinct relationships 
MATCH p =(n)-[r]->(b)
RETURN *

MATCH (n)-[r]->(b)
RETURN distinct type(r)

MATCH (n)-[r]->()
RETURN distinct type(r)


match n-[r]-()
return distinct labels(n), type(r)



https://www.remwebdevelopment.com/blog/sql/some-basic-and-useful-cypher-queries-for-neo4j-201.html
https://neo4j.com/developer/guide-sql-to-cypher/

** Data model https://dzone.com/refcardz/from-relational-to-graph-a-developers-guide?chapter=1