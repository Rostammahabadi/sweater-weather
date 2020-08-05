class Error
  def city_state_combo
    {error: "Incorrect city/state combination"}
  end

  def invalid_api_key
    {error: "Invalid API key"}
  end

  def no_api_key
    {error: "Provide an API Key"}
  end

  def user_doesnt_exist
   {error: "User does not exist"}
  end

  def incorrect_password
    {error: "Incorrect password"}
  end

  def user_errors(user)
    errors= {}
    array = user.errors.messages.each_with_object([]) do |message, arr|
      arr << message.join(" ")
    end
    errors[:error] = array
    @errors = errors
  end
end
