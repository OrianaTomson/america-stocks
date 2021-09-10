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

    desc "tradingViewからcontainer_idを引っ張ってくる"
    task :sample2 => :environment do
        driver = Selenium::WebDriver.for :chrome
        driver.navigate.to "https://jp.tradingview.com/widget/advanced-chart/"
        inputElement = driver.find_element(:id, 'symbol')

        # 銘柄コード取得
        codes= ["A",
                "AA",
                "AADI",
                "AAL",
                "AAN",
                "AAOI",
                "AAON",
                "AAP",
                "AAPL",
                "AATC",
                "AAU",
                "AAWW"]

        codes.each do |code|
            inputElement.clear
            inputElement.send_keys code
            submitElement = driver.find_element(:id, 'apply')
            submitElement.click
    
            outputElement = driver.find_element(:id, 'output')
            container_id = nil
            outputElement.attribute("value").split(/\n/).each do |text|
                if text.include?("container_id")
                    container_id = text.split(":")[1].gsub(/\"|^ /,"")
                    break
                end
            end

            TradingView.create(code: code, container_id: container_id)
        end

        driver.quit
    end
end
