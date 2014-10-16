module TraineesHelper
  def interest_link(name)
    '<input type="button" class="interest_link" data-interest="'+name+'" value="'+
      name+'" />'
  end
  
  def interest_links(list)
    list.map{ |i| interest_link i }.join.html_safe
  end

  def approval_button(field)
    ('<input type="button" class="approval_button" data-field="'+field+
     '" data-date="'+"#{Date.today.to_date}"+'" value="Approve" />').html_safe
  end

  def grey(text)
    ('<span class="grey">'+text+'</span>').html_safe
  end

  def needs_statement(trainee)
    trainee.status == 'community' || !trainee.statement.blank?
  end
end
