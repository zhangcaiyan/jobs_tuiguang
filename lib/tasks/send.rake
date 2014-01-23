#coding: utf-8


desc '发送信息'

namespace :send do
  task :email => :environment do

    i=1
    array_count = 40
    email_regex=/\A([\w\!\#\z\%\&\'\*\+\-\/\=\?\\A\`{\|\}\~]+\.)*[\w\+-]+@((((([a-z0-9]{1}[a-z0-9\-]{0,62}[a-z0-9]{1})|[a-z])\.)+[a-z]{2,6})|(\d{1,3}\.){3}\d{1,3}(\:\d{1,5})?)/i
    emails = Crawler::Company.limit(2000).collect{|c| c.email.split(/，|,|\/|;/).collect{|email| email.match(email_regex).to_s }}.flatten.select{|email| email if email.present?}.compact
    emails.in_groups(2).each_with_index do |children_emails, n|
      children_emails.in_groups_of(array_count).each do |send_emails|
        puts "正在发送第#{i}次邮件,每次#{array_count}封邮件:  #{send_emails.join(", ")}"
        if n.odd?
          UserMailer.company_site_tuiguang1(send_emails).deliver
        else
          UserMailer.company_site_tuiguang2(send_emails).deliver
        end
        i+=1
      end

    end

  end
end