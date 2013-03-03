# -*- coding: utf-8 -*-
class Usermail < ActionMailer::Base
  default from: "takuya@ep.sci.hokudai.ac.jp"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.usermail.newuser.subject
  #
  def newuser
    @greeting = "Hi"
    mail(
         :to => "takuya@ep.sci.hokudai.ac.jp",
         :subject => '通知メール',
         :return_path => "takuya@ep.sci.hokudai.ac.jp"
          )
  end
end
