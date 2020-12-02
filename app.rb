require_relative 'config/environment'
require 'pry'
class App < Sinatra::Base
  get '/reversename/:name' do
    @name = params[:name].reverse
    "#{@name}"
  end

  get '/square/:number' do
    @num = params[:number].to_i
    "#{@num * @num}"
  end

  get '/say/:number/:phrase' do
    params[:phrase] * params[:number].to_i
  end

  get '/say/:word1/:word2/:word3/:word4/:word5' do
    @words = []
    @words << params[:word1]
    @words << params[:word2]
    @words << params[:word3]
    @words << params[:word4]
    @words << params[:word5]
    phrase = @words.join(" ")
    "#{phrase}."
  end

  get '/:operation/:number1/:number2' do
    @num1 = params[:number1].to_i
    @num2 = params[:number2].to_i
    @operator = params[:operation]
    if @operator == "add"
      @operator = :+
    elsif @operator == "subtract"
      @operator = :-
    elsif @operator == "multiply"
      @operator = :*
    elsif @operator == "divide"
      @operator = :/
    end
    @num1.public_send(@operator, @num2).to_s
  end

end