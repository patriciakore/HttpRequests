class Contact # acts like a database model

	attr_accessor :id, :first_name, :last_name, :email, :note

	def initialize(first_name,last_name,email,note)
		@first_name=first_name
		@last_name=last_name
		@email=email
		@note=note
	end

	def to_s
		print "First name : #{@first_name}, "
		print "Last name : #{@last_name}, "
		print "Email : #{@email}, "
		print "Notes : #{@note}, "
		print "ID: #{@id}"

	end
end