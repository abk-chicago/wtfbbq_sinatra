#colourize written by code-for-coffee
#james@codeforcoffee.org
#usage: c = Colourize.new
#c.log(:colour, output_variable)
#valid colours:
#:black, :red, :green, :yellow, :blue, :magenta, :cyan, :white, :aqua, :silver, :aliceblue, :indianred
class Colourize
  require 'rainbow'
  def initialize
    @valid_colours = [:black, :red, :green, :yellow, :blue, :magenta, :cyan, :white, :aqua, :silver, :aliceblue, :indianred]
  end

  def log(colour, data)
    puts Rainbow(data.to_s).send(colour)
  end
end
c = Colourize.new
c.log(:magenta, "yolo swag colourize in the sinatra apppssss")
