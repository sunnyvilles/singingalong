module ApplicationHelper
  
  def error_messages_for( object )
    render(:partial => 'shared/error_messages', :locals => {:object => object})
  end

def date_dmY(date)
  if date.nil?
    ""
  else
    date.strftime("%d-%m-%Y")
  end
end

end
