#
C:\Program Files\MongoDB\Server\4.0\bin>mongoimport.exe --collection chicago_crime --file C:\DataForCourses\ChicahoChrime.csv --type csv --headerline

MongoDB Enterprise > db.chicago_crime.count()
53475

MongoDB Enterprise > db.chicago_crime.find()

MongoDB Enterprise > db.chicago_crime.find({"Gender":"Male"})
