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
    task :get_container_ids => :environment do
        driver = Selenium::WebDriver.for :chrome
        driver.navigate.to "https://jp.tradingview.com/widget/advanced-chart/"
        inputElement = driver.find_element(:id, 'symbol')
        submitElement = driver.find_element(:id, 'apply')
        outputElement = driver.find_element(:id, 'output')

        # 銘柄コード取得
        codes = Stock.all.map{|tv| tv.code}

        codes.each do |code|
            container_id = nil
            inputElement.clear
            inputElement.send_keys code
            submitElement.click
            
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
