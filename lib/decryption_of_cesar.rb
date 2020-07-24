require 'faraday'
require 'json'
require_relative 'visuals.rb'
require_relative 'get_api.rb'

class Analyze_command
  attr_accessor :command, :visuals, :commands, :unity

  def initialize(command, visuals)
    @command = command
    @visuals = visuals
    @unity = 3
    return @visuals.helpers if @command == '--helper'

    case command.split(' ')[1]
    when '-api'
      @commands = GetApi.new(command.split(' ')[0], @unity)
    end
  end
end

visuals = Visuals.new
command = gets.chomp
analyze_command = Analyze_command.new(command, visuals)
