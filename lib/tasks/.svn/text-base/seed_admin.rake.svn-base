namespace :db do
  desc "Fill database with admin user"
  task :seedadmin => :environment do
    Rake::Task['db:reset'].invoke
    admin = User.create!(:name => "Admin",
                         :email => "admin@fratapps.com",
                         :password => "fratapps",
                         :password_confirmation => "fratapps")
    admin.toggle!(:admin)
  end
end
