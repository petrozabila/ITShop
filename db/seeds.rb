# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Rubric.delete_all

Rubric.create(name:'Cars', id:1)
Rubric.create(name:'Bikes', id:2)
Rubric.create(name:'Boats', id:3)