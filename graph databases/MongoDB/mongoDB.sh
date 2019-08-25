#
C:\Program Files\MongoDB\Server\4.0\bin>mongoimport.exe --collection chicago_crime --file C:\DataForCourses\ChicahoChrime.csv --type csv --headerline

MongoDB Enterprise > db.chicago_crime.count()
53475

MongoDB Enterprise > db.chicago_crime.find()

MongoDB Enterprise > db.chicago_crime.find({"Gender":"Male"})

## join two of the datasets using mongo DB

db.SalesTransactions.aggregate([
    {$lookup: {
           from: "managerByRegion",
           localField: "Region",
           foreignField: "Region",
           as: "Person"
         }}, ## lookup data
    {$unwind: "$Person"},  ## name the collectionou
    {$project: { "Row ID":1, "Region":1,_id:0, ManagerName: "$Person.Person" }}, ## select the fields
    {$out: "output-collection"} ## store output in the diff collection
    ]
    )
## additional fields in output
db.SalesTransactions.aggregate([
    {$lookup: {
           from: "managerByRegion",
           localField: "Region",
           foreignField: "Region",
           as: "Person"
         }},
    {$unwind: "$Person"}, 
    {$project: { "Row ID":1, "Region":1,_id:0, ManagerName: "$Person.Person", "Discount":1,"Sales":1,"Quantity":1,"Order ID":1 }},
    {$out: "output-collection"}
    ]
    )
  ## display 
  db.getCollection("output-collection").find({})
   .projection({})
   .sort({_id:-1})
   .limit(20)  

## drop collection 
db.getCollection("output-collection").drop()

## java scripts - mongo
db.getCollection("output-collection").aggregate({
    $group: { _id: "$Region", total: {$sum: 1}}})
    
    
 db.getCollection("output-collection").aggregate([
     {
       $group:
         {
           _id:  "$Region"  ,
           totalAmount: { $sum: { $multiply: [ "$Sales", "$Quantity" ] } },
           count: { $sum: 1 }
         }
     }
   ]
    ) 


   ## with match keyword 
 db.getCollection("output-collection").aggregate([
    {$match : {Region:/outh/}},  
     {
       $group:
         {
           _id:  "$Region"  ,
           totalAmount: { $sum: { $multiply: [ "$Sales", "$Quantity" ] } },
           count: { $sum: 1 }
         }
     }
   ]
    ) 

##example

db.sales.aggregate([
     {
       $group:
         {
           _id: { day: { $dayOfYear: "$date"}, year: { $year: "$date" } },
           totalAmount: { $sum: { $multiply: [ "$price", "$quantity" ] } },
           count: { $sum: 1 }
         }
     }
   ])

### function to print Schema of the collection :
var schemaObj = db.getCollection("output-collection").findOne();
# https://medium.com/@ahsan.ayaz/how-to-find-schema-of-a-collection-in-mongodb-d9a91839d992
function printSchema(obj, indent) {
    for (var key in obj) {
        if(typeof obj[key] != "function"){     //we don't want to print functions
            var specificDataTypes=[Date,Array];    //specify the specific data types you want to check
            var type ="";
            for(var i in specificDataTypes){       // looping over [Date,Array]
                if(obj[key] instanceof specificDataTypes[i]){      //if the current property is instance of the DataType
                        type = "==is_" + specificDataTypes[i].name + "==";    //get its name
                        break;
                }
            }
            print(indent, key, typeof obj[key], type) ;    //print to console (e.g roles object is_Array)
            if (typeof obj[key] == "object") {             //if current property is of object type, print its sub properties too
                printSchema(obj[key], indent + "\t");
            }
        }
    }
};
printSchema(schemaObj,"");   

## links for SQL to mongo shell - index creation 