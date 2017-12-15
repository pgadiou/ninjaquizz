
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or create!d alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create!([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create!(name: 'Luke', movie: movies.first)
Quiz.destroy_all
Question.destroy_all
User.destroy_all

barman = User.create!(
        email: "example@gmail.com",
        password: "12345678",
        name: "Barman",
        avatar: "Ninja5"
    )
barman.save!

choix_multiple = Type.new(name: "choix multiples x4")
choix_multiple.save!

customized = Category.new(name: "custom")
customized.save!

# api_category = Category.new(name: "API")
# api_category.save!

# new_quiz = Quiz.new(name: "random question from api",
#               no_of_rounds: 1,
#               time_per_question: 10,
#               pin_number: 123456,
#               user: barman)
# new_quiz.save!


# new_round = Round.new(
# no_of_questions: 3,
# quiz: new_quiz,
# category: api_category,
# )
# new_round.save!


# # test avec l'API

# require 'open-uri'
# require 'json'

# url = 'https://opentdb.com/api.php?amount=50&type=multiple'
# quiz_serialized = open(url).read
# quiz = JSON.parse(quiz_serialized)

# # création d'une question avec l'API

# (0..2).each do |j|
# new_question = Question.new(
# content: quiz["results"][j]["question"],
# category: api_category,
# type: choix_multiple
# )
# new_question.save!

# #associer les questions au round du quiz

# new_quiz_question = QuizQuestion.new(
# question: new_question,
# round: new_round
# )
# new_quiz_question.save!

# # création de la bonne réponse avec l'API

# new_correct_answer = Answer.new(
# content: quiz["results"][j]["correct_answer"],
# is_correct: true,
# question: new_question
# )
# new_correct_answer.save!

# # création des mauvaises réponses avec l'API

# (0..2).each do |i|
# new_incorrect_answer = Answer.new(
# content: quiz["results"][j]["incorrect_answers"][i],
# is_correct: false,
# question: new_question
# )
# new_incorrect_answer.save!
# end
# end

question_1 = Question.new(content: "Dans combien de villes peut-on apprendre à coder avec le Wagon ?",
  )
question_1.category = customized
question_1.type = choix_multiple
question_1.save!

answer_1_question_1 = Answer.new(content: "8",
  is_correct: false)
answer_1_question_1.question = question_1
answer_1_question_1.save!

answer_2_question_1 = Answer.new(content: "18",
  is_correct: false)
answer_2_question_1.question = question_1
answer_2_question_1.save!

answer_3_question_1 = Answer.new(content: "27",
  is_correct: true)
answer_3_question_1.question = question_1
answer_3_question_1.save!

answer_4_question_1 = Answer.new(content: "35",
  is_correct: false)
answer_4_question_1.question = question_1
answer_4_question_1.save!

question_2 = Question.new(content: "Dans les Tortues Ninja, quelle tortue porte un bandeau rouge ?")
question_2.category = customized
question_2.type = choix_multiple
question_2.save!

answer_1_question_2 = Answer.new(content: "Michelangelo",
  is_correct: false)
answer_1_question_2.question = question_2
answer_1_question_2.save!

answer_2_question_2 = Answer.new(content: "Donatello",
  is_correct: false)
answer_2_question_2.question = question_2
answer_2_question_2.save!

answer_3_question_2 = Answer.new(content: "Leonardo",
  is_correct: false)
answer_3_question_2.question = question_2
answer_3_question_2.save!

answer_4_question_2 = Answer.new(content: "Raffaello",
  is_correct: true)
answer_4_question_2.question = question_2
answer_4_question_2.save!

question_3 = Question.new(content: "Combien de marches y-a-t-il sur la Tour Eiffel ?")
question_3.category = customized
question_3.type = choix_multiple
question_3.save!

answer_1_question_3 = Answer.new(content: "2456",
  is_correct: false)
answer_1_question_3.question = question_3
answer_1_question_3.save!

answer_2_question_3 = Answer.new(content: "882",
  is_correct: false)
answer_2_question_3.question = question_3
answer_2_question_3.save!

answer_3_question_3 = Answer.new(content: "1665",
  is_correct: true)
answer_3_question_3.question = question_3
answer_3_question_3.save!

answer_4_question_3 = Answer.new(content: "3768",
  is_correct: false)
answer_4_question_3.question = question_3
answer_4_question_3.save!

question_4 = Question.new(content: "Selon les rumeurs, qu'abritait ce local avant d'accueilir le Wagon ?")
question_4.category = customized
question_4.type = choix_multiple
question_4.save!

answer_1_question_4 = Answer.new(content: "Une chocolaterie",
  is_correct: true)
answer_1_question_4.question = question_4
answer_1_question_4.save!

answer_2_question_4 = Answer.new(content: "Un garage",
  is_correct: false)
answer_2_question_4.question = question_4
answer_2_question_4.save!

answer_3_question_4 = Answer.new(content: "Une fabrique textile",
  is_correct: false)
answer_3_question_4.question = question_4
answer_3_question_4.save!

answer_4_question_4 = Answer.new(content: "Un atelier d’artistes",
  is_correct: false)
answer_4_question_4.question = question_4
answer_4_question_4.save!


question_5 = Question.new(content: "Quel est le résultat de l'opération suivante : 3626 * 4281 ?")
question_5.category = customized
question_5.type = choix_multiple
question_5.save!

answer_1_question_5 = Answer.new(content: "15522906",
  is_correct: true)
answer_1_question_5.question = question_5
answer_1_question_5.save!

answer_2_question_5 = Answer.new(content: "7761453 * 2",
  is_correct: true)
answer_2_question_5.question = question_5
answer_2_question_5.save!

answer_3_question_5 = Answer.new(content: "5174302 * 3",
  is_correct: true)
answer_3_question_5.question = question_5
answer_3_question_5.save!

answer_4_question_5 = Answer.new(content: "3880726.5 * 4",
  is_correct: true)
answer_4_question_5.question = question_5
answer_4_question_5.save!


quiz_test = Quiz.new(name: "le Wagon",
                    no_of_rounds: 1,
                    time_per_question: 10,
                    pin_number: 123456)
quiz_test.user = barman
quiz_test.save!

round_quiz_test = Round.new(no_of_questions: 5)
round_quiz_test.quiz = quiz_test
round_quiz_test.category = customized
round_quiz_test.save!

quiz_test_question_1 = QuizQuestion.new()
quiz_test_question_1.question = question_1
quiz_test_question_1.round = round_quiz_test
quiz_test_question_1.save!


quiz_test_question_2 = QuizQuestion.new()
quiz_test_question_2.question = question_2
quiz_test_question_2.round = round_quiz_test
quiz_test_question_2.save!


quiz_test_question_3 = QuizQuestion.new()
quiz_test_question_3.question = question_3
quiz_test_question_3.round = round_quiz_test
quiz_test_question_3.save!

quiz_test_question_4 = QuizQuestion.new()
quiz_test_question_4.question = question_4
quiz_test_question_4.round = round_quiz_test
quiz_test_question_4.save!

quiz_test_question_5 = QuizQuestion.new()
quiz_test_question_5.question = question_5
quiz_test_question_5.round = round_quiz_test
quiz_test_question_5.save!



