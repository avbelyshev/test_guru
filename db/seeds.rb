# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.create!(name: 'user', email: 'bav.tests@gmail.com', password: '123456', type: 'Admin', first_name: 'Admin', last_name: 'Admin')

categories = Category.create!([{title: 'Ruby'}, {title: 'Ruby on Rails'}, {title: 'SQL'}])

tests = Test.create!([
  {title: 'Основы Ruby', level: 0, category_id: categories.fetch(0).id, author_id: user.id},
  {title: 'Классы и методы', level: 0, category_id: categories.fetch(0).id, author_id: user.id},
  {title: 'Метапрограммирование', level: 1, category_id: categories.fetch(0).id, author_id: user.id},
  {title: 'Структура Rails приложения', level: 1, category_id: categories.fetch(1).id, author_id: user.id},
  {title: 'Операции CRUD', level: 0, category_id: categories.fetch(2).id, author_id: user.id}
])

questions = Question.create!([
  {body: 'Каким методом можно добавить данные в массив?', test_id: tests.fetch(0).id},
  {body: 'Каким ключевым словом определяется метод?', test_id: tests.fetch(1).id},
  {body: 'Каким ключевым словом определяется модуль?', test_id: tests.fetch(2).id},
  {body: 'В какой директории хранятся описания моделей?', test_id: tests.fetch(3).id},
  {body: 'Какой командой SQL можно создать таблицу?', test_id: tests.fetch(4).id}
])

questions.fetch(0).answers.create!([
  {body: 'push', correct: true},
  {body: 'pop', correct: false},
  {body: 'shift', correct: false}
])

questions.fetch(1).answers.create!([
  {body: 'def', correct: true},
  {body: 'proc', correct: false},
  {body: 'begin', correct: false}
])

questions.fetch(2).answers.create!([
  {body: 'module', correct: true},
  {body: 'class', correct: false},
  {body: 'include', correct: false}
])

questions.fetch(3).answers.create!([
  {body: 'app/models', correct: true},
  {body: 'app/assets', correct: false},
  {body: 'app/helpers', correct: false}
])

questions.fetch(4).answers.create!([
  {body: 'CREATE TABLE', correct: true},
  {body: 'UPDATE', correct: false},
  {body: 'SELECT', correct: false}
])

TestPassage.create!([
  {user: user, test: tests.fetch(0), correct_answers: 2},
  {user: user, test: tests.fetch(1), correct_answers: 1},
  {user: user, test: tests.fetch(2), correct_answers: 0}
])
