module Error
	class Standard < StandardError
	end

	class NoDataForSelectedYear < Standard
		def message
			"Sorry, but there is no record on DB for this year."
		end
	end

	class NoDataForSelectedGrade < Standard
		def message
			"Sorry, but there is no record on DB for this grade."
		end
	end

	class FinalYearException < Standard
		def message
			"Final year reached"
		end
	end

	class NullElementAtDB < Standard
		def message
			"Sorry, but there's no record on DB for this paramers. Returning an object with 0 in all attributs."
		end
	end
end
