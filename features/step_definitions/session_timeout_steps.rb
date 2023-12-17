Given(/^I wait for (\d+) minutes and go to (.+)$/) do |minutes, page_name|
    Timecop.travel(Time.now + minutes.to_i * 60) do
      sleep(1)
      visit path_to(page_name)
    end
  end

