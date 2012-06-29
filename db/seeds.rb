# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

root = User.new(username: 'root', email: 'root@stack.com')
root.password = 'root_pass'
root.enabled = true
root.save

admin = Group.new
admin.name = 'admin'
admin.save

root.groups << admin
