class FeedbackMailer < ActionMailer::Base
  default :from => "from@example.com"
	def feedback_mail(params)
		mail({:to => "abhimanyusaxena@gmail.com"})
	end
end
