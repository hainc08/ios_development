class MailerController < ApplicationController

	def sendMailForgotPass
		render :nothing => true

		id = params[:myId]
		uid = 0
		email = ''
		nickName = ''
		password = ''

		@users = User.where(:email => id)
		@users.each do |user|
			uid = user.id
			email = user.email
			nickName = user.nickname
		end

		@mp = Masterpassword.where(:user_id => uid)
		@mp.each do |m|
			password = m.masterpassword
			Message.forgotPass(email, nickName, password).deliver
		end
	end

	def sendRegistEmail
          retString = "success"
		
		if User.where(:email => params[:email]).exists? then
		  retString = "registered"
		else
		  begin
	            Message.registEmail(params[:email]).deliver
		  rescue Exception => exception
		    p exception
		    if exception.message.include?("User unknown in virtual mailbox table") then
		      retString = "user_unknown_in_mailbox"
		    elsif exception.message.include?("Name or service not known") then
		      retString = "name_or_service_not_known"
		    else
		      retString = "other_errors"
		    end
                    p exception.message
                  else
                    #retString = "success"
		  end
		end

                #p retString
                respond_to do |format|
                  format.json { render :json => retString }
                end
	end
end
