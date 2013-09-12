#Seed Database with Users

User.destroy_all
open("#{Rails.root}/lib/data/users_seed.txt") do |users|
	users.read.each_line do |user|
		last_name, first_name, location, phone_number, email, department = user.chomp.split("|")
		User.create!(:last_name => last_name, :first_name => first_name, :location => location, :phone_number => phone_number, :email => email, :department => department)
	end
end