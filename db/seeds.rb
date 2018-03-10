# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.create(name: 'user', email: 'user@test-guru.ru')

categories = Category.create([{title: 'Ruby'}, {title: 'Ruby on Rails'}, {title: 'SQL'}])

tests = Test.create([
  {title: 'Основы Ruby', level: 0, category_id: categories.fetch(0).id, author_id: user.id},
  {title: 'Классы и методы', level: 0, category_id: categories.fetch(0).id, author_id: user.id},
  {title: 'Метапрограммирование', level: 1, category_id: categories.fetch(0).id, author_id: user.id},
  {title: 'Структура Rails приложения', level: 1, category_id: categories.fetch(1).id, author_id: user.id},
  {title: 'Операции CRUD', level: 0, category_id: categories.fetch(2).id, author_id: user.id}
])

questions = Question.create([
  {body: 'Каким методом можно добавить данные в массив?', test_id: tests.fetch(0).id},
  {body: 'Каким ключевым словом определяется метод?', test_id: tests.fetch(1).id},
  {body: 'Каким ключевым словом определяется модуль?', test_id: tests.fetch(2).id},
  {body: 'В какой директории хранятся описания моделей?', test_id: tests.fetch(3).id},
  {body: 'Какой командой SQL можно создать таблицу?', test_id: tests.fetch(4).id}
])

Answer.create([
  {body: 'push', correct: true, question_id: questions.fetch(0).id},
  {body: 'pop', correct: false, question_id: questions.fetch(0).id},
  {body: 'shift', correct: false, question_id: questions.fetch(0).id},
  {body: 'def', correct: true, question_id: questions.fetch(1).id},
  {body: 'proc', correct: false, question_id: questions.fetch(1).id},
  {body: 'begin', correct: false, question_id: questions.fetch(1).id},
  {body: 'module', correct: true, question_id: questions.fetch(2).id},
  {body: 'class', correct: false, question_id: questions.fetch(2).id},
  {body: 'include', correct: false, question_id: questions.fetch(2).id},
  {body: 'app/models', correct: true, question_id: questions.fetch(3).id},
  {body: 'app/assets', correct: false, question_id: questions.fetch(3).id},
  {body: 'app/helpers', correct: false, question_id: questions.fetch(3).id},
  {body: 'CREATE TABLE', correct: true, question_id: questions.fetch(4).id},
  {body: 'UPDATE', correct: false, question_id: questions.fetch(4).id},
  {body: 'SELECT', correct: false, question_id: questions.fetch(4).id}
])

TestPassage.create([
  {user: user, test: tests.fetch(0), correct_answers: 2},
  {user: user, test: tests.fetch(1), correct_answers: 1},
  {user: user, test: tests.fetch(2), correct_answers: 0}
])
