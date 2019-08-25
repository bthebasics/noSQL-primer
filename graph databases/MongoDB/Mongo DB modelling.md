# Mongo DB modelling

There are multiple patterns to be considered while modelling mongo DB collections - 

References : <https://www.slideshare.net/mongodb/advanced-schema-design-patterns-80958599>

Lets start with building blocks for Mongo DB - 

- Server 
  - Database 
    - Collections
    - Attributes
    - indexes



**Pattern # 1: Attributes**

​	While designing the attributes, 

- if there are similar fields, 
- common characteristics to search across the fields together
- if field present in small subset of the documents



examples : 

1. release dates of movies across various countries
2. Product attributes like 'color', 'size' e.t.c.

Solutions ; fields pairs in arrays 



**Pattern # 2: Working Set does not fit in RAM**

- reduce size of working SET  ( subset the list or limit the results to 20 )
- add more RAM per machine
- Start sharding or add more shards
  - more frequent or logical entries to be copied into the main document
    - list reviews 
    - list the actors of a movie
    - keep duplicates of a small subset in the main collections - 
    - one query to bring all the info for the main page



**Pattern # 3: Congestion and frequent reads and compute caused by repeated calculations**

- Review count from normalized review collection 
- frequent calculations, multiple reads and writes
- Apply a computation on data and store the result 
- lots of write - for non critical data, give approximation counts or data - 
- some time calculations could be too expensive to be calculated frequently and not even as important to do so, hence we can do approximation calc or 



**Pattern # 4: Schema Versioning**













