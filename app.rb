require_relative 'config'
require_relative 'app/repositories/message_repository'
require_relative 'app/controllers/messages_controller'
require_relative 'app/routers/message_router'

repository = MessageRepository.new
controller = MessagesController.new(repository)
message_router = MessageRouter.new(controller)

# Start the app
message_router.run
