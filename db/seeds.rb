
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
Admin.destroy_all

barman = Admin.create!(
        email: "example@gmail.com",
        password: "12345678",
        name: "Barman",
    )
barman.save!

choix_multiple = Type.new(name: "choix multiples x4")
choix_multiple.save!

customized = Category.new(name: "custom")
customized.save!

geo = Category.new(name: "Geography")
geo.save!

history = Category.new(name: "History")
history.save!

culture = Category.new(name: "History")
culture.save!

bertrand = Category.new(name: "5 questions")
culture.save!

api_category = Category.new(name: "API")
api_category.save!

# new_quiz = Quiz.new(name: "random question from api",
              # no_of_rounds: 1,
              # time_per_question: 10,
              # pin_number: 56789,
              # user: barman)
# new_quiz.save!
#
#
# new_round = Round.new(
# no_of_questions: 5,
# quiz: new_quiz,
# category: api_category,
# )
# new_round.save!
#
#
# test avec l'API
#
# require 'open-uri'
# require 'json'
#
# url = 'https://opentdb.com/api.php?amount=50&type=multiple'
# quiz_serialized = open(url).read
# quiz = JSON.parse(quiz_serialized)
#
# création d'une question avec l'API
#
# (0..4).each do |j|
  # new_question = Question.new(
  # content: quiz["results"][j]["question"],
  # category: api_category,
  # type: choix_multiple
  # )
  # new_question.save!
#
#associer les questions au round du quiz
#
  # new_quiz_question = QuizQuestion.new(
  # question: new_question,
  # round: new_round
  # )
  # new_quiz_question.save!
#
# création de la bonne réponse avec l'API
#
  # new_correct_answer = Answer.new(
  # content: quiz["results"][j]["correct_answer"],
  # is_correct: true,
  # question: new_question
  # )
  # new_correct_answer.save!
#
# création des mauvaises réponses avec l'API
#
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
                    no_of_rounds: 2,
                    time_per_question: 12,
                    pin_number: 123456)
quiz_test.admin = barman
quiz_test.save!

round_1_quiz_test = Round.new(no_of_questions: 3)
round_1_quiz_test.quiz = quiz_test
round_1_quiz_test.category = customized
round_1_quiz_test.save!

round_2_quiz_test = Round.new(no_of_questions: 2)
round_2_quiz_test.quiz = quiz_test
round_2_quiz_test.category = customized
round_2_quiz_test.save!

quiz_test_question_1 = QuizQuestion.new()
quiz_test_question_1.question = question_1
quiz_test_question_1.round = round_1_quiz_test
quiz_test_question_1.save!


quiz_test_question_2 = QuizQuestion.new()
quiz_test_question_2.question = question_2
quiz_test_question_2.round = round_1_quiz_test
quiz_test_question_2.save!


quiz_test_question_3 = QuizQuestion.new()
quiz_test_question_3.question = question_3
quiz_test_question_3.round = round_1_quiz_test
quiz_test_question_3.save!

quiz_test_question_4 = QuizQuestion.new()
quiz_test_question_4.question = question_4
quiz_test_question_4.round = round_2_quiz_test
quiz_test_question_4.save!

quiz_test_question_5 = QuizQuestion.new()
quiz_test_question_5.question = question_5
quiz_test_question_5.round = round_2_quiz_test
quiz_test_question_5.save!




#mariage

#geographie
question_1_pims = Question.new(content: "Où Bertrand et Anne-Helene se sont-ils vus pour la première fois?",
  )
question_1_pims.category = customized
question_1_pims.type = choix_multiple
question_1_pims.save!

answer_1_question_1_pims = Answer.new(content: "En cours",
  is_correct: false)
answer_1_question_1_pims.question = question_1_pims
answer_1_question_1_pims.save!

answer_2_question_1_pims = Answer.new(content: "Chez des amis",
  is_correct: false)
answer_2_question_1_pims.question = question_1_pims
answer_2_question_1_pims.save!

answer_3_question_1_pims = Answer.new(content: "Dans un bar",
  is_correct: true)
answer_3_question_1_pims.question = question_1_pims
answer_3_question_1_pims.save!

answer_4_question_1_pims = Answer.new(content: "Dans le tram",
  is_correct: false)
