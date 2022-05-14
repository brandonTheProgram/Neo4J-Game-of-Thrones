# Neo4J-Game-of-Thrones

# About
During my research into graph databases, I explored Neo4J with some training data. To learn Cypher and Neo4J, I used data from Game of Thrones to build graphs to show how each character is connected to their families and their royal houses. I explored using Neo4J Browser, Neo4J Bloom, and 3D Force Graph.
Browser is used as a query tool to run Cypher queries against your Neo4j graph data and view results. Bloom is used for visualizing graph data using search inputs. 3D Force Graph is a web component to represent a graph data structure in a 3-dimensional space using a force-directed iterative layout. By using JavaScript, a user is able to visualize their graph in the third dimension instead of the second. **In the end, I created a graph database of employees at my internship's company but that data is private so here is a GOT example.**

# How to Run
## Dataset
![GOT Dataset](https://user-images.githubusercontent.com/43584979/160971332-f026be57-ff24-4def-89b5-4ee8ee2ab3e8.png)

# Basic 2D Graph
The following will load the data into your database which will let you use Neo4J Browser and Bloom
1. Download and install Neo4JDesktop
2. Create a Local Database on Neo4JDesktop
3. Put the csv file in the imports folder for the pertaining database:
4. Path: (User)\.Neo4jDesktop\neo4jDatabases\(database name)\installation-4.1.0\import
5. Start Database and open it in Neo4JBrowser to connect to the server
6. Run the included Cypher code in the Browser to load the dataset into the database

## Neo4J Browswer
![GOT Browser](https://user-images.githubusercontent.com/43584979/160971346-4742d673-2db9-4b18-b952-b8852e70c274.png)

## Neo4J Bloom
![GOT Bloom](https://user-images.githubusercontent.com/43584979/160971342-2be1bb7b-7089-4be7-b3ca-ce0d260ac5ed.png)

# 3D Graph
The following will let you view your graph in 3D on the local browser
1.  Folow the steps 1-6 Above
2.	Must have Python
3.	Start Database and open it in Neo4JBrowser to connect to the server
4.	Open the command prompt where the index.html file is
5.	Run “python -m http.server” which connects the html file to port 8000
6.	Go to localhost:8000 on Google Chrome
7.	For the dataset to load, the database must already be open on Neo4JBrowser to establish a connection
8.	Watch as the graph comes to live in 3D

## 3D Force Graph
![GOT 3D Graph Force](https://user-images.githubusercontent.com/43584979/160971341-61853c87-44d2-4fdb-a1ef-19693d310f48.png)
