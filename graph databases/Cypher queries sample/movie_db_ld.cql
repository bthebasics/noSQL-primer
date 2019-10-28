CREATE (Action:Genre {name:'Action'})
CREATE (Comedy:Genre {name:'Comedy'})
CREATE (Romance:Genre {name:'Romance'})
CREATE (Scifi:Genre {name:'Sci-fi'})
CREATE (Adventure:Genre {name:'Adventure'})

CREATE (TheMatrix:Movie {title:'The Matrix', released:1999, tagline:'Welcome to the Real World'})
CREATE (Keanu:Actor {name:'Keanu Reeves', born:1964})
CREATE (Carrie:Actor {name:'Carrie-Anne Moss', born:1967})
CREATE (Laurence:Actor {name:'Laurence Fishburne', born:1961})
CREATE (Hugo:Actor {name:'Hugo Weaving', born:1960})
CREATE (LillyW:Actor {name:'Lilly Wachowski', born:1967})
CREATE (LanaW:Director {name:'Lana Wachowski', born:1965})
CREATE (JoelS:Actor {name:'Joel Silver', born:1952})
CREATE
  (Keanu)-[:ACTED_IN {roles:['Neo']}]->(TheMatrix),
  (Carrie)-[:ACTED_IN {roles:['Trinity']}]->(TheMatrix),
  (Laurence)-[:ACTED_IN {roles:['Morpheus']}]->(TheMatrix),
  (Hugo)-[:ACTED_IN {roles:['Agent Smith']}]->(TheMatrix),
  (LillyW)-[:DIRECTED]->(TheMatrix),
  (LanaW)-[:DIRECTED]->(TheMatrix),
  (JoelS)-[:PRODUCED]->(TheMatrix),
  (TheMatrix)-[:IN_GENRE]->(Action)
CREATE (Ryan:User {name:'Ryan mathew', born:1952, email:'ryan1975@gmail.com'})
CREATE (David:User {name:'David Lasaga', born:1983, email:'DaveLasaga@gmail.com'})
CREATE 
    (Ryan)-[:RATED {rating:4.5}]->(TheMatrix),
    (David)-[:RATED {rating:4.0}]->(TheMatrix)

