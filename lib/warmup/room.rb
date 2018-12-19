class Warmup
  class Room
    attr_reader :id, :name, :floor, :target

    def initialize(agent, dom)
      @agent = agent
      @id = dom.search('#room-options a:first').attribute('href').value.scan(/\d+/).first.to_i
      @name = dom.search('h1').text

      content = dom.search('+.content-block')
      @floor = content.search('h2:contains("Floor") + h1').text.scan(/\d+/).first.to_f
      @target = content.search('h2:contains("Target") + h1').text.scan(/\d+/).first.to_f
    end

    def set(temp, duration = 9999)
      if temp
        page = @agent.get("https://my.warmup.com/home/room/#{@id}")
        page.form_with(action: '/setoverride') do |form|
          form.overrideTemp = temp
          form.overrideDur = duration
        end.click_button.code === '200'
      else
        @agent.get("https://my.warmup.com/cancelrunmode/#{@id}").code === '200'
      end
    end
  end
end