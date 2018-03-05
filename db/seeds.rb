# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.create([{title: 'Ruby'}, {title: 'Ruby on Rails'}, {title: 'SQL'}])

Test.create(title: 'Основы Ruby', level: 0, category_id: 1)
Test.create(title: 'Классы и методы', level: 0, category_id: 1)
Test.create(title: 'Метапрограммирование', level: 1, category_id: 1)
Test.create(title: 'Структура Rails приложения', level: 1, category_id: 2)
Test.create(title: 'Операции CRUD', level: 0, category_id: 3)

Question.create(body: 'Каким методом можно добавить данные в массив?', test_id: 1)
Question.create(body: 'Каким ключевым словом определяется метод?', test_id: 2)
Question.create(body: 'Каким ключевым словом определяется модуль?', test_id: 3)
Question.create(body: 'В какой директории хранятся описания моделей?', test_id: 4)
Question.create(body: 'Какой командой SQL можно создать таблицу?', test_id: 5)

Answer.create(body: 'push', correct: true, question_id: 1)
Answer.create(body: 'pop', correct: false, question_id: 1)
Answer.create(body: 'shift', correct: false, question_id: 1)
Answer.create(body: 'def', correct: true, question_id: 2)
Answer.create(body: 'proc', correct: false, question_id: 2)
Answer.create(body: 'begin', correct: false, question_id: 2)
Answer.create(body: 'module', correct: true, question_id: 3)
Answer.create(body: 'class', correct: false, question_id: 3)
Answer.create(body: 'include', correct: false, question_id: 3)
Answer.create(body: 'app/models', correct: true, question_id: 4)
Answer.create(body: 'app/assets', correct: false, question_id: 4)
Answer.create(body: 'app/helpers', correct: false, question_id: 4)
Answer.create(body: 'CREATE TABLE', correct: true, question_id: 5)
Answer.create(body: 'UPDATE', correct: false, question_id: 5)
Answer.create(body: 'SELECT', correct: false, question_id: 5)

User.create(name: 'user', email: 'user@test-guru.ru')
