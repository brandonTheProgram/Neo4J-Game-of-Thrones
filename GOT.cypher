//Delete the database and clear the nodes
MATCH (n)
DETACH DELETE n;

//Create the people nodes
:auto USING PERIODIC COMMIT 10000
LOAD CSV WITH HEADERS FROM 'file:///GOT.csv' AS line
MERGE (c:Person { 
    name: line.Character,
    actor: line.Actor,
    episodes: toInteger(line.Episodes_appeared),
    first_appeared: toInteger(line.First_appearance),
    last_appeared: toInteger(line.Last_appearance),
    mother: line.Mother,
    father: line.Father,
    house: line.House});

//Create the house nodes
:auto USING PERIODIC COMMIT 10000
LOAD CSV WITH HEADERS FROM 'file:///GOT.csv' AS line
MERGE (c:House{name: line.House});

//DELETE UNKNOWN House
MATCH (n:House{name: 'Unknown'})
DELETE n;

// Create Mother Relationships
:auto USING PERIODIC COMMIT 10000
LOAD CSV WITH HEADERS FROM 'file:///GOT.csv' AS line
MATCH (p1:Person {name: line.Mother})
MATCH (p2:Person {name: line.Character})
WHERE NOT p1.name = 'Unknown'
MERGE (p1)-[:MOTHER]->(p2);

// Create Mother Relationships
:auto USING PERIODIC COMMIT 10000
LOAD CSV WITH HEADERS FROM 'file:///GOT.csv' AS line
MATCH (p1:Person {name: line.Father})
MATCH (p2:Person {name: line.Character})
WHERE NOT p1.name = 'Unknown'
MERGE (p1)-[:FATHER]->(p2);

// Create the House Relationships
:auto USING PERIODIC COMMIT 10000
LOAD CSV WITH HEADERS FROM 'file:///GOT.csv' AS line
MATCH (p1:Person {name: line.Character})
MATCH (h1:House {name: line.House})
WHERE NOT p1.house = 'Unknown'
MERGE (h1)-[:HOUSE]->(p1);

//// Get the name of all the characters in the show
// MATCH (person:Person)
// RETURN person.name;

//// Get every character with more than 25 episodes
// MATCH (person:Person)
// WHERE person.episodes > 25
// RETURN person.name, person.episodes;

//// Find all people that start with an A in their name
// MATCH (person:Person)
// WHERE person.name STARTS WITH 'A'
// RETURN person.name;

//// Find all people with Lannister in their name
// MATCH (person:Person)
// WHERE person.name CONTAINS 'Lannister'
// RETURN person.name;

//// Find all people that appeared after 2015 (out of numerical order)
// MATCH (person:Person)
// WHERE person.first_appeared >= 2015
// RETURN person.name, person.first_appeared;

//// Find all people that appeared after 2015 (in acending numerical order)
// MATCH (person:Person)
// WHERE person.first_appeared >= 2015
// RETURN person.name, person.first_appeared
// ORDER BY person.first_appeared;

//// Find all people that appeared after 2015 (in descending numerical order)
// MATCH (person:Person)
// WHERE person.first_appeared >= 2015
// RETURN person.name, person.first_appeared
// ORDER BY person.first_appeared DESC;

//// Find a character like Jon Snow
// MATCH (p:Person)
// WHERE p.name = 'Jon Snow'
// RETURN p;

//// Find the house node of Jon Snow
// MATCH (house:House)-[:HOUSE]->(p:Person)
// WHERE p.name = 'Jon Snow'
// RETURN house

//// Find all nodes with relationship to Stark House
// MATCH (house:House)-[:HOUSE]->(person)
// WHERE house.name = 'Stark'
// RETURN person.name
