require './ticket_utils'

YINGWO_CODE = "yw_num"
YINGZUO_CODE = "yz_num"

# # RestClient.get 'https://kyfw.12306.cn/otn/leftTicket/query', {:accept => :json, :params => {"leftTicketDTO.train_date" => "2015-04-30", "leftTicketDTO.from_station" =>"XAY", "leftTicketDTO.to_station" => "CQW", :purpose_codes => "ADULT"}}

def dp sth
  p sth if ENV["DEBUG"] == "y"
end

BUY_TICKET = 'https://kyfw.12306.cn/otn/confirmPassenger/initDc'

def main

  tu = TicketUtils.new "2015-04-30", "XAY", "CQW", "ADULT"
  while true
    t = tu.query_ticket
    ticket_num = t.get_num_for "K1002", YINGWO_CODE
    dp ticket_num
    if(ticket_num != "--" && ticket_num != "无")
      TerminalNotifier.notify('get ' + ticket_num, :open => BUY_TICKET, :sound => 'default')
      break
    end
    sleep 1
  end
end

main