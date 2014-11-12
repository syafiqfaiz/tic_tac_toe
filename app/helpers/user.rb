helpers do
  def login
    if session[:id] != nil
      true
    else
      false
    end
  end
end
