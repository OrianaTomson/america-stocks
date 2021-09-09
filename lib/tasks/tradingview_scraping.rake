require 'selenium-webdriver'

namespace :tradingview_scraping do
    desc "実行処理の説明"
    task :sample do
        driver = Selenium::WebDriver.for :chrome
        driver.navigate.to "https://www.google.co.jp/"
        inputElement = driver.find_element(:name, 'q')
        inputElement.send_keys "パンケーキ"
        submitElement = driver.find_element(:name, 'btnK')
        submitElement.click
        driver.quit
        puts "Hello World"
    end
end
