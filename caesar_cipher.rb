require 'sinatra'
if development?
    require 'sinatra/reloader'
end


ALPHABET_SIZE = 26

def caesar_cipher(string, shift)
  shiftyArray = []
  charLine = string.chars.map(&:ord)
    #shift = @@steps
    ALPHABET_SIZE.times do |shift|
    shiftyArray << charLine.map do |c|
      ((c + shift) < 123 ? (c + shift) : (c + shift) - 26).chr
    end
    shiftyArray.join
  end

shiftyArray
end

get '/' do
    steps = params["steps"].to_i
    message = params['message']
    output = caesar_cipher(message, steps)

    erb :index, :locals => {:output => output, 
    :message => message, :steps => steps }    

end


