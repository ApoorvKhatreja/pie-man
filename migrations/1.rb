require 'rubygems'
require 'sequel'

DB = Sequel.connect("sqlite://pie-man.db")

puts "* Creating the User table..."
DB.create_table :users do
  primary_key :id
  String      :name, :size => 32, :null => false, :unique => true
  Boolean     :super, :default => false
  Boolean     :message_notification, :default => false
  Time        :created_at, :default => Sequel::CURRENT_TIMESTAMP
end
puts "* Finished creating the User table."

puts "* Adding the super user 'pie-man' into the db..."
users = DB[:users]
users.insert(:name => 'pie-man', :super => true)
puts "* Finished adding the super user."

DB.disconnect
