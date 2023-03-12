# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create([
    {
        name:"Rohit",
        email:"rohit@gmail.com",
        password:"1"
    },{
        name:"Udit",
        email:"udit@gmail.com",
        password:"2"
    },{
        name:"Nakul",
        email:"nakul@gmail.com",
        password:"3"
    },{
        name:"Nikhil",
        email:"nikhil@gmail.com",
        password:"4"
    }
])

category = Category.create([
    {
        name:"Food"
    },{
        name:"Utilities"
    },{
        name:"Rent"
    },{
        name:"Travel"
    },{
        name:"Entertainment"
    },{
        name:"Health Care"
    }
])

type = TransactionType.create([
    {
        name:"Income"
    },{
        name:"Expense"
    }
])
