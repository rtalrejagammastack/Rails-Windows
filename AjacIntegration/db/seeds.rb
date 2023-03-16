# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

FirstOption.create([{name:"Mobile"},{name:"Fruits"},{name:"Colleges"}])
FirstOption.where(name:"Mobile").first.options.create([{name:"MI"},{name:"Opps"},{name:"Vivo"}])
FirstOption.where(name:"Fruits").first.options.create([{name:"Apple"},{name:"Banana"},{name:"Mango"}])
FirstOption.where(name:"Colleges").first.options.create([{name:"Davv"},{name:"Bansal"},{name:"Medicaps"}])