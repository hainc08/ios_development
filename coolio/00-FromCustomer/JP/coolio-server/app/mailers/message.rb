class Message < ActionMailer::Base
  default :from => "do_not_reply@coolboys.jp"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.message.forgotPass.subject
  #
  def forgotPass(email, nickName, password)
    mail(
      :to => email,
      :subject => 'Coolio Password',
      :body => "\n\nHi," + nickName + "\n\n Your password is...\n\n パスワードをお知らせします。 \n[ " + password + " ] \n\n do_not_reply@coolboys.jp"
    )
  end

  def registEmail(email)
    mail(
      :to => email,
      :subject => 'Please verify your email address',
      :body => "\n\nDear, " + email +
               "\n\nThanks for creating an account with Coolio." +
               "\nClick below to confirm your email address:" +
               "\nhttp://coolio.coolboys.jp/redirect.html?e=" + email +
               "\n\nPlease set your pictures and profile." +
               "\nPassword will be set when you use at first login." +
               "\n\nThanks," +
               "\nCoolio Support\n" + 

               "\n\n" + email + " さん" +
               "\n\nCoolioへの登録ありがとうございました。" +
               "\nメールアドレスを確認するため下記のアドレスをクリックしてください。" +
               "\nhttp://coolio.coolboys.jp/redirect.html?e=" + email +
               "\n\nパスワードは初回ログオン時に設定されます。" +
               "\nプロフィールの設定と画像の登録を行ってください。" +
               "\n\nCoolio サポートチーム"
      )
  end

end
