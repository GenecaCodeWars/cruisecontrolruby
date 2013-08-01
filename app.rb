# app.rb
require "sinatra"
require "active_support/all"
require_relative "models/command"

def createMoveCommand(vesselid, direction)
  command = Command.new
  command.vesselid = vesselid
  command.action = 'move:' + direction
  command
end

def createFireCommand(vesselid)
  command = Command.new
  command.vesselid = vesselid
  command.action = 'fire'
  command.coordinate = { :X => 1, :Y => 1 }
  command
end

def createCommands
  commands = []  
  commands << createMoveCommand(1, 'north')
  commands << createFireCommand(2)
  commands << createMoveCommand(2, 'south')
  commands
end

get '/' do
  createCommands.to_json
end

post '/command' do
  status = JSON.parse(request.body.read)
  
  puts "New game has started, I should probably reset" if status["RoundNumber"] == 0
  createCommands.to_json
end
