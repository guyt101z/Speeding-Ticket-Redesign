#Seed Database with Users
User.destroy_all
open("#{Rails.root}/lib/data/users_seed.txt") do |users|
	users.read.each_line do |user|
		last_name, first_name, location, phone_number, email, department = user.chomp.split("|")
		User.create!(:last_name => last_name, :first_name => first_name, :location => location, :phone_number => phone_number, :email => email, :department => department)
	end
end

#Seed Database with Technicians
Technician.destroy_all
open("#{Rails.root}/lib/data/technicians_seed.txt") do |technicians|
	technicians.read.each_line do |technician|
		last_name, first_name, email, password, password_confirmation = technician.chomp.split("|")
		Technician.create!(:last_name => last_name, :first_name => first_name, :email => email, :password => password, :password_confirmation => password_confirmation)
	end
end
