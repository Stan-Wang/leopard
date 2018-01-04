# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 数据初始化
if User.count == 0
  User.create(name: 'admin',
              login: 'admin',
              password: '123456',
              password_confirmation: '123456',
              email: 'admin@admin.com')
end