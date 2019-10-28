REST API

:GET http://localhost:7474/db/data/

lets start with neo4j browser interface - 

Lets start with creating the nodes - 
Syntax for creating the node is as below 



CREATE (nodename)


you can create multiple nodes in the one go - 
create (corona)
create (Heineken) return (Heineken)
create (corona),(kingfisher)

MATCH (n) RETURN n

A label in Neo4j is used to group (classify) the nodes using labels. 
You can create a label for a node in Neo4j using the CREATE clause.

you can tag multiple labels to single nodes - 
create (corona:demestic:light) return corona

---- Creating the labels 
//CREATE (Dhawan:person:player) 

// Creating the nodes with properties
creATE (beer_4232:Beer {name: "Brune (Brown)", abv: 6.8 }) RETURN beer_4232

in order to select the caption of the node - click the labels - and select the size / color and property of the caption.
here in this example - we will choose : name as caption for node type : person.

//Now lets create relationship between the nodes - 
//first lets create the nodes - 
Syntax for defining the relation is as 
MATCH (n:label)<-[r]-(m) RETURN n,m


//node for player - and node for country
create (beer_853:Beer {name: "Rochefort 8", abv: 9.2 })
cREATE (brewery_7:Brewery {name: "Abbaye Notre Dame du St Remy", address1: "Rue de l'Abbaye 8", city: "Rochefort", state:"Namur", country: "Belgium", code: "", latitude: "50.1999", longitude: "5.2277",  phone: "32-084/22.01.47", website:""})

now to define the relationship, specify the nodes and direction - as the nodes.
create (beer_853) - [:BREWED_AT] -> (brewery_7) return (beer_853)

//CREATE (Dhawan:player{name: "Shikar Dhawan", YOB: 1985, POB: "Delhi"}) 
//CREATE (Ind:Country {name: "India"})
//CREATE (Dhawan)-[r:BATSMAN_OF]->(Ind) 




-- Creating a Relationship Between the Existing Nodes
-- syntax pattern : 
MATCH (a:LabeofNode1), (b:LabeofNode2) 
   WHERE a.name = "nameofnode1" AND b.name = " nameofnode2" 
CREATE (a)-[: Relation]->(b) 
RETURN a,b 

// sample data
CREATE (beer_4541:Beer {name: "Amstel Light", abv: 3.5 })
CREATE (brewery_37:Brewery {name: "Amstel Brouwerij", address1: "Antwoordnummer 7181", city: "Amsterdam", state:"", country: "Netherlands", code: "", latitude: "52.3738", longitude: "4.8909",  phone: "800-022-9885", website:"http://www.amstel.com"})
CREATE (category_8:Category {category: "North American Lager"})
CREATE (style_96:Style {style: "American-Style Light Lager"})

// show case sensetivity :
Cypher is case sensetive , if you use "style" vs "Style" - they would be trated differently.

MATCH (a:Beer), (b:Brewery),(c:Category),(d:style) // show style as lowercase
    where a.name = "Amstel Light" and b.name = "Amstel Brouwerij" and c.category = "North American Lager" and d.style = "American-Style Light Lager"
CREATE (a)-[:BREWED_AT] -> (b),
(a)-[:BEER_CATEGORY {taste: "dry"}] -> (c),
(a)-[:BEER_STYLE]-> (d)
return a,b,c,d


MATCH (a:Beer), (b:Brewery),(c:Category),(d:Style)
    where a.name = "Amstel Light" and b.name = "Amstel Brouwerij" and c.category = "North American Lager" and d.style = "American-Style Light Lager"
CREATE (a)-[:BREWED_AT] -> (b),
(a)-[:BEER_CATEGORY] -> (c),
(a)-[:BEER_STYLE]-> (d)
return a,b,c,d

// CREATE (beer_4541) - [:BREWED_AT] -> (brewery_37)
//(beer_4541) - [:BEER_CATEGORY] -> (category_8),
// (beer_4541) - [:BEER_STYLE] -> (style_96),


