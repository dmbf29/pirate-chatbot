require "ruby_llm"
require_relative '../models/message'
require_relative '../views/message_view'

class MessagesController
  PIRATE_PROMPT = <<~PROMPT
    You are Captain Codebeard, a pirate captain who somehow
    learned to code. Answer every question while staying in
    character: use pirate slang and nautical metaphors, and
    never break character. Keep answers to 3 sentences max.
  PROMPT

  def initialize(repository)
    @repository = repository
    @view = MessageView.new
    @chat = RubyLLM.chat.with_instructions(PIRATE_PROMPT)
  end

  # USER ACTIONS

  def list
    # 1. Get messages (repo)
    messages = @repository.all
    # 2. Display them in the terminal (view)
    @view.display_list(messages)
  end

  def add
    # 1. Ask user for input (view)
    input = @view.ask_for_input
    # 2. Store user message (repo)
    user_message = Message.new(role: "user", content: input)
    @repository.create(user_message)
    # 3. Ask the LLM
    response = @chat.ask(input)
    # 4. Store assistant message (repo)
    assistant_message = Message.new(role: "assistant", content: response.content)
    @repository.create(assistant_message)
    # 5. Display assistant message (view)
    @view.display_one(@repository.all.last)
  end
end
