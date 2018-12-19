require 'mechanize'
require_relative './warmup/room'

class Warmup
  VERSION = '0.0.1'

  def initialize(login, password)
    @agent = Mechanize.new

    login(login, password)
  end

  def rooms(refresh = false)
    return @rooms if @rooms && !refresh

    page = @agent.get('https://my.warmup.com/home')
    @rooms = page.search('.room').map do |room|
      Room.new(@agent, room)
    end
  end

  def room(id)
    rooms.select { |r| r.id === id }.first
  end


  private

  def login(login, password)
    page = @agent.get('https://my.warmup.com/login')
    page.form_with(action: '/login') do |form|
      form.login = login
      form.password = password
    end.click_button.code === '200'
  end
end