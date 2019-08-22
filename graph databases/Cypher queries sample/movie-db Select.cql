MATCH (tom {name: "Tom Hanks"}) RETURN tom

MATCH (a1 {title: "Cloud Atlas"}) RETURN a1

MATCH (people:Person) RETURN people.name LIMIT 10

MATCH (nineties:Movie) WHERE nineties.released >= 1990 AND nineties.released < 2000 RETURN nineties.title