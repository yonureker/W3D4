# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all


user_1 = User.create(username: 'alex')
user_2 = User.create(username: 'onur')
user_3 = User.create(username: 'bobby')
user_4 = User.create(username: 'jimmy')

Poll.destroy_all


poll_1 = Poll.create(title: 'Favorite food?', author_id: user_1.id)
poll_2 = Poll.create(title: 'Favorite color?', author_id: user_2.id)
poll_3 = Poll.create(title: 'Favorite sport?', author_id: user_1.id)
poll_4 = Poll.create(title: 'Favorite hobby?', author_id: user_2.id)

Question.destroy_all

question_1 = Question.create(text: 'What is your favorite food?', poll_id: poll_1.id)
question_2 = Question.create(text: 'What is your favorite color?',poll_id:  poll_2.id)
question_3 = Question.create(text: 'What is your favorite sport?',poll_id:  poll_3.id)
question_4 = Question.create(text: 'What is your favorite hobby?',poll_id:  poll_4.id)

AnswerChoice.destroy_all

answer_1 = AnswerChoice.create(text: 'Sandwich?', question_id: question_1.id)
answer_2 = AnswerChoice.create(text: 'Soup?', question_id: question_1.id)
answer_3 = AnswerChoice.create(text: 'Bread?', question_id: question_1.id)

answer_4 = AnswerChoice.create(text: 'red?',question_id: question_2.id)
answer_5 = AnswerChoice.create(text: 'blue?',question_id: question_2.id)
answer_6 = AnswerChoice.create(text: 'green?',question_id: question_2.id)

answer_7 = AnswerChoice.create(text: 'Track and Field?',question_id: question_3.id)
answer_8 = AnswerChoice.create(text: 'Basketball?',question_id: question_3.id)
answer_9 = AnswerChoice.create(text: 'Soccer?',question_id: question_3.id)

answer_10 = AnswerChoice.create(text: 'Knitting?',question_id: question_4.id)
answer_11 = AnswerChoice.create(text: 'Painting?',question_id: question_4.id)
answer_12 = AnswerChoice.create(text: 'Woodworking?',question_id: question_4.id)

Response.destroy_all

Response.create(respondent_id: user_3.id, answer_choice_id: answer_1.id)
Response.create(respondent_id: user_3.id, answer_choice_id: answer_5.id)
Response.create(respondent_id: user_4.id, answer_choice_id: answer_12.id)
Response.create(respondent_id: user_4.id, answer_choice_id: answer_7.id)
Response.create(respondent_id: user_3.id, answer_choice_id: answer_2.id)







