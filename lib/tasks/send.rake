#coding: utf-8


desc '发送信息'

namespace :send do
  task :email => :environment do

    Crawler::Company.limit(1000).each_with_index do |company, index|
      if index.odd?
        UserMailer.company_site_tuiguang1(company.email)
      else
        UserMailer.company_site_tuiguang2(company.email)
      end
    end

  end
end