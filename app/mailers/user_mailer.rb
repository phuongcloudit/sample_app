# frozen_string_literal: true

class UserMailer < ApplicationMailer
  def account_activation user
    @user = user
    mail to: user.email, subject: t("acc_act")
  end

  def password_reset user
    @user = user
    mail to: user.email, subject: t("pass_re")
  end
end
