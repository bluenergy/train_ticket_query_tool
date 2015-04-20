class Ticket

  DATA = "data"
  QUERY_STRING = "queryLeftNewDTO"
  TRAIN_STATION_CODE = "station_train_code"

  def initialize tickets_info
    @all_trains = tickets_info[DATA]
    @num = @all_trains.size
  end

  def get_num_for train_code, type
    @num.times do |e|
      ticket_info = @all_trains[e][QUERY_STRING]
      @tickets_left = ticket_info[type] if ticket_info[TRAIN_STATION_CODE] == train_code
    end

    @tickets_left
  end



end