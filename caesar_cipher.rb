require 'sinatra'
if development?
    require 'sinatra/reloader'
end

get '/' do
    message = params["message"].to_i
    

    erb :index, :locals => {:number => number, 
        :message => message }    

end


def check_guess(guess)
    if params["guess"].to_i == guess
        "You got it right! The secret number is #{guess}"
        #background = "background-color:#A1D490"     
    elsif params["guess"].to_i > guess
        if params["guess"].to_i > (guess + 5)
            "Way to high!"
            #background = "background-color:#F0501A"
        else
            "Close, but too high!"
           #background = "background-color:#D4A190"
        end
    elsif params["guess"].to_i < guess
        if params["guess"].to_i <(guess - 5)
            "Way to low!"
            #background = "background-color:#F0501A"
        else
            "Close, but too low!"
            #background = "background-color:#D4A190"
        end
        
    end
end