answer_4_question_1_pims.question = question_1_pims
answer_4_question_1_pims.save!

question_2_pims = Question.new(content: "Quel plat a concocté Bertrand pour leur premier diner?")
question_2_pims.category = customized
question_2_pims.type = choix_multiple
question_2_pims.save!

answer_1_question_2_pims = Answer.new(content: "Une blanquette de veau",
  is_correct: true)
answer_1_question_2_pims.question = question_2_pims
answer_1_question_2_pims.save!

answer_2_question_2_pims = Answer.new(content: "Des pâtes bolognaises",
  is_correct: false)
answer_2_question_2_pims.question = question_2_pims
answer_2_question_2_pims.save!

answer_3_question_2_pims = Answer.new(content: "Un confit de canard",
  is_correct: false)
answer_3_question_2_pims.question = question_2_pims
answer_3_question_2_pims.save!

answer_4_question_2_pims = Answer.new(content: "Absolument rien, il a opté pour le traiteur",
  is_correct: false)
answer_4_question_2_pims.question = question_2_pims
answer_4_question_2_pims.save!

question_3_pims = Question.new(content: "Dans quel domaine Anne-Hélène a essayé d'épater Bertrand?")
question_3_pims.category = customized
question_3_pims.type = choix_multiple
question_3_pims.save!

answer_1_question_3_pims = Answer.new(content: "La vodka",
  is_correct: true)
answer_1_question_3_pims.question = question_3_pims
answer_1_question_3_pims.save!

answer_2_question_3_pims = Answer.new(content: "Les langues étrangères",
  is_correct: false)
answer_2_question_3_pims.question = question_3_pims
answer_2_question_3_pims.save!

answer_3_question_3_pims = Answer.new(content: "Le violon",
  is_correct: false)
answer_3_question_3_pims.question = question_3_pims
answer_3_question_3_pims.save!

answer_4_question_3_pims = Answer.new(content: "Le chant",
  is_correct: false)
answer_4_question_3_pims.question = question_3_pims
answer_4_question_3_pims.save!


#histoire

question_4_pims = Question.new(content: "Dans quel pays Anne-Hélène a convaincu Bertrand de se rendre annuellement ?")
question_4_pims.category = customized
question_4_pims.type = choix_multiple
question_4_pims.save!

answer_1_question_4_pims = Answer.new(content: "Maroc, pour le soleil de janvier",
  is_correct: false)
answer_1_question_4_pims.question = question_4_pims
answer_1_question_4_pims.save!

answer_2_question_4_pims = Answer.new(content: "Allemagne, pour les marchés de Noël",
  is_correct: true)
answer_2_question_4_pims.question = question_4_pims
answer_2_question_4_pims.save!

answer_3_question_4_pims = Answer.new(content: "Irlande, pour la Saint Patrick ",
  is_correct: false)
answer_3_question_4_pims.question = question_4_pims
answer_3_question_4_pims.save!

answer_4_question_4_pims = Answer.new(content: "Angleterre, pour les soldes",
  is_correct: false)
answer_4_question_4_pims.question = question_4_pims
answer_4_question_4_pims.save!


question_5_pims = Question.new(content: "Que découvre Bertrand sur Anne-Hélène quelques jours après leur rencontre ?")
question_5_pims.category = customized
question_5_pims.type = choix_multiple
question_5_pims.save!

answer_1_question_5_pims = Answer.new(content: "Mensonge sur son âge",
  is_correct: false)
answer_1_question_5_pims.question = question_5_pims
answer_1_question_5_pims.save!

answer_2_question_5_pims = Answer.new(content: "Lieu de vacances de jeunesse en commun",
  is_correct: false)
answer_2_question_5_pims.question = question_5_pims
answer_2_question_5_pims.save!

answer_3_question_5_pims = Answer.new(content: "Grosse colère contre un de ses amis",
  is_correct: true)
answer_3_question_5_pims.question = question_5_pims
answer_3_question_5_pims.save!

answer_4_question_5_pims = Answer.new(content: "Location du même appartement",
  is_correct: false)
answer_4_question_5_pims.question = question_5_pims
answer_4_question_5_pims.save!

question_6_pims = Question.new(content: "Quelle destination pour leur premier voyage ensemble ?")
question_6_pims.category = customized
question_6_pims.type = choix_multiple
question_6_pims.save!

