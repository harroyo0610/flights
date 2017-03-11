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
    @passengers = data_user[2].to_i
    @flights_avaiable = Flight.where(date: date, to: to, from: from)
  end

  def reserv
    redirect_to controller: 'flights', action: 'new'
  end

  def new
    @passengers = []
    @passengers << params[:passengers].to_i
    flight = Flight.find(params[:id])
    @passengers << flight
  end

  def create
    array_comprador = []
    array_users = []
    counter = 1
    array_new = []
    b = Booking.create(flight_id: params[:id].to_i, reservation_number: rand(0..10000), total: 0)
    params.each do |key, value|
      name = "bookin" + counter.to_s
      email = "booking" + counter.to_s
      if key == name
         array_new << value
      elsif key == email
         array_new << value
         array_users << array_new
         array_new = []
         counter += 1 
      elsif key == "name_c"
        array_comprador << value
      elsif key == "email_c"
        array_comprador << value
        @user = User.create(name: array_comprador[0], email: array_comprador[1])
        flight = Flight.find(params[:id]) 
        UserFlight.create(user_id: @user.id, flight_id: flight.id) 
        passengers = flight.passengers - params[:passengers].to_i
        flight.update(passengers: passengers)
        @booking = Booking.last
        p "**"*50
        p @user
        user_booking = UserBooking.create(user_id: @user.id, booking_id: @booking.id)   
        p "-" * 50      
        p user_booking
      end  
    end
    array_users.each do |user|
      User.create(name: user[0], email: user[1])
    end
    total = array_users.count * Flight.find(params[:id]).cost
    b.update(total: total)
    redirect_to controller: 'flights', action: 'buy', data: @booking
  end

  def buy
     @booking = Booking.find(params[:data].to_i)
     @flight = @booking.flight
  end
end
