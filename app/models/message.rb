class Message
  attr_reader :role, :content

  def initialize(attributes = {})
    @role = attributes[:role]
    @content = attributes[:content]
  end
end
