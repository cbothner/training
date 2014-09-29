module TraineesHelper
  def interest_link(name)
    '<input type="button" class="interest_link" data-interest="'+name.capitalize+'" value="'+name.capitalize+'" />'
  end
end
