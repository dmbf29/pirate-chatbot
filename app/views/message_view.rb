class MessageView
  def display_list(messages)
    messages.each do |message|
      prefix = message.role == "user" ? "You" : "🏴‍☠️"
      puts "#{prefix}: #{message.content}"
    end
  end

  def ask_for_input
    puts "Your message?"
    print "> "
    gets.chomp
  end

  def display_one(message)
    prefix = message.role == "user" ? "You" : "🏴‍☠️"
    puts "#{prefix}: #{message.content}"
  end
end
