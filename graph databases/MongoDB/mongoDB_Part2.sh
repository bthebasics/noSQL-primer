// DB operations 
show collections
show dbs
show tables
db.getCollectionNames()
db.getCollection("yelpDataset").stats()

// collections 
db.createCollection('mammals')
db.getCollection("yelpDataset").stats()
db.getCollection("yelpDataset").totalIndexSize() //323584

// select / find operations 
db.getCollection("yelpDataset").findOne()
db.getCollection("yelpDataset").find()

db.getCollection("yelpDataset").find({$where : "this.postal_code == 85016 "}) // java script expression

db.getCollection("yelpDataset").find({})
db.getCollection("yelpDataset").find({},{_id:0}) // select all except _id 
db.getCollection("yelpDataset").find({ "attributes": null }, { name: 1, address: 1, city: 1 }).limit(5) // select only few fields
db.getCollection("yelpDataset").find({ "attributes": null }, { name: 1, address: 1, city: 1, _id: 0 }).limit(5) // select only few fields
db.getCollection("yelpDataset").find({ "attributes": null }, { _id: 0 }).limit(5) // select only few dox
db.getCollection("yelpDataset").find({ "postal_code": "85016" }).prettyPrint()
// regex explain plan
.db.getCollection("yelpDataset").find(
    { "postal_code": "85016", 
    "review_count": { "$gte": 7, "$lt": 12 } }
    )

//Double quotes quote object names (e.g. "field"). Single quotes are for strings 'string'
mb.runSQLQuery(`

       SELECT * FROM travel
       
`).sort({_id:-1})
  .limit(100)    
    

db.getCollection("yelpDataset").find({$where : "this.postal_code == 85016 "}).count()
db.getCollection("yelpDataset").count({$where : "this.postal_code == 85016 "})

// sort - 1 = ASC and -1 = DESC
db.getCollection("yelpDataset").find().sort({review_count:-1})
db.getCollection("yelpDataset").find().sort({stars:-1,review_count:-1})
db.getCollection("yelpDataset").find().sort({stars:-1,review_count:-1})

// cursors:
var ds = db.getCollection("yelpDataset").find();
while (ds.hasNext()) {
   print(tojson(ds.next()));
}

//mongoimport --db stocks --collection stocks --file stocks.json
    
db.travel.find({})
   .projection({})
   .sort({_id:-1})
   .limit(100)    

db.inventory.find(
   { status: "A" },
   { "size.uom": 0 }
)   

db.getCollection("yelpDataset").find({ address: { $regex: "Rd" } })
db.getCollection("yelpDataset").find({ "attributes.Alcohol": null }) // array and structs
db.getCollection("yelpDataset").find({ "attributes": null }).limit(5)


db.getCollection("yelpDataset").find({ "attributes.Alcohol": { $exists: true } })
db.getCollection("yelpDataset").find({ "attributes.BusinessParking": { $exists: true } })

db.getCollection("yelpDataset").createIndex({ "city": 1, "postal_code": 1 }, { "background": true })

db.getCollection("travel").find({ attributes: { $all: ["Alcohol"] } })



/*
show collections

show dbs


show collections
show tables

db.getCollectionNames()

db.chicago_crime.find().pretty()
*/


db.getCollection("yelpDataset").findOne()
db.getCollection("yelpDataset").find()
db.getCollection("yelpDataset").find({"postal_code" : "85016"})
db.getCollection("yelpDataset").find({"postal_code" : "85016"}).prettyPrint()
db.getCollection("yelpDataset").find({"postal_code" : "85016", "review_count":{ "$gte" : 7, "$lt": 12}})

db.getCollection("yelpDataset").find({address:{$regex:"Rd"}})
db.getCollection("yelpDataset").find({"attributes.Alcohol": null}) 
db.getCollection("yelpDataset").find({"attributes.Alcohol": {$exists: true}}) 

db.getCollection("yelpDataset").find({"attributes.BusinessParking": {$exists: true}})
db.getCollection("yelpDataset").find({"attributes": {$exists: true}})

db.getCollection("yelpDataset").createIndex({ "city": 1, "postal_code": 1 }, { "background": true })
