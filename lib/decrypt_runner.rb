require './lib/enigma'
message = File.open(ARGV[0], "r")
incoming_message = message.read
encrypted_hash = Enigma.new.decrypt(incoming_message, ARGV[2], ARGV[3])

encryption = encrypted_hash[:decryption]
date = encrypted_hash[:date]
key = encrypted_hash[:key]

file_to = File.open(ARGV[1], "w")

file_to.write(encryption)

file_to.close

p "Created #{ARGV[1]} with the key: #{key} and date: #{date}"
