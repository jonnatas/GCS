# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

brazil_test = ProvaBrasil.create(id_test: 1, id_grade: 1, total_students: 30, portuguese_score: 6.6, math_score: 6.7,
		year: 2005, id_state: 1)

	rate = Rate.create(evasion: 15,performance: 10, distortion: 13, year: 2005, id_grade: 1, id_state: 1)