class Message < MailForm::Base
  attribute :name,          :validate => true
  attribute :email,         :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  #attribute :message_title, :validate => true
  attribute :feedback,  :validate => true
  attribute :mail_to,  :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  def headers
    {
      :subject => "inquiry mail",
      :to => %("#{mail_to}"),
      :from => %("#{name}" <#{email}>)
    }
  end



end