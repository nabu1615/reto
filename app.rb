file_name = "./text.txt"
number_question = 0

# Get question from a file
def get_questions(file)
	result = {}
	questions = []
	answers = []
	count_questions = 0
	count_answers = 1
	File.readlines(file).each_with_index do |line, index|
		if index == count_questions
			questions << line.chomp
			count_questions += 3
		end
		if index == count_answers
			answers << line.chomp
			count_answers += 3
		end
	end
	questions.each_with_index do |question, index|
		result[question] = answers[index]
	end
	result
end

# Save Questions keys and values 
questions = get_questions(file_name).keys
answers = get_questions(file_name).values
puts "Bienvenido a reto 5, Para jugar, solo ingresa el termino correcto para cada una de las definiciones, Listo? Vamos!"


# Launch Question 
def launchQuestion(hash, answers)
	count_positive_questions = 0
	count_tries = 0
	count_elements = 0
	while count_elements < hash.length
		hash.each_with_index do |item, index|
			puts "Pregunta:"
			puts item
			answerUser = gets.chomp
			while answerUser != answers[index]
				if count_tries > 1
					break
				end
				p "intenta de nuevo"
				answerUser = gets.chomp
				count_tries += 1
			end
			if count_tries == 0
				p "Respuesta Correcta"
				count_positive_questions += 1
				elsif count_tries == 2
					p "No te preocupes, sigue con la siguiente pregunta"
			end
			count_tries = 0
			count_elements += 1
		end
	end
	p  "Buen juego tuviste #{count_positive_questions} correctas"
end

launchQuestion(questions, answers)








