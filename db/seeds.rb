# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

user = User.new(:name => 'SuperAdmin', :password => 'superadmin', :password_confirmation => 'superadmin', :email => 'superadmin@uw.edu')
user.toggle!(:super_admin)
user.set_group('Admins')
user.save
user = User.new(:name => 'anirudh', :password => 'Basketball', :password_confirmation => 'Basketball', :email => 'anirudh@uw.edu')
user.set_group('Admins')
user.save
