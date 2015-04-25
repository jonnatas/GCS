# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

 	ProvaBrasil.create(id_test: 1, id_grade: 1, total_students: 30, portuguese_score: 6.6, math_score: 6.7,
		year: 2005, id_state: 1)

 	ProvaBrasil.create(id_test: 2, id_grade: 1, total_students: 30, portuguese_score: 7.0, math_score: 4.7,
		year: 2006, id_state: 1)

 	ProvaBrasil.create(id_test: 3, id_grade: 1, total_students: 30, portuguese_score: 9.6, math_score: 8.7,
		year: 2007, id_state: 1)

 	ProvaBrasil.create(id_test: 4, id_grade: 1, total_students: 30, portuguese_score: 8.6, math_score: 8.7,
		year: 2008, id_state: 1)

 	ProvaBrasil.create(id_test: 5, id_grade: 1, total_students: 30, portuguese_score: 3.6, math_score: 8.7,
		year: 2009, id_state: 1)

 	ProvaBrasil.create(id_test: 6, id_grade: 1, total_students: 30, portuguese_score: 5.6, math_score: 8.7,
		year: 2010, id_state: 1)

 	ProvaBrasil.create(id_test: 7, id_grade: 1, total_students: 30, portuguese_score: 6.6, math_score: 8.7,
		year: 2011, id_state: 1)

 	ProvaBrasil.create(id_test: 8, id_grade: 1, total_students: 30, portuguese_score: 0, math_score: 8.7,
		year: 2012, id_state: 1)



	Rate.create(evasion: 15,performance: 10, distortion: 13, year: 2005, id_grade: 1, id_state: 1)
	Rate.create(evasion: 10,performance: 9, distortion: 13, year: 2006, id_grade: 1, id_state: 1)
	Rate.create(evasion: 12,performance: 8, distortion: 13, year: 2007, id_grade: 1, id_state: 1)
	Rate.create(evasion: 15,performance: 10, distortion: 13, year: 2008, id_grade: 1, id_state: 1)
	Rate.create(evasion: 10,performance: 9, distortion: 13, year: 2009, id_grade: 1, id_state: 1)
	Rate.create(evasion: 12,performance: 8, distortion: 13, year: 2010, id_grade: 1, id_state: 1)
	Rate.create(evasion: 15,performance: 10, distortion: 13, year: 2011, id_grade: 1, id_state: 1)
	Rate.create(evasion: 10,performance: 9, distortion: 13, year: 2012, id_grade: 1, id_state: 1)
	


	State.create(state: "AC")
	State.create(state: "AL")
	State.create(state: "AP")
	State.create(state: "AM")
	State.create(state: "BA")
	State.create(state: "CE")
	State.create(state: "DF")
	State.create(state: "ES")
	State.create(state: "GO")
	State.create(state: "MA")
	State.create(state: "MT")
	State.create(state: "MS")
	State.create(state: "MG")
	State.create(state: "PA")
	State.create(state: "PB")
	State.create(state: "PR")
	State.create(state: "PE")
	State.create(state: "PI")
	State.create(state: "RJ")
	State.create(state: "RN")
	State.create(state: "RS")
	State.create(state: "RO")
	State.create(state: "RR")
	State.create(state: "SC")
	State.create(state: "SP")
	State.create(state: "SE")
	State.create(state: "TO")
