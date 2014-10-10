module TraineesHelper
  def interest_link(name)
    '<input type="button" class="interest_link" data-interest="'+name+'" value="'+
      name+'" />'
  end
  
  def interest_links(list)
    list.map{ |i| interest_link i }.join.html_safe
  end
end
