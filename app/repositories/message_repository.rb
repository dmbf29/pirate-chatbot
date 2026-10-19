class MessageRepository
  def initialize
    @messages = []
  end

  def create(message)
    @messages << message
  end

  def all
    @messages
  end
end
