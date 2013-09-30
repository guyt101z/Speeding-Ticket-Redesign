class AddTechniciansCountToTickets < ActiveRecord::Migration
  def change
  	add_column :tickets, :technicians_count, :integer, :default => 0
  	
  	Ticket.reset_column_information
  	
		Ticket.find(:all).each do |t|
			Ticket.update_counters t.id, :technicians_count => t.technicians.length
		end
  	
   end
end
