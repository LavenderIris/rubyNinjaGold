class NinjaGoldsController < ApplicationController
  def index
  	if session.key?("gold") == false
  		session[:gold] = 0
  		session[:activity] = []
  	end 
  	render "ninja_golds/index.html.erb"
  end

  def add_money
  	session[:building] = params[:building]

    r = Random.new

    color = "green"
    time = Time.new
    if params[:building] == "farm"
    	num =  r.rand(10...20)
    	loc = "farm"
    elsif params[:building] == "cave"
    	num = r.rand(5...10)
    	loc = "cave"
    elsif params[:building] == "house"
    	num = r.rand(2...5)
    	loc = "house"
    elsif params[:building] == "casino"
    	num = r.rand(-50...50)
    	loc = "casino"
    	if num < 0
    	 	color = "red"
    	 	activity = ["red","Entered a casino and lost #{num} gold #{time.inspect}"]
    	 	session[:activity].push(activity)
    	end
    	
    end
  
    
    if color == "green"
    	activity = ["green","Earned #{num} gold from the #{loc}! #{time.inspect}"]
    	session[:activity].push(activity)
    end

    session[:gold] += num

  	redirect_to ''
  end


  def reset
  	reset_session
  	redirect_to ''
  end

end