answer_1_question_6_pims = Answer.new(content: "Italie",
  is_correct: false)
answer_1_question_6_pims.question = question_6_pims
answer_1_question_6_pims.save!

answer_2_question_6_pims = Answer.new(content: "Grèce",
  is_correct: false)
answer_2_question_6_pims.question = question_6_pims
answer_2_question_6_pims.save!

answer_3_question_6_pims = Answer.new(content: "Allemagne",
  is_correct: true)
answer_3_question_6_pims.question = question_6_pims
answer_3_question_6_pims.save!

answer_4_question_6_pims = Answer.new(content: "Etats-Unis (NY)",
  is_correct: false)
answer_4_question_6_pims.question = question_6_pims
answer_4_question_6_pims.save!

question_7_pims = Question.new(content: "Ou vivent Bertrand et Anne-Hélène 6 mois après le début de leur idylle ?")
question_7_pims.category = customized
question_7_pims.type = choix_multiple
question_7_pims.save!

answer_1_question_7_pims = Answer.new(content: "Moscou et New York",
  is_correct: false)
answer_1_question_7_pims.question = question_7_pims
answer_1_question_7_pims.save!

answer_2_question_7_pims = Answer.new(content: "St Petersbourg et Boston",
  is_correct: false)
answer_2_question_7_pims.question = question_7_pims
answer_2_question_7_pims.save!

answer_3_question_7_pims = Answer.new(content: "St Petersbourg et New York",
  is_correct: false)
answer_3_question_7_pims.question = question_7_pims
answer_3_question_7_pims.save!

answer_4_question_7_pims = Answer.new(content: "Moscou et Boston",
  is_correct: true)
answer_4_question_7_pims.question = question_7_pims
answer_4_question_7_pims.save!

question_8_pims = Question.new(content: "Quel était leur métier idéal dans leur jeunesse ?")
question_8_pims.category = customized
question_8_pims.type = choix_multiple
question_8_pims.save!

answer_1_question_8_pims = Answer.new(content: "Cosmétologue et Archéologue",
  is_correct: false)
answer_1_question_8_pims.question = question_8_pims
answer_1_question_8_pims.save!

answer_2_question_8_pims = Answer.new(content: "Coiffeuse et Pompier",
  is_correct: true)
answer_2_question_8_pims.question = question_8_pims
answer_2_question_8_pims.save!

answer_3_question_8_pims = Answer.new(content: "Institutrice et Magistrat",
  is_correct: false)
answer_3_question_8_pims.question = question_8_pims
answer_3_question_8_pims.save!

answer_4_question_8_pims = Answer.new(content: "Consultante en SI et Avocat",
  is_correct: false)
answer_4_question_8_pims.question = question_8_pims
answer_4_question_8_pims.save!

question_9_pims = Question.new(content: "Où Bertrand a-t-il fait sa demande ?")
question_9_pims.category = customized
question_9_pims.type = choix_multiple
question_9_pims.save!

answer_1_question_9_pims = Answer.new(content: "Restaurant italien à Nantes",
  is_correct: true)
answer_1_question_9_pims.question = question_9_pims
answer_1_question_9_pims.save!

answer_2_question_9_pims = Answer.new(content: "Disneyland pendant la parade de Mickey",
  is_correct: false)
answer_2_question_9_pims.question = question_9_pims
answer_2_question_9_pims.save!

answer_3_question_9_pims = Answer.new(content: "Paris dans leur nouvel appartement",
  is_correct: false)
answer_3_question_9_pims.question = question_9_pims
answer_3_question_9_pims.save!

answer_4_question_9_pims = Answer.new(content: "Devant la cathédrale de Florence",
  is_correct: false)
answer_4_question_9_pims.question = question_9_pims
answer_4_question_9_pims.save!

question_10_pims = Question.new(content: "De quoi Anne-Hélène va-t-elle essayer de convaincre Bertrand ?")
question_10_pims.category = customized
question_10_pims.type = choix_multiple
question_10_pims.save!

answer_1_question_10_pims = Answer.new(content: "Porter des lentilles",
  is_correct: false)
answer_1_question_10_pims.question = question_10_pims
answer_1_question_10_pims.save!

answer_2_question_10_pims = Answer.new(content: "Adopter un chat",
  is_correct: false)
