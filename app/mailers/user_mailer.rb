class UserMailer < ActionMailer::Base
  default from: "cnjobs_tuiguang@163.com"

  def company_site_tuiguang1(email)
    mail( :subject => '属于您的招聘网站',
          :to => email,
          :date => Time.now
        )
  end

  def company_site_tuiguang2(email)
    mail( :subject => '属于您的招聘网站',
          :to => email,
          :date => Time.now
        )
  end

end
