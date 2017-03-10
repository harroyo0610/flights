class FlightsController < ApplicationController
  def home
    @user = User.new
  end

  def search
    data_user = [params[:home][:from], params[:home][:to], params[:home][:passengers],  params[:home][:date]]

    redirect_to controller: 'flights', action: 'index', data: data_user
  end

  def index
    data_user = params[:data]
    from = data_user[0]
    to = data_user[1]
    date = data_user[3]
    passengers = data_user[2].to_i
    @flights_avaiable = Flight.where(date: date, to: to, from: from)
  end

  def reserv
    redirect_to controller: 'flights', action: 'new'
  end

  def new
    
  end

  def create
    
  end

  def buy
    
  end
end
