require 'rest-client'
require 'json'
require 'terminal-notifier'
require './ticket'

QUERY_URL = 'https://kyfw.12306.cn/otn/leftTicket/query'
LEFT_DATE = "leftTicketDTO.train_date"
STATION_FROM = "leftTicketDTO.from_station"
STATION_TO = "leftTicketDTO.to_station"
TYPE = "purpose_codes"

class TicketUtils

  def initialize date, from, to, type
    @date = date
    @from = from
    @to = to
    @type = type
  end

  def query_ticket
    r = RestClient.get QUERY_URL,
                   {
                       :accept => :json,
                       :params =>
                           {
                               LEFT_DATE => @date,
                               STATION_FROM => @from,
                               STATION_TO => @to,
                               TYPE => @type
                           }
                   }
    Ticket.new JSON.parse(r)
  end

end