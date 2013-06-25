Given(/^a greeter$/) do
  @greeter = CucumberGreeter.new
end

When(/^I send it the greet message$/) do
  @greeting = @greeter.greet
end

Then(/^I should see "(.*?)"$/) do |expected|
  @greeting.should == expected
end

class CucumberGreeter

  def greet
    "Hello Cucumber!"
  end

end