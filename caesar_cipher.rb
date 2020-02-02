require 'sinatra'
if development?
    require 'sinatra/reloader'
end

get '/' do
    text = params['message'] || ' '
    shift = params['steps'].to_i
    output = caesar_cipher(text, shift)

    erb :index, :locals => {:output => output }    

end


def alphabet?(letter)
    ord = letter.ord
    return (ord >= 65 && ord <= 90) || (ord >= 97 && ord <= 122)
end

def caesar_cipher(text, shift)
    result = ''
    text.split('').each do |letter|
    pos = letter.ord + shift
    if alphabet?(letter)
        result += alphabet?(pos.chr) ? pos.chr : (pos - 26).chr
    else 
        result += letter
    end
end
    return result
end