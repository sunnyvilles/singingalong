class Message < MailForm::Base
  attribute :name,          :validate => true
  attribute :email,         :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  #attribute :message_title, :validate => true
  attribute :feedback,  :validate => true

  def headers
    {
      :subject => "inquiry mail",
      :to => "to_u_name@gmail.com",
      :from => %("#{name}" <#{email}>)
    }
  end



end