answer_2_question_10_pims.question = question_10_pims
answer_2_question_10_pims.save!

answer_3_question_10_pims = Answer.new(content: "Acheter une voiture",
  is_correct: true)
answer_3_question_10_pims.question = question_10_pims
answer_3_question_10_pims.save!

answer_4_question_10_pims = Answer.new(content: "S'installer en Vendée",
  is_correct: false)
answer_4_question_10_pims.question = question_10_pims
answer_4_question_10_pims.save!

quiz_pims = Quiz.new(name: "Pims",
                    no_of_rounds: 2,
                    time_per_question: 12,
                    pin_number: 1111,
                    time_bonus: false,
                    language: "french")
quiz_pims.admin = barman
quiz_pims.save!

round_1_quiz_pims = Round.new(no_of_questions: 5)
round_1_quiz_pims.quiz = quiz_pims
round_1_quiz_pims.category = bertrand
round_1_quiz_pims.save!

round_2_quiz_pims = Round.new(no_of_questions: 5)
round_2_quiz_pims.quiz = quiz_pims
round_2_quiz_pims.category = bertrand
round_2_quiz_pims.save!

quiz_pims_question_1 = QuizQuestion.new()
quiz_pims_question_1.question = question_1_pims
quiz_pims_question_1.round = round_1_quiz_pims
quiz_pims_question_1.save!


quiz_pims_question_2 = QuizQuestion.new()
quiz_pims_question_2.question = question_2_pims
quiz_pims_question_2.round = round_1_quiz_pims
quiz_pims_question_2.save!


quiz_pims_question_3 = QuizQuestion.new()
quiz_pims_question_3.question = question_3_pims
quiz_pims_question_3.round = round_1_quiz_pims
quiz_pims_question_3.save!

quiz_pims_question_4 = QuizQuestion.new()
quiz_pims_question_4.question = question_4_pims
quiz_pims_question_4.round = round_1_quiz_pims
quiz_pims_question_4.save!

quiz_pims_question_5 = QuizQuestion.new()
quiz_pims_question_5.question = question_5_pims
quiz_pims_question_5.round = round_1_quiz_pims
quiz_pims_question_5.save!

quiz_pims_question_6 = QuizQuestion.new()
quiz_pims_question_6.question = question_6_pims
quiz_pims_question_6.round = round_2_quiz_pims
quiz_pims_question_6.save!

quiz_pims_question_7 = QuizQuestion.new()
quiz_pims_question_7.question = question_7_pims
quiz_pims_question_7.round = round_2_quiz_pims
quiz_pims_question_7.save!

quiz_pims_question_8 = QuizQuestion.new()
quiz_pims_question_8.question = question_8_pims
quiz_pims_question_8.round = round_2_quiz_pims
quiz_pims_question_8.save!

quiz_pims_question_9 = QuizQuestion.new()
quiz_pims_question_9.question = question_9_pims
quiz_pims_question_9.round = round_2_quiz_pims
quiz_pims_question_9.save!

quiz_pims_question_10 = QuizQuestion.new()
quiz_pims_question_10.question = question_10_pims
quiz_pims_question_10.round = round_2_quiz_pims
quiz_pims_question_10.save!
# #mariage-test

# #geographie
# question_1_mariage_test = Question.new(content: "Quelle a été en pourcentage l'évolution de la population des herbiers entre 1968 et 2014?",
#   )
# question_1_mariage_test.category = customized
# question_1_mariage_test.type = choix_multiple
# question_1_mariage_test.save!

# answer_1_question_1_mariage_test = Answer.new(content: "+ 77%",
#   is_correct: true)
# answer_1_question_1_mariage_test.question = question_1_mariage_test
# answer_1_question_1_mariage_test.save!

# answer_2_question_1_mariage_test = Answer.new(content: "+ 46%",
#   is_correct: false)
# answer_2_question_1_mariage_test.question = question_1_mariage_test
# answer_2_question_1_mariage_test.save!

# answer_3_question_1_mariage_test = Answer.new(content: "+23%",
#   is_correct: false)
# answer_3_question_1_mariage_test.question = question_1_mariage_test
# answer_3_question_1_mariage_test.save!

# answer_4_question_1_mariage_test = Answer.new(content: "-14%",
#   is_correct: false)
# answer_4_question_1_mariage_test.question = question_1_mariage_test
# answer_4_question_1_mariage_test.save!

# question_2_mariage_test = Question.new(content: "D'après mon ami Google, combien de temps mettrais-je pour aller de Jaipur à Bombay en voiture (en passant par la NH48) ?")
# question_2_mariage_test.category = customized
# question_2_mariage_test.type = choix_multiple
# question_2_mariage_test.save!

# answer_1_question_2_mariage_test = Answer.new(content: "25h et 4 minutes",
#   is_correct: false)
# answer_1_question_2_mariage_test.question = question_2_mariage_test
# answer_1_question_2_mariage_test.save!

# answer_2_question_2_mariage_test = Answer.new(content: "23h et 15 minutes",
#   is_correct: false)
# answer_2_question_2_mariage_test.question = question_2_mariage_test
# answer_2_question_2_mariage_test.save!

# answer_3_question_2_mariage_test = Answer.new(content: "19h et 27 minutes",
#   is_correct: true)
# answer_3_question_2_mariage_test.question = question_2_mariage_test
# answer_3_question_2_mariage_test.save!

# answer_4_question_2_mariage_test = Answer.new(content: "15h et 42 minutes",
#   is_correct: false)
# answer_4_question_2_mariage_test.question = question_2_mariage_test
# answer_4_question_2_mariage_test.save!

# question_3_mariage_test = Question.new(content: "Laquelle de ces affirmations est fausse concernant la Mongolie ?")
# question_3_mariage_test.category = customized
# question_3_mariage_test.type = choix_multiple
# question_3_mariage_test.save!

# answer_1_question_3_mariage_test = Answer.new(content: "Les mongols auraient le record du 2e plus fat génocide non mécanisé",
#   is_correct: false)
# answer_1_question_3_mariage_test.question = question_3_mariage_test
# answer_1_question_3_mariage_test.save!

# answer_2_question_3_mariage_test = Answer.new(content: "Entre 30 et 40% de la population est nomade",
#   is_correct: false)
# answer_2_question_3_mariage_test.question = question_3_mariage_test
# answer_2_question_3_mariage_test.save!

# answer_3_question_3_mariage_test = Answer.new(content: "Les mongoliens ont inventé les glaces",
#   is_correct: false)
# answer_3_question_3_mariage_test.question = question_3_mariage_test
# answer_3_question_3_mariage_test.save!

# answer_4_question_3_mariage_test = Answer.new(content: "Oulan Bator s'est déplacée 37 fois avant de s'établir à son emplacement actuel",
#   is_correct: true)
# answer_4_question_3_mariage_test.question = question_3_mariage_test
# answer_4_question_3_mariage_test.save!


# #histoire

# question_4_mariage_test = Question.new(content: "En quelle année M. Charroin a-t-il été nommé directeur d'Audiencia ?")
# question_4_mariage_test.category = customized
# question_4_mariage_test.type = choix_multiple
# question_4_mariage_test.save!

# answer_1_question_4_mariage_test = Answer.new(content: "2O11",
#   is_correct: true)
# answer_1_question_4_mariage_test.question = question_4_mariage_test
# answer_1_question_4_mariage_test.save!

# answer_2_question_4_mariage_test = Answer.new(content: "2009",
#   is_correct: false)
# answer_2_question_4_mariage_test.question = question_4_mariage_test
# answer_2_question_4_mariage_test.save!

# answer_3_question_4_mariage_test = Answer.new(content: "2007",
#   is_correct: false)
# answer_3_question_4_mariage_test.question = question_4_mariage_test
# answer_3_question_4_mariage_test.save!

# answer_4_question_4_mariage_test = Answer.new(content: "1978",
#   is_correct: false)
# answer_4_question_4_mariage_test.question = question_4_mariage_test
# answer_4_question_4_mariage_test.save!


# question_5_mariage_test = Question.new(content: "A quelle date Pims a évoqué Anne-Hélène par mail avec nous ?")
# question_5_mariage_test.category = customized
# question_5_mariage_test.type = choix_multiple
# question_5_mariage_test.save!

# answer_1_question_5_mariage_test = Answer.new(content: "le 1 mars 2011",
#   is_correct: false)
# answer_1_question_5_mariage_test.question = question_5_mariage_test
# answer_1_question_5_mariage_test.save!

