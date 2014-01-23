class UserMailer < ActionMailer::Base
  default from: Setting::Smtp.config.user_name

  def company_site_tuiguang1(emails)
    mail( :subject => '属于您的招聘网站',
          :to => emails,
          :date => Time.now
        )
  end

  def company_site_tuiguang2(emails)
    mail( :subject => '属于您的招聘网站',
          :to => emails,
          :date => Time.now
        )
  end

end
