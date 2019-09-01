// Aggregate framework -

db.yelpDataset.count()
db.yelpDataset.aggregate().count() // empty mongodb agg pipeline

// $match only 
db.yelpDataset.aggregate(
    {
        '$match': {
            categories : { 
                $exists : true
            }, // condition # 1
            stars : { $gt : 3
            }, // condition # 2
            state : 'AZ' // condition # 3
        }
        
    })

// usage - $match is not great for regular filtering but should check for fields which exists and not null
// conditional

db.yelpDataset.aggregate(
    {
        '$match' : {
            categories : {
                $exists : true
            }
        }

    }
)

// $project
// choose the selective fields - or create new or alias 

// example # 1 - selective fields and drop fields 

db.yelpDataset.aggregate(
    {
        '$project' : {
            categories : 1,
            name : 1,
            address : 1,
            _id : 0
            
        }

    }
)


db.SalesTransactions.aggregate(
    {
        '$project' : {
            "Row ID":1,
            "Order Date" :1,
            "Region" : 1,
            "Sales":1,
            "Quantity":1,
            _id:0
        }
    }
)

// field renaming : 
db.SalesTransactions.aggregate(
    {
        '$project' : {
            rowID: "$Row ID",
            orderDate :"$Order Date",
            "Region" : 1,
            "Sales":1,
            "Quantity":1,
            _id:0
        }
    }
)


//Chaining $match and $project

db.SalesTransactions.aggregate(
    {
        '$match':{
            "Category" : "Technology"
        }
    },
    {
       '$project' : {
            rowID: "$Row ID",
            orderDate :"$Order Date",
            "Region" : 1,
            "Sales":1,
            "Quantity":1,
            _id:0
        }
    }
)

//Creating new fields with $project
db.SalesTransactions.aggregate(
    {
        '$project': {
            _id:0,
            'state_region': {
                $concat: ["$State",'-',"$Region"]
            }
        }
    }
)

// add additional field, along with other fields
db.SalesTransactions.aggregate(
    {
        '$addFields': {
            'state_region': {
                $concat: ["$State",'-',"$Region"]
            }
        }
    }
)

db.SalesTransactions.aggregate(
    {
        '$addFields': {
            'newfield': {
                $cond: { if: '$complaints', then: true, else: false}
            },
            'isProfitable': {
                $cond: { if: { '$gte': [ "$Profit", 10 ] },
                         then:"Yes",
                         else: "No"
            },
            complaints : '$complaints'
        }
    }
)

db.SalesTransactions.aggregate(
    {
        '$addFields': {
            'newfield': {
                $cond: { if: '$Category', then: true, else: false}
            },
            complaints : '$Category'
        }
    }
)


db.SalesTransactions.aggregate(
    {
        '$addFields': {
            'newfield': "ABC"
        }
    }
)

db.SalesTransactions.aggregate(
    {
        '$addFields': {
            'newfield': {
                $cond : {
                    "if": { "$eq": [ "$Profit", "10" ] },  // just checking eq
                     "then":"Yes",
                     "else":"No"
                }
            }
        }
    }
)


db.SalesTransactions.aggregate(
    {
        '$addFields': {
            'isProfitable': {
                $cond : {
                    "if": { "$gte": [ "$Profit", 5 ] }, // just checking gte
                     "then":"Yes",
                     "else":"No"
                }
            }
        }
    },
    {
        "$sort": { "$Profit" : -1 }
    },
    {
        "$limit": 12
    }
)


//$group
// grpup as whole collection
db.SalesTransactions.aggregate(
    {
        $group : {
            _id: 1
        }
    }
)


// grpup as multiple fields
db.SalesTransactions.aggregate(
    {
        $group : {
            _id: {
                state: "$State",
                segment : "$Segment"
                
            }
        }
    }
)

// $count 

db.SalesTransactions.aggregate(
    {
        $group : {
            _id: 1,
            count: {
                $sum:1
            }
        }
    }
)


db.SalesTransactions.aggregate(
    {
        $group : {
            _id: {
                state: "$State",
                segment : "$Segment"
                
            },
            count: {
                $sum:1
            }
        }
    },
    {
        "$sort": {
           "count": -1
        }
    },
    {
        "$project": {
            "state":1,
            "segment":1,
            "countByGroup": "$count"

        }
    }
)

