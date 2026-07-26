// MongoDB Lab — Restaurant Collection Queries (mongosh)
// Course : Databases (PostgreSQL & MongoDB) — M.Sc. IT Sem II
// Author : Darshilkumar Patel

MongoDB Lab Manual (mongosh Queries)

// Query 1
db.restaurants.find()

// Query 2
db.restaurants.find({}, {restaurant_id:1, name:1, borough:1, cuisine:1})

// Query 3
db.restaurants.find({}, {_id:0, restaurant_id:1, name:1, borough:1, cuisine:1})

// Query 4
db.restaurants.find({}, {_id:0, restaurant_id:1, name:1, borough:1, 'address.zipcode':1})

// Query 5
db.restaurants.find({borough:'Bronx'})

// Query 6
db.restaurants.find({borough:'Bronx'}).limit(5)

// Query 7
db.restaurants.find({borough:'Bronx'}).skip(5).limit(5)

// Query 8
db.restaurants.find({'grades.score':{$gt:90}})

// Query 9
db.restaurants.find({'grades.score':{$gt:80,$lt:100}})

// Query 10
db.restaurants.find({'address.coord.0':{$lt:-95.754168}})

// Query 11
db.restaurants.find({cuisine:{$ne:'American'},'grades.score':{$gt:70},'address.coord.1':{$lt:-65.754168}})

// Query 12
db.restaurants.find({cuisine:{$ne:'American'},'grades.score':{$gt:70},'address.coord.0':{$lt:-65.754168}})

// Query 13
db.restaurants.find({cuisine:{$ne:'American'},borough:{$ne:'Brooklyn'},'grades.grade':'A'}).sort({cuisine:-1})

// Query 14
db.restaurants.find({'grades.grade':'A'},{_id:0,restaurant_id:1,name:1,borough:1,cuisine:1})

// Query 15
db.restaurants.find({name:/ces$/})

// Query 16
db.restaurants.find({name:/Reg/})

// Query 17
db.restaurants.find({borough:'Bronx',cuisine:{$in:['American','Chinese']}})

// Query 18
db.restaurants.find({borough:{$in:['Staten Island','Queens','Bronx','Brooklyn']}})

// Query 19
db.restaurants.find({borough:{$nin:['Staten Island','Queens','Bronx','Brooklyn']}})

// Query 20
db.restaurants.find({'grades.score':{$lte:10}})

// Query 21
db.restaurants.find({$or:[{cuisine:{$nin:['American','Chinese']}},{name:/^Wil/}]})

// Query 22
db.restaurants.find({grades:{$elemMatch:{grade:'A',score:11,date:ISODate('2014-08-11T00:00:00Z')}}})

// Query 23
db.restaurants.find({'grades.1.grade':'A','grades.1.score':9})

// Query 24
db.restaurants.find({'address.coord.1':{$gt:42,$lt:52}})

// Query 25
db.restaurants.find().sort({name:1})

// Query 26
db.restaurants.find().sort({name:-1})

// Query 27
db.restaurants.find().sort({cuisine:1,borough:-1})

// Query 28
db.restaurants.find({'address.street':{$exists:true}})

// Query 29
db.restaurants.find({'address.coord':{$type:'double'}})

// Query 30
db.restaurants.find({name:'Park'})

// Query 31
db.restaurants.find({cuisine:'Bakery'})

// Query 32
db.restaurants.find({borough:'Manhattan',cuisine:'Indian'})

// Query 33
db.restaurants.find({cuisine:{$ne:'Bakery'}})

// Query 34
db.restaurants.find({'grades.grade':'B'})

// Query 35
db.restaurants.find({'grades.grade':{$ne:'B'}})

// Query 36
db.restaurants.countDocuments({borough:'Bronx'})

// Query 37
db.restaurants.distinct('cuisine')

// Query 38
db.restaurants.find({cuisine:/^S/})

// Query 39
db.restaurants.find({'grades.score':{$gte:80}})

// Query 40
db.restaurants.find({grades:{$size:3}})

// Query 41
db.restaurants.find({grades:{$size:4}})

// Query 42
db.restaurants.find({'grades.score':10})

// Query 43
db.restaurants.find({'grades.score':{$gte:10,$lte:20}})

// Query 44
db.restaurants.aggregate([{$group:{_id:'$borough',count:{$sum:1}}}])

// Query 45
db.restaurants.aggregate([{$group:{_id:'$cuisine',count:{$sum:1}}}])

// Query 46
db.restaurants.aggregate([{$match:{'grades.grade':'A'}},{$group:{_id:{cuisine:'$cuisine',borough:'$borough'},count:{$sum:1}}}])

// Query 47
db.restaurants.find({name:/coffee/i})