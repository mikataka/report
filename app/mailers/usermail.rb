# -*- coding: utf-8 -*-
class Usermail < ActionMailer::Base
  default from: "suu@ep.sci.hokudai.ac.jp"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.usermail.newuser.subject
  #
  def newuser(ownername, username, ownermail, usermail)
    @ownername = ownername
    @username = username
    @ownermail = ownermail
    @usermail = usermail

    @greeting = "Hi"
    mail(
         :to => "#{@usermail}, #{@ownermail}",
         :subject => '通知メール',
         :return_path => "#{@ownermail}"
          )
  end
  def accepteduser(ownername, username, ownermail, usermail)
    @ownername = ownername
    @username = username
    @ownermail = ownermail
    @usermail = usermail

    @greeting = "Hi"
    mail(
         :to => "#{@usermail}, #{@ownermail}",
         :subject => '通知メール',
         :return_path => "#{@ownermail}"
          )
  end
end
