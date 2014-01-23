#coding: utf-8


desc '发送信息'

namespace :send do
  task :email => :environment do

    Crawler::Company.limit(5000).each_with_index do |company, index|
      email = company.email
      if email
        puts "正在发送第#{index.succ}封邮件: #{email}"
        if index.odd?
          UserMailer.company_site_tuiguang1(email)
        else
          UserMailer.company_site_tuiguang2(email)
        end.deliver
      end
    end

  end
end