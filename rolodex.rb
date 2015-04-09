
class Rolodex # kind of acting like a controller

attr_reader :contacts
	def initialize
		@contacts = []
		@id = 1000
	end

	def add_contact(contact)
		contact.id = @id
		@contacts << contact
		@id += 1
	end

	def find(contact_id)
		@contacts.find do |contact|
			contact.id == contact_id   #this returns a value
		end
	end

	def display_all_contacts 
		@contacts.each do |contact|
		 	puts contact
		end
	end

	def display_all_by_attribute
		print " [1] for id, [2] for first name, [3] for last name [4] email, [5] notes "
		choice = gets.chomp.to_i
		@contacts.each do |contact|
			case choice
			when 1
			 	puts contact.id
			when 2
				puts contact.first_name
			when 3
				puts contact.last_name
			when 4 
				puts contact.email

			when 5
				puts contact.note
			else puts "you have entered the wrong attribute"
			end
		end
	end
		
	def delete(contact_id)
		@contacts.each { |contact|
          if contact.id==contact_id
          	@contacts.delete(contact) #delete the contact with that id
          end
		}
		#@contacts.delete_if {|contact| contact.id==contact_id } 
	end


	def modify(contact_id)
		print "[1] for first name, [2] for last name [3] email, [4] notes: "
		choice=gets.chomp.to_i
		@contacts.each do |contact|
			case choice
			when 1
				puts "First name: "
				contact.first_name=gets.chomp.to_s
				puts "the new first name is #{contact.first_name}"

			 	
			when 2
				puts "Last name: "
				contact.last_name=gets.chomp.to_s
				puts "the new last name is #{contact.last_name}"

				
			when 3
				puts "email: "
				contact.email=gets.chomp.to_s
				puts "the new email is #{contact.email}"
				
			when 4 
				puts "notes: "
				contact.note=gets.chomp.to_s
				puts "the modified notes are: #{contact.note}"
				
			
			else puts "wrong modification"
			end
		end



	end

    def display(contact_id)
    	@contacts.each { |contact|
    		if contact.id==contact_id
    			puts contact
    		end
    	}
    end



end