MATCH (a:player), (b:Country) WHERE a.name = "Shikar Dhawan" AND b.name = "India" 
CREATE (a)-[r: BATSMAN_OF]->(b) 
RETURN a,b 

// create relationships with properties
(a)-[:BEER_CATEGORY {taste: "dry"}] -> (c),
MERGE (beer_4541:Beer) return beer_4541




MERGE command is a combination of CREATE command and MATCH command.
MERGE command searches for a given pattern in the graph. If it exists, then it returns the results.
If it does NOT exist in the graph, then it creates a new node/relationship and returns the results.

Merge a node with label
Merge a node with properties
OnCreate and OnMatch
Merge a relationship

CREATE (beer_4541:Beer {name: "Amstel Light", abv: 3.5 })
CREATE (brewery_37:Brewery {name: "Amstel Brouwerij", address1: "Antwoordnummer 7181", city: "Amsterdam", state:"", country: "Netherlands", code: "", latitude: "52.3738", longitude: "4.8909",  phone: "800-022-9885", website:"http://www.amstel.com"})

the usage of OnCreate and OnMatch clauses in Neo4j. If the specified node already exists in the database, then the node will be matched and the property with key-value pair isFound = "true" will be created in the node.

MERGE (beer_4541:Beer {name: "Amstel Light", abv: 3.5 }) 
ON CREATE SET beer_4541.isCreated = "true"
ON MATCH SET beer_4541.isFound = "true"
RETURN beer_4541

MERGE (beer_4541:Beer {name: "Amstel Light", abv: 3.5, quantity: "16oz" })
return beer_4541

Example
Following is a sample Cypher Query which merges a relationship using the MATCH clause in Neo4j. This query tries to merge a relationship named WINNER

MATCH (a:Country), (b:Tournament) 
   WHERE a.name = "India" AND b.name = "ICC Champions Trophy 2013" 
   MERGE (a)-[r:WINNERS_OF]->(b) 
RETURN a, b 


-- SET property on existing node :
Using Set clause, you can add new properties to an existing Node or Relationship, and also add or update existing Properties values.

MATCH (beer_4541:Beer {name: "Amstel Light", abv: 3.5 })  
SET beer_4541.popularity = 49
RETURN beer_4541


CREATE (beer_9090 {name: "Kinghfisher light", abv: 4.5, quantity: "16oz"})

MATCH (beer_9090 {name: "Kinghfisher light", abv: 4.5, quantity: "16oz"})
set beer_9090:Beer
return beer_9090


--CALL db.schema() to see the schem and relationships - 

To delete a particular node, you need to specify the details of the node in the place of “n” in the above query.

MATCH (n) DETACH DELETE n

MATCH (beer_9090 {name: "Kinghfisher light", abv: 4.5, quantity: "16oz"})
DETACH DELETE n

The REMOVE clause is used to remove properties and labels from graph elements (Nodes or Relationships).

The main difference between Neo4j CQL DELETE and REMOVE commands is −

DELETE operation is used to delete nodes and associated relationships.
REMOVE operation is used to remove labels and properties.


MATCH (beer_9090 {name: "Kinghfisher light", abv: 4.5, quantity: "16oz"})
remove beer_9090.quantity
return beer_9090


MATCH (Ishant:player {name: "Ishant Sharma", YOB: 1988, POB: "Delhi"}) 
DETACH DELETE Ishant

CREATE (Dhoni:player {name: "MahendraSingh Dhoni", YOB: 1981, POB: "Ranchi"})

MATCH (Dhoni:player {name: "MahendraSingh Dhoni", YOB: 1981, POB: "Ranchi"}) 
REMOVE Dhoni.POB 
RETURN Dhoni 

MATCH (Ishant:player:person {name: "Ishant Sharma", YOB: 1988, POB: "Delhi"}) 
REMOVE Ishant:player:person 
RETURN Ishant 

