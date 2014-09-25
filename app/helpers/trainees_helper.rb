module TraineesHelper
  def interest_link(name)
    '<a style="color:#009bf9" class="interest_link" data-interest="'+name.capitalize+'">'+name.capitalize+'</a>'
  end
end
