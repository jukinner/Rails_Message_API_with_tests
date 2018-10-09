module SmsTool
	def self.send_sms(num, msg, app)
		puts 'Sending Message...'
		puts "#{msg} to #{num} from #{app}"
	end
end