require 'sinatra'
if development?
    require 'sinatra/reloader'
end
require './lib/caesar_cipher.rb'

get '/' do
    text = params['message'] || ' '
    shift = params['steps'].to_i
    output = caesar_cipher(text, shift)

    erb :index, :locals => {:output => output }    

end