# answer_2_question_5_mariage_test = Answer.new(content: "le 12 mars 2011",
#   is_correct: true)
# answer_2_question_5_mariage_test.question = question_5_mariage_test
# answer_2_question_5_mariage_test.save!

# answer_3_question_5_mariage_test = Answer.new(content: "le 2 avril 2011",
#   is_correct: false)
# answer_3_question_5_mariage_test.question = question_5_mariage_test
# answer_3_question_5_mariage_test.save!

# answer_4_question_5_mariage_test = Answer.new(content: "le 14 mai 2017",
#   is_correct: false)
# answer_4_question_5_mariage_test.question = question_5_mariage_test
# answer_4_question_5_mariage_test.save!

# question_6_mariage_test = Question.new(content: "Depuis combien de temps Anne-Hélène est chez Accenture ?")
# question_6_mariage_test.category = customized
# question_6_mariage_test.type = choix_multiple
# question_6_mariage_test.save!

# answer_1_question_6_mariage_test = Answer.new(content: "4 ans et 10 mois",
#   is_correct: false)
# answer_1_question_6_mariage_test.question = question_6_mariage_test
# answer_1_question_6_mariage_test.save!

# answer_2_question_6_mariage_test = Answer.new(content: "5 ans et 3 mois",
#   is_correct: false)
# answer_2_question_6_mariage_test.question = question_6_mariage_test
# answer_2_question_6_mariage_test.save!

# answer_3_question_6_mariage_test = Answer.new(content: "5 ans et 8 mois",
#   is_correct: true)
# answer_3_question_6_mariage_test.question = question_6_mariage_test
# answer_3_question_6_mariage_test.save!

# answer_4_question_6_mariage_test = Answer.new(content: "5 ans et 11 mois",
#   is_correct: false)
# answer_4_question_6_mariage_test.question = question_6_mariage_test
# answer_4_question_6_mariage_test.save!




# quiz_mariage_test = Quiz.new(name: "mariage_test",
#                     no_of_rounds: 2,
#                     time_per_question: 12,
#                     pin_number: 1111,
#                     language: "french")
# quiz_mariage_test.user = barman
# quiz_mariage_test.save!

# round_1_quiz_mariage_test = Round.new(no_of_questions: 3)
# round_1_quiz_mariage_test.quiz = quiz_mariage_test
# round_1_quiz_mariage_test.category = geo
# round_1_quiz_mariage_test.save!

# round_2_quiz_mariage_test = Round.new(no_of_questions: 3)
# round_2_quiz_mariage_test.quiz = quiz_mariage_test
# round_2_quiz_mariage_test.category = history
# round_2_quiz_mariage_test.save!

# quiz_mariage_test_question_1 = QuizQuestion.new()
# quiz_mariage_test_question_1.question = question_1_mariage_test
# quiz_mariage_test_question_1.round = round_1_quiz_mariage_test
# quiz_mariage_test_question_1.save!


# quiz_mariage_test_question_2 = QuizQuestion.new()
# quiz_mariage_test_question_2.question = question_2_mariage_test
# quiz_mariage_test_question_2.round = round_1_quiz_mariage_test
# quiz_mariage_test_question_2.save!


# quiz_mariage_test_question_3 = QuizQuestion.new()
# quiz_mariage_test_question_3.question = question_3_mariage_test
# quiz_mariage_test_question_3.round = round_1_quiz_mariage_test
# quiz_mariage_test_question_3.save!

# quiz_mariage_test_question_4 = QuizQuestion.new()
# quiz_mariage_test_question_4.question = question_4_mariage_test
# quiz_mariage_test_question_4.round = round_2_quiz_mariage_test
# quiz_mariage_test_question_4.save!

# quiz_mariage_test_question_5 = QuizQuestion.new()
# quiz_mariage_test_question_5.question = question_5_mariage_test
# quiz_mariage_test_question_5.round = round_2_quiz_mariage_test
# quiz_mariage_test_question_5.save!

# quiz_mariage_test_question_6 = QuizQuestion.new()
# quiz_mariage_test_question_6.question = question_6_mariage_test
# quiz_mariage_test_question_6.round = round_2_quiz_mariage_test
# quiz_mariage_test_question_6.save!