***
CREATE (Dhoni:player {name: "MahendraSingh Dhoni", YOB: 1981, POB: "Ranchi"}) 
CREATE (Ind:Country {name: "India", result: "Winners"}) 
CREATE (CT2013:Tornament {name: "ICC Champions Trophy 2013"}) 
CREATE (Ind)-[r1:WINNERS_OF {NRR:0.938 ,pts:6}]->(CT2013) 

CREATE(Dhoni)-[r2:CAPTAIN_OF]->(Ind)  
CREATE (Dhawan:player{name: "shikar Dhawan", YOB: 1995, POB: "Delhi"}) 
CREATE (Jadeja:player {name: "Ravindra Jadeja", YOB: 1988, POB: "NavagamGhed"})  

CREATE (Dhawan)-[:TOP_SCORER_OF {Runs:363}]->(Ind) 
CREATE (Jadeja)-[:HIGHEST_WICKET_TAKER_OF {Wickets:12}]->(Ind) 
***

MATCH (Ind:Country {name: "India", result: "Winners"})<-[: TOP_SCORER_OF]-(n) 
RETURN n.name

MATCH (player)  
WHERE player.country = "India" 
RETURN player 


MATCH (player)  
WHERE player.country = "India" AND player.runs >=175 
RETURN player 

MATCH (n) 
WHERE (n)-[: TOP_SCORER_OF]->( {name: "India", result: "Winners"}) 
RETURN n 


Match(n{name: "India", result: "Winners"})--(x)  
RETURN n, count(*) 


Match(n{name: "India", result: "Winners"})--(x)  
RETURN n, count(*) 


Create (Dhoni:player {name: "MahendraSingh Dhoni", YOB: 1981, POB: "Ranchi"}) 
RETURN Dhoni

CREATE (Ind:Country {name: "India", result: "Winners"}) 
CREATE (CT2013:Tornament {name: "ICC Champions Trophy 2013"}) 
RETURN Ind, CT2013 

CREATE (Ind)-[r1:WINNERS_OF {NRR:0.938 ,pts:6}]->(CT2013) 
CREATE(Dhoni)-[r2:CAPTAIN_OF]->(Ind) 
RETURN r1, r2 


Match (Dhoni:player {name: "MahendraSingh Dhoni", YOB: 1981, POB: "Ranchi"}) 
Return Dhoni.name, Dhoni.POB 

Match p = (n {name: "India", result: "Winners"})-[r]-(x)  
RETURN * 


Match (Dhoni:player {name: "MahendraSingh Dhoni", YOB: 1981, POB: "Ranchi"}) 
Return Dhoni.POB as PlaceOfBirth

Match (Dhoni:player {name: "MahendraSingh Dhoni", YOB: 1981, POB: "Ranchi"}) 
Return Dhoni.POB as PlaceOfBirth


CREATE(Dhawan:player{name:"shikar Dhawan", YOB: 1985, runs:363, country: "India"})
CREATE(Jonathan:player{name:"Jonathan Trott", YOB:1981, runs:229, country:"South Africa"})
CREATE(Sangakkara:player{name:"Kumar Sangakkara", YOB:1977, runs:222, country:"Srilanka"})
CREATE(Rohit:player{name:"Rohit Sharma", YOB: 1987, runs:177, country:"India"})
CREATE(Virat:player{name:"Virat Kohli", YOB: 1988, runs:176, country:"India"})

MATCH (n)  
RETURN n.name, n.runs 
ORDER BY n.runs 

MATCH (n) 
RETURN n 
ORDER BY n.age, n.name 


MATCH (n) 
RETURN n 
ORDER BY n.name 
LIMIT 3 


MATCH (n)  
RETURN n.name, n.runs 
ORDER BY n.runs DESC 
LIMIT 3 


MATCH (n) 
WITH n 
ORDER BY n.name DESC LIMIT 3 
RETURN collect(n.name) 


:GET http://localhost:7474/db/data/