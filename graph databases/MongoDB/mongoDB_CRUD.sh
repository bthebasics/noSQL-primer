CRUD ( CRUD - create Read update and delete )

1) create / insert
3) update 
4) remove 
5) 2) read 

( find ) / findone
******************************
Import of data : 
find with predicate/ project / new fields / operators / sort / where 
$regex / limit / skp

=================
Aggregates and joins 

db.mcu_characters.insert({
    mcu_character :  "ironman",
    played_by : "Robert Downey Jr.",
    movies : [ "avengers", "ironman_series"]
})


db.mcu_characters.insertMany([{
    mcu_character :  "Spiderman",
    played_by : "Tom Holland",
    movies : [ "Spiderman Homecoming", "avengers infinity War"]
},
{
    mcu_character :  "Hulk",
    played_by : "Mark Ruffalo",
    movies : [ "avengers", "avengers endgame"]
},
{
    mcu_character :  "Hulk",
    played_by : "Mark Ruffalo",
    movies : [ "avengers", "avengers endgame"]
}])

db.mcu_character.find()

--================


db.mcu_character.update(
    { _id : ""},
    {
        $set:
        {
            quantity: 500,
            played_by : "Mark Ruffalo12",
            tags: [ "coats", "outerwear", "clothing" ]
        }
    }
)



db.mcu_characters.update({ _id: ObjectId("5dc89396a0a8886530acfc0d") }, {
    $set: {
            quantity: 500,
            played_by : "Mark Ruffalo12",
            tags: [ "coats", "outerwear", "clothing" ]
    }
})


db.mcu_characters.update({ mcu_character :  "Hulk" }, {
    $set: {
             played_by : "Mark Ruffalo123"
    }
})

db.mcu_characters.update({ mcu_character :  "Hulk" }, {
    $set: {
             played_by : "Mark Ruffalo123"
    }
}
, { multi: true })


db.mcu_characters.deleteOne({ mcu_character :  "Hulk" })

db.mcu_characters.deleteMany({})
//The following example deletes all documents from the inventory collection